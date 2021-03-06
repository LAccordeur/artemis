package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.FileImportProduct;
import com.kuo.artemis.server.core.dto.FileMetaData;
import com.kuo.artemis.server.core.dto.excel.*;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.exception.FileParseException;
import com.kuo.artemis.server.core.factory.FactoryManager;
import com.kuo.artemis.server.core.helper.ExcelHelper;
import com.kuo.artemis.server.core.helper.QCloudHelper;
import com.kuo.artemis.server.core.thread.ImportExcelTask;
import com.kuo.artemis.server.dao.*;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.FileService;
import com.kuo.artemis.server.util.ValidationUtil;
import com.kuo.artemis.server.util.common.BeanUtil;
import com.kuo.artemis.server.util.common.StringUtil;
import com.kuo.artemis.server.util.constant.DataTypeConst;
import com.kuo.artemis.server.util.constant.FileTypeConst;
import com.kuo.artemis.server.util.constant.OperationTypeConst;
import org.json.HTTP;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * @Author : guoyang
 * @Description :   TODO ##NEW## 1.原料管理的加入 需要文件导出重构考虑  后期还有word文件 导入导出工厂？  2.导出数据的排序问题
 * @Date : Created on 2017/11/27
 */
@Service
public class FileServiceImpl implements FileService {


    @Inject
    private AnimalGrowthRecordMapper animalGrowthRecordMapper;

    @Inject
    private AnimalGutMicrobiotaRecordMapper animalGutMicrobiotaRecordMapper;

    @Inject
    private AnimalIndicatorMapper animalIndicatorMapper;

    @Inject
    private AnimalIndicatorRecordMapper animalIndicatorRecordMapper;

    @Inject
    private AnimalMapper animalMapper;

    @Inject
    private FileRecordMapper fileRecordMapper;

    @Inject
    private ExcelFileDetailMapper excelFileDetailMapper;

    @Inject
    private MaterialMapper materialMapper;

    @Inject
    private NutritionStandardMapper nutritionStandardMapper;

    private ExecutorService executorService = Executors.newCachedThreadPool();


    /**
     * 列出当前课题下的共享文件列表
     * @param projectId
     * @return
     */
    public Response listCommonFiles(String projectId) {
        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        List<FileRecord> fileRecordList = fileRecordMapper.selectCommonFilesByProjectId(Integer.valueOf(projectId));
        return new Response(fileRecordList, HttpStatus.OK.value(), "文件列表");
    }

    /**
     * 删除某个共享文件（伪删除）
     * @param fileId
     * @return
     */
    public Response deleteCommonFile(String fileId) {
        if (fileId == null || "".equals(fileId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }
        Integer status = fileRecordMapper.deleteCommonFileById(Integer.valueOf(fileId));
        if (status > 0) {
            return new Response(HttpStatus.OK.value(), "删除成功");
        }

        return new Response(HttpStatus.NO_CONTENT.value(), "删除对象不存在");
    }

    /**
     * 上传某个共享文件
     * @param command
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response uploadCommonFile(FileImportCommand command) throws FileParseException {

        try {
            ValidationUtil.getInstance().validateParams(command);
        } catch (Exception e) {
            e.printStackTrace();
            return new Response(e);
        }

        //1.获取参数
        Integer userId = Integer.valueOf(command.getUserId());
        Integer projectId = Integer.valueOf(command.getProjectId());
        MultipartFile file = command.getFile();

        //2.将文件基本信息保存到本地服务器
        String originalFilename = file.getOriginalFilename();
        InputStream inputStream;
        try {
            inputStream = file.getInputStream();
        } catch (Exception e) {
            return new Response(e);
        }
        StringBuilder filename = new StringBuilder();
        StringBuilder key = new StringBuilder();
        //检测是否存在同名文件，有的话进行重命名
        Integer status = fileRecordMapper.selectCountByCommonFilename(projectId, originalFilename);
        if (status > 0) {
            String[] filenameItems = StringUtil.splitFilename(originalFilename);
            if (filenameItems != null) {
                String prefix = filenameItems[0];
                String suffix = filenameItems[1];
                filename.append(prefix).append("_").append(status+1).append(".").append(suffix);
                key.append("/").append(projectId).append("/").append(filename.toString());
            } else {
                return new Response(HttpStatus.BAD_REQUEST.value(), "文件名无效");
            }
        } else {
            filename.append(originalFilename);
            key.append("/").append(projectId).append("/").append(filename.toString());
        }
        //新增本地记录
        FileRecord fileRecord = new FileRecord();
        fileRecord.setOperationType(Byte.valueOf(OperationTypeConst.UPLOAD_COMMON));
        fileRecord.setUserId(userId);
        fileRecord.setProjectId(projectId);
        fileRecord.setFilename(originalFilename);
        fileRecord.setFileIdentifier(key.toString());
        fileRecord.setFileType(Byte.valueOf(getFileTypeByFilename(originalFilename)));
        fileRecord.setVersion(status+1);
        fileRecordMapper.insertSelective(fileRecord);

        try {
            //3.将源文件上传到腾讯云
            FileMetaData fileMetaData = new FileMetaData(file.getSize(), file.getContentType());
            Boolean updateStatus = QCloudHelper.updateFile(inputStream, key.toString(), fileMetaData);
            if (updateStatus) {
                return new Response(HttpStatus.OK.value(), "上传成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new FileParseException(e);
        }
        return new Response(HttpStatus.INTERNAL_SERVER_ERROR.value(), "上传失败");
    }

    private String getFileTypeByFilename(String filename) {
        if (filename == null || "".equals(filename)) {
            return FileTypeConst.UNDEFINED;
        }

        if (filename.endsWith(".xlsx") || filename.endsWith(".xls")) {
            return FileTypeConst.EXCEL;
        } else if (filename.endsWith(".docx") || filename.endsWith(".doc")) {
            return FileTypeConst.WORD;
        } else if (filename.endsWith(".pdf")) {
            return FileTypeConst.PDF;
        } else {
            return FileTypeConst.UNDEFINED;
        }
    }

    /**
     * 接收用户上传的Indicator excel文件并解析导入至数据库中   TODO ##BUG## 3.未进行计算指标的更新  1.未进行上传记录更新（已解决） 2.未考虑数据历史记录（已解决目前采用多次存储的简单粗暴的方法）
     * @param command                 TODO ##NEW## 后期可考虑将源文件单独保存至云存储中
     * @return
     * @throws Exception
     */
    @Deprecated
    @Transactional(rollbackFor = Exception.class)
    public Response parseAndSaveIndicatorExcel(ExcelImportCommand command) throws Exception {


        /* 解析 */
        //1.将Excel文件解析
        IndicatorExcelImportDTO indicatorExcelImportDTO = ExcelHelper.parseIndicatorExcel(command);

        //2.依次将List中的每一行数据转化为改行所对应的对象
        Map<Class, List<Object>> resultMap = new HashMap<Class, List<Object>>();
        Map<Class, List<Map<String, Object>>> map = indicatorExcelImportDTO.getMultiItems();
        Set<Map.Entry<Class, List<Map<String, Object>>>> set = map.entrySet();
        Iterator<Map.Entry<Class, List<Map<String, Object>>>> iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry<Class, List<Map<String, Object>>> entry = iterator.next();
            Class clazz = entry.getKey();
            List<Map<String, Object>> value = entry.getValue();
            List<Object> objectList = new ArrayList<Object>();
            for (int i = 0; i < value.size(); i++) {
                Object object = ExcelHelper.parseExcelRowToBean(clazz, value.get(i));
                objectList.add(object);
            }
            resultMap.put(clazz, objectList);
        }


        //3.导入数据至数据库
        //由于外键约束，首先导入animal数据
        List animalList = resultMap.get(Animal.class);
        if (animalList != null) {
            animalMapper.insertBatch(animalList);
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "缺少标识id");
        }


        List growthList = resultMap.get(AnimalGrowthRecord.class);
        if (growthList != null) {
            animalGrowthRecordMapper.insertBatch(growthList);
        }

        List gutList = resultMap.get(AnimalGutMicrobiotaRecord.class);
        if (gutList != null) {
            animalGutMicrobiotaRecordMapper.insertBatch(gutList);
        }



        /*List<BaseMapper> mappers = new ArrayList<BaseMapper>();   //##BUG##  目前是写死的 后期需要动态加载
        mappers.add(animalGrowthRecordMapper);
        mappers.add(animalGutMicrobiotaRecordMapper);
        //mappers.add(animalMapper);

        resultMap.remove(Animal.class);
        ImportExcelTask task = new ImportExcelTask(resultMap, mappers);

        List<Future<Integer>> futures = new ArrayList<Future<Integer>>();
        for (int i = 0; i < set.size(); i++) {
            Future<Integer> future = executorService.submit(task);
            futures.add(future);
        }*/

        //4.更新文件上传记录
        FileRecord fileRecord = new FileRecord();
        fileRecord.setFilename(command.getFilename());
        fileRecord.setFileType(Byte.valueOf(FileTypeConst.EXCEL));  //Excel
        fileRecord.setOperationType(Byte.valueOf(OperationTypeConst.UPLOAD));    //upload
        fileRecord.setUserId(Integer.valueOf(command.getUserId()));
        fileRecord.setProjectId(Integer.valueOf(command.getProjectId()));
        fileRecordMapper.insertSelective(fileRecord);

        //5.更新excel文件上传详细记录
        List<ExcelFileDetail> excelFileDetails = new ArrayList<ExcelFileDetail>();
        List<String> indicatorEnglishNames = indicatorExcelImportDTO.getInitFields();
        List<AnimalIndicator> animalIndicators = animalIndicatorMapper.selectByFields(indicatorEnglishNames);
        for (int i = 0; i < animalIndicators.size(); i++) {
            ExcelFileDetail excelFileDetail = new ExcelFileDetail();
            excelFileDetails.add(excelFileDetail);

            AnimalIndicator indicator = animalIndicators.get(i);
            excelFileDetail.setFileRecordId(fileRecord.getId());
            excelFileDetail.setIndicatorName(indicator.getIndicatorNameEnglish());
            excelFileDetail.setIndicatorId(indicator.getId());
            excelFileDetail.setTableName(String.valueOf(indicator.getIndicatorType()));
        }
        excelFileDetailMapper.insertBatch(excelFileDetails);

        /*//6.判断数据是否全部导入数据库中
        for (Future<Integer> future : futures) {
            if (future.isDone()) {
                continue;
            } else {
                while (!future.isDone()) { }
            }
        }

        for (Future<Integer> future : futures) {
            if (future.get() > 0) {
                continue;
            } else {
                return new Response(HttpStatus.BAD_REQUEST.value(), "upload failure");
            }
        }*/

        return new Response(indicatorExcelImportDTO.getItems(), HttpStatus.OK.value(), "upload success");
    }

    @Deprecated
    public Response parseAndSaveMaterialExcel(ExcelImportCommand command) throws Exception {

        ExcelImportDTO excelImportDTO = null;
        //1.解析文件
        if (DataTypeConst.MATERIAL.equals(command.getDataType())) {
            excelImportDTO = ExcelHelper.parseMaterialExcel(command);
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "该文件数据无法解析");
        }

        //2.将每行数据转化为对应的对象
        List<Map<String, Object>> data = excelImportDTO.getItems();
        List<Material> materialList = new ArrayList<Material>();
        for (int i = 0; i < data.size(); i++) {
            Material material = BeanUtil.dataBind(Material.class, data.get(i));
            materialList.add(material);
        }

        //3.将数据导入至数据库中
        List<Material> materialListFromDB = materialMapper.selectByUserId(Integer.valueOf(command.getUserId()));
        //TODO 剔除重复对象
        Boolean removeResult = materialList.removeAll(materialListFromDB);
        if (removeResult && materialList != null && materialList.size() == 0) {
            return new Response(materialListFromDB, HttpStatus.NO_CONTENT.value(), "请勿添加重复数据");
        }
        int result = materialMapper.insertBatch(materialList);

        //4.更新文件上传记录
        FileRecord fileRecord = new FileRecord();
        fileRecord.setFilename(command.getFilename());
        fileRecord.setUserId(Integer.valueOf(command.getUserId()));
        fileRecord.setOperationType(Byte.valueOf(OperationTypeConst.UPLOAD));
        fileRecord.setFileType(Byte.valueOf(FileTypeConst.EXCEL));
        fileRecord.setProjectId(Integer.valueOf(command.getProjectId()));
        int resultRecord = fileRecordMapper.insertSelective(fileRecord);

        if (result > 0 && resultRecord > 0) {
            return new Response(materialList, HttpStatus.OK.value(), "upload success");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "upload failure");
        }
    }

    @Deprecated
    public Response parseAndSaveNutritionStandardExcel(ExcelImportCommand command) throws Exception {
        ExcelImportDTO excelImportDTO = null;
        //1.解析文件
        if (DataTypeConst.NUTRITION.equals(command.getDataType())) {
            excelImportDTO = ExcelHelper.parseNutritionExcelImportDTO(command);
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "该文件数据无法解析");
        }

        //2.将每行数据转化为对应的对象
        List<Map<String, Object>> data = excelImportDTO.getItems();
        List<NutritionStandard> nutritionStandardList = new ArrayList<NutritionStandard>();
        for (int i = 0; i < data.size(); i++) {
            NutritionStandard nutritionStandard = BeanUtil.dataBind(NutritionStandard.class, data.get(i));
            nutritionStandardList.add(nutritionStandard);
        }

        //3.将数据导入至数据库中
        List<NutritionStandard> nutritionStandardListFromDB = nutritionStandardMapper.selectByUserId(Integer.valueOf(command.getUserId()));
        //TODO 剔除重复对象
        Boolean removeResult = nutritionStandardList.removeAll(nutritionStandardListFromDB);
        if (removeResult && nutritionStandardList != null && nutritionStandardList.size() == 0) {
            return new Response(nutritionStandardListFromDB, HttpStatus.NO_CONTENT.value(), "请勿添加重复数据");
        }

        int result = nutritionStandardMapper.insertBatch(nutritionStandardList);


        //4.更新文件上传记录
        FileRecord fileRecord = new FileRecord();
        fileRecord.setFilename(command.getFilename());
        fileRecord.setUserId(Integer.valueOf(command.getUserId()));
        fileRecord.setOperationType(Byte.valueOf(OperationTypeConst.UPLOAD));
        fileRecord.setFileType(Byte.valueOf(FileTypeConst.EXCEL));
        fileRecord.setProjectId(Integer.valueOf(command.getProjectId()));
        int resultRecord = fileRecordMapper.insertSelective(fileRecord);

        if (result > 0 && resultRecord > 0) {
            return new Response(nutritionStandardList, HttpStatus.OK.value(), "upload success");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "upload failure");
        }
    }


    /*@Deprecated
    @Transactional(rollbackFor = Exception.class)
    public Response parseAndSaveExcelFile(FileImportCommand command) throws Exception {

        //1.获取解析好的对象
        FileImportProduct product = FactoryManager.createFileImportProduct(command);

        //2.依次将List中的每一行数据转化为改行所对应的对象
        Map<Class, List<Map<String, Object>>> map = product.getItems();
        Set<Map.Entry<Class, List<Map<String, Object>>>> set = map.entrySet();
        Iterator<Map.Entry<Class, List<Map<String, Object>>>> iterator = set.iterator();

        //3.导入数据至数据库
        List<BaseMapper> mappers = new ArrayList<BaseMapper>();   //##BUG##  目前是写死的 后期需要动态加载
        mappers.add(animalGrowthRecordMapper);
        mappers.add(animalGutMicrobiotaRecordMapper);
        mappers.add(animalMapper);

        ImportExcelTask task = new ImportExcelTask(iterator, mappers);

        List<Future<Integer>> futures = new ArrayList<Future<Integer>>();
        for (int i = 0; i < set.size(); i++) {
            Future<Integer> future = executorService.submit(task);
            futures.add(future);
        }




        return null;
    }*/

    /**
     * 根据用户选择的指标导出数据录入的excel模板  TODO ##BUG## 1.未更新文件记录表（已解决）  2.未判断自定义字段是否已经使用完
     * @param command
     * @return
     */
    @Deprecated
    @Transactional(rollbackFor = Exception.class)
    public Response exportIndicatorExcelTemplate(IndicatorExcelExportCommand command) {

        //1.获取指标id集合
        List<String> ids = command.getIndicatorIds();
        //2.查询指标具体名称
        List<AnimalIndicator> animalIndicators = animalIndicatorMapper.selectByPrimaryKeys(ids);

        //3.数据结构转换
        List<String> englishName = new ArrayList<String>();
        List<String> chineseName = new ArrayList<String>();
        for (int i = 0; i < animalIndicators.size(); i++) {
            AnimalIndicator animalIndicator = animalIndicators.get(i);
            englishName.add(animalIndicator.getIndicatorNameEnglish());
            chineseName.add(animalIndicator.getIndicatorName());
        }
        command.setIndicatorNames(chineseName);
        command.setGetIndicatorEnglishNames(englishName);

        /*//4.生成模板文件
        Workbook template = ExcelHelper.exportExcelTemplate(command);
        Response<Workbook> response = new Response<Workbook>();
        response.setData(template);*/

        //4.组装返回的数据结构供前端渲染excel文件
        IndicatorExcelExportTemplateDTO templateDTO = new IndicatorExcelExportTemplateDTO();
        templateDTO.setChineseFields(chineseName);
        templateDTO.setEnglishFields(englishName);
        Response response = new Response();
        response.setData(templateDTO);

        //5.记录导出记录
        //更新文件记录
        updateFileRecord(command, animalIndicators);

        return response;
    }

    /**
     * 导出带有统计数据的Indicator Excel文件
     * @param command
     * @return
     */
    @Deprecated
    public Response exportIndicatorExcelWithData(IndicatorExcelExportCommand command) {
        //1.获取指标id集合
        List<String> ids = command.getIndicatorIds();
        //2.查询指标具体名称
        List<AnimalIndicator> animalIndicators = animalIndicatorMapper.selectByPrimaryKeys(ids);
        //3.表头的数据结构转换
        List<String> englishName = new ArrayList<String>();
        List<String> chineseName = new ArrayList<String>();
        for (int i = 0; i < animalIndicators.size(); i++) {
            AnimalIndicator animalIndicator = animalIndicators.get(i);
            englishName.add(animalIndicator.getIndicatorNameEnglish());
            chineseName.add(animalIndicator.getIndicatorName());
        }
        command.setIndicatorNames(chineseName);
        command.setGetIndicatorEnglishNames(englishName);
        command.setOperationType("3");   //导出数据文件
        //4.获取数据表正文数据

        //变量名转为下划线类型以便在数据库中查询
        List<String> underlineFields = new ArrayList<String>();
        for (int i = 0; i < englishName.size(); i++) {
            String spaceField = englishName.get(i);
            String underlineField = BeanUtil.spaceFieldToUnderline(spaceField);
            underlineFields.add(underlineField);
        }
        //List<AnimalIndicatorRecord> animalIndicatorRecords = animalIndicatorRecordMapper.selectSelective(underlineFields, command.getProjectId());

        /*//5.将bean list转化为map list以便给Excel进行处理
        List<Map<String, Object>> indicatorMaps = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < animalIndicatorRecords.size(); i++) {
            Map<String, Object> map = BeanUtil.beanToMap(animalIndicatorRecords.get(i));
            indicatorMaps.add(map);
        }
        command.setDataRows(indicatorMaps);
        Workbook workbook = ExcelHelper.exportExcelWithData(command);

        Response<Workbook> response = new Response<Workbook>();
        response.setData(workbook);*/


        //5.组装数据结构，以便前端excel渲染
        Response response = new Response();
        IndicatorExcelExportDataDTO dataDTO = new IndicatorExcelExportDataDTO();
        dataDTO.setChineseFields(chineseName);
        dataDTO.setEnglishFields(englishName);
        //dataDTO.setDataList(animalIndicatorRecords);
        response.setData(dataDTO);


        //6.记录导出记录
        updateFileRecord(command, animalIndicators);


        return response;
    }


    @Deprecated
    private void updateFileRecord(IndicatorExcelExportCommand command, List<AnimalIndicator> animalIndicators) {
        //更新文件记录
        FileRecord fileRecord = new FileRecord();
        fileRecord.setUserId(Integer.valueOf(command.getUserId()));
        fileRecord.setProjectId(Integer.valueOf(command.getProjectId()));
        fileRecord.setFileType(Byte.valueOf(command.getFileType()));
        fileRecord.setOperationType(Byte.valueOf(command.getOperationType()));
        fileRecordMapper.insertSelective(fileRecord);
        //更新详细记录
        List<ExcelFileDetail> excelFileDetails = new ArrayList<ExcelFileDetail>();
        for (int i = 0; i < animalIndicators.size(); i++) {
            ExcelFileDetail excelFileDetail = new ExcelFileDetail();
            excelFileDetails.add(excelFileDetail);

            AnimalIndicator animalIndicator = animalIndicators.get(i);
            excelFileDetail.setIndicatorId(animalIndicator.getId());
            excelFileDetail.setFileRecordId(fileRecord.getId());
            excelFileDetail.setIndicatorName(animalIndicator.getIndicatorNameEnglish());
            excelFileDetail.setTableName(String.valueOf(animalIndicator.getIndicatorType()));
        }
        excelFileDetailMapper.insertBatch(excelFileDetails);
    }
}
