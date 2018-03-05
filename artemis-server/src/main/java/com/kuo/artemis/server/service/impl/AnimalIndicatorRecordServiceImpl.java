package com.kuo.artemis.server.service.impl;

import com.alibaba.druid.support.json.JSONUtils;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.kuo.artemis.server.core.dto.Response;

import com.kuo.artemis.server.core.dto.excel.DataExportDTO;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.dto.excel.DataImportDTO;
import com.kuo.artemis.server.core.dto.excel.DataSaveCommand;
import com.kuo.artemis.server.core.exception.DataException;
import com.kuo.artemis.server.core.helper.DataHelper;
import com.kuo.artemis.server.dao.*;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.AnimalIndicatorRecordService;
import com.kuo.artemis.server.util.ValidationUtil;
import com.kuo.artemis.server.util.common.BeanUtil;
import com.kuo.artemis.server.util.common.StringUtil;
import com.kuo.artemis.server.util.common.UUIDUtil;
import com.kuo.artemis.server.util.constant.FileTypeConst;
import com.kuo.artemis.server.util.constant.OperationTypeConst;
import javafx.scene.chart.PieChart;
import net.minidev.json.JSONUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.*;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/9
 */
@Service
public class AnimalIndicatorRecordServiceImpl implements AnimalIndicatorRecordService {

    @Inject
    private AnimalIndicatorRecordMapper animalIndicatorRecordMapper;

    @Inject
    private FileRecordMapper fileRecordMapper;

    @Inject
    private AnimalIndicatorMapper animalIndicatorMapper;

    @Inject
    private ExcelFileDetailMapper excelFileDetailMapper;

    @Inject
    private AnimalMapper animalMapper;

    @Inject
    private AnimalGrowthRecordMapper animalGrowthRecordMapper;

    @Inject
    private AnimalGutMicrobiotaRecordMapper animalGutMicrobiotaRecordMapper;

    @Inject
    private AnimalBreedingIndicatorRecordMapper animalBreedingIndicatorRecordMapper;

    @Inject
    private AnimalGrowthIndicatorRecordMapper animalGrowthIndicatorRecordMapper;

    @Inject
    private AnimalRecordMapper animalRecordMapper;

    @Transactional(rollbackFor = Exception.class)
    @Deprecated
    public Response createNewRecordVersion(DataImportCommand command) throws Exception {

        try {
            ValidationUtil.getInstance().validateParams(command);
        } catch (Exception e) {
            return new Response(e);
        }

        List<List<String>> recordList = command.getDataList();
        String projectId = command.getProjectId();
        String userId = command.getUserId();
        String filename = command.getFilename();

        Integer currentVersion;
        synchronized (this) {
            //1.获取当前文件的最新版本号
            String fileIdentifier = StringUtil.getHashSubCode(filename);
            currentVersion = fileRecordMapper.selectLastestVersion(Integer.valueOf(projectId), fileIdentifier);
            if (currentVersion == null) {
                currentVersion = 0;
            }
            int newVersion = currentVersion + 1;
            //2.新增文件记录表
            FileRecord fileRecord = new FileRecord();
            fileRecord.setUserId(Integer.valueOf(userId));
            fileRecord.setFilename(filename);
            fileRecord.setFileIdentifier(fileIdentifier);
            fileRecord.setFileType(Byte.valueOf(FileTypeConst.EXCEL));
            fileRecord.setProjectId(Integer.valueOf(projectId));
            fileRecord.setOperationType(Byte.valueOf(OperationTypeConst.UPLOAD));
            fileRecord.setVersion(newVersion);
            fileRecordMapper.insertSelective(fileRecord);

            //3.新增文件详细记录表（记录这个版本使用了哪些指标）
            List<String> initFields = recordList.get(0);
            List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectByFields(initFields);
            List<ExcelFileDetail> excelFileDetailList = new ArrayList<ExcelFileDetail>();
            for (int i = 0; i < animalIndicatorList.size(); i++) {
                AnimalIndicator indicator = animalIndicatorList.get(i);

                ExcelFileDetail excelFileDetail = new ExcelFileDetail();
                excelFileDetail.setFileRecordId(fileRecord.getId());
                excelFileDetail.setIndicatorName(indicator.getIndicatorNameEnglish());
                excelFileDetail.setIndicatorId(indicator.getId());
                excelFileDetail.setTableName(String.valueOf(indicator.getIndicatorType()));
                excelFileDetailList.add(excelFileDetail);
            }
            excelFileDetailMapper.insertBatch(excelFileDetailList);

            //4.创建指标数据新版本 TODO
            DataImportDTO result = DataHelper.excelIndicatorDataToBean(recordList, 0, 1);
            Map<Class, List> objectMap = result.getObjectList();
            List animalList = objectMap.get(Animal.class);
            List<String> animalIds = new ArrayList<String>();
            for (int i = 0; i < animalList.size(); i++) {
                animalIds.add(UUIDUtil.get32UUIDLowerCase());
            }
            if (animalList != null) {
                for (int i = 0; i < animalList.size(); i++) {
                    Animal animal = (Animal) animalList.get(i);
                    animal.setId(animalIds.get(i));
                    animal.setFileIdentifier(fileIdentifier);
                    animal.setUserId(Integer.valueOf(userId));
                    animal.setProjectId(Integer.valueOf(projectId));
                    animal.setVersion(newVersion);
                }
                animalMapper.insertBatch(animalList);
            }

            List animalGrowthList = objectMap.get(AnimalGrowthRecord.class);
            if (animalGrowthList != null) {
                for (int i = 0; i < animalGrowthList.size(); i++) {
                    AnimalGrowthRecord animalGrowthRecord = (AnimalGrowthRecord) animalGrowthList.get(i);
                    animalGrowthRecord.setAnimalId(animalIds.get(i));
                    animalGrowthRecord.setFileIdentifier(fileIdentifier);
                    animalGrowthRecord.setUserId(Integer.valueOf(userId));
                    animalGrowthRecord.setProjectId(Integer.valueOf(projectId));
                    animalGrowthRecord.setVersion(newVersion);
                }
                animalGrowthRecordMapper.insertBatch(animalGrowthList);
            }

            List animalGutList = objectMap.get(AnimalGutMicrobiotaRecord.class);
            if (animalGutList != null) {
                for (int i = 0; i < animalGutList.size(); i++) {
                    AnimalGutMicrobiotaRecord gutMicrobiotaRecord = (AnimalGutMicrobiotaRecord) animalGutList.get(i);
                    gutMicrobiotaRecord.setAnimalId(animalIds.get(i));
                    gutMicrobiotaRecord.setFileIdentifier(fileIdentifier);
                    gutMicrobiotaRecord.setUserId(Integer.valueOf(userId));
                    gutMicrobiotaRecord.setProjectId(Integer.valueOf(projectId));
                    gutMicrobiotaRecord.setVersion(newVersion);
                }
                animalGutMicrobiotaRecordMapper.insertBatch(animalGutList);
            }

        }
        return new Response(HttpStatus.OK.value(), "创建新版本成功");
    }


    /**
     * v2
     * @param command
     * @return
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public Response createRecordVersion(DataImportCommand command) throws DataException {
        try {
            ValidationUtil.getInstance().validateParams(command);
        } catch (Exception e) {
            return new Response(e);
        }

        List<List<String>> recordList = command.getDataList();
        String projectId = command.getProjectId();
        String userId = command.getUserId();
        String filename = command.getFilename();

        DataImportDTO growthDataImportDTO = DataHelper.excelDataToBean(recordList, AnimalGrowthIndicatorRecord.class, 0 ,1);
        DataImportDTO breedingDataImportDTO = DataHelper.excelDataToBean(recordList, AnimalBreedingIndicatorRecord.class, 0, 1);
        DataImportDTO animalDataImportDTO = DataHelper.excelDataToBean(recordList, Animal.class, 0, 1);
        List animalDataList = animalDataImportDTO.getCommonList();
        List growthDataList = growthDataImportDTO.getCommonList();
        List breedingDataList = breedingDataImportDTO.getCommonList();

        //检测每个动物的唯一id必须存在且唯一才可导入
        Set idSet = new HashSet();
        for (int i = 0; i < animalDataList.size(); i++) {
            Animal animal = (Animal) animalDataList.get(i);
            if (animal.getIdNumber() == null || "".equals(animal.getIdNumber())) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "动物id不能为空");
            }
            idSet.add(animal.getIdNumber());
        }
        if (idSet.size() < animalDataList.size()) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "动物id不能重复");
        }


        Integer currentVersion;
        synchronized (this) {
            //1.获取当前文件的最新版本号
            String fileIdentifier = StringUtil.getHashSubCode(filename);
            currentVersion = fileRecordMapper.selectLastestVersion(Integer.valueOf(projectId), fileIdentifier);
            if (currentVersion == null) {
                currentVersion = 0;
            }
            int newVersion = currentVersion + 1;
            //2.新增文件记录表
            FileRecord fileRecord = new FileRecord();
            fileRecord.setUserId(Integer.valueOf(userId));
            fileRecord.setFilename(filename);
            fileRecord.setFileIdentifier(fileIdentifier);
            fileRecord.setFileType(Byte.valueOf(FileTypeConst.EXCEL));
            fileRecord.setProjectId(Integer.valueOf(projectId));
            fileRecord.setOperationType(Byte.valueOf(OperationTypeConst.UPLOAD));
            fileRecord.setVersion(newVersion);
            fileRecordMapper.insertSelective(fileRecord);

            //3.新增文件详细记录表（记录这个版本使用了哪些指标）
            List<String> initFields = recordList.get(0);
            List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectByFields(initFields);
            List<ExcelFileDetail> excelFileDetailList = new ArrayList<ExcelFileDetail>();
            for (int i = 0; i < animalIndicatorList.size(); i++) {
                AnimalIndicator indicator = animalIndicatorList.get(i);

                ExcelFileDetail excelFileDetail = new ExcelFileDetail();
                excelFileDetail.setFileRecordId(fileRecord.getId());
                excelFileDetail.setIndicatorName(indicator.getIndicatorNameEnglish());
                excelFileDetail.setIndicatorId(indicator.getId());
                excelFileDetail.setTableName(String.valueOf(indicator.getIndicatorType()));
                excelFileDetailList.add(excelFileDetail);
            }
            excelFileDetailMapper.insertBatch(excelFileDetailList);

            //4.创建指标数据新版本

            List<String> animalIds = new ArrayList<String>();
            for (int i = 0; i < animalDataList.size(); i++) {
                animalIds.add(UUIDUtil.get32UUIDLowerCase());
            }
            //新增动物表
            for (int i = 0; i < animalDataList.size(); i++) {
                Animal animal = (Animal) animalDataList.get(i);
                animal.setId(animalIds.get(i));
                animal.setFileIdentifier(fileIdentifier);
                animal.setUserId(Integer.valueOf(userId));
                animal.setProjectId(Integer.valueOf(projectId));
                animal.setVersion(newVersion);
                animal.setSequence(i+1);
            }
            animalMapper.insertBatch(animalDataList);

            //新增动物生长表
            for (int i = 0; i < growthDataList.size(); i++) {
                AnimalGrowthIndicatorRecord record = (AnimalGrowthIndicatorRecord) growthDataList.get(i);
                record.setAnimalId(animalIds.get(i));
                record.setProjectId(Integer.valueOf(projectId));
                record.setUserId(Integer.valueOf(userId));
                record.setFileIdentifier(fileIdentifier);
                record.setVersion(newVersion);
            }
            animalGrowthIndicatorRecordMapper.insertBatch(growthDataList);

            //新增繁殖动物表
            for (int i = 0; i < breedingDataList.size(); i++) {
                AnimalBreedingIndicatorRecord record = (AnimalBreedingIndicatorRecord) breedingDataList.get(i);
                record.setAnimalId(animalIds.get(i));
                record.setProjectId(Integer.valueOf(projectId));
                record.setUserId(Integer.valueOf(userId));
                record.setFileIdentifier(fileIdentifier);
                record.setVersion(newVersion);
            }
            animalBreedingIndicatorRecordMapper.insertBatch(breedingDataList);


        }
        return new Response(HttpStatus.OK.value(), "创建新版本成功");
    }


    /**
     * v2
     * @param command
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response saveCurrentRecord(DataSaveCommand command) throws DataException {

        try {
            ValidationUtil.getInstance().validateParams(command);
        } catch (Exception e) {
            return new Response(e);
        }

        String projectId = command.getProjectId();
        String fileIdentifier = command.getFileIdentifier();
        String version = command.getVersion();
        List<List<String>> recordList = command.getDataList();

        //1.更新文件记录表的时间
        Integer fileRecordId = fileRecordMapper.selectIdByProjectIdAndFileIdentifierAndVersion(projectId, fileIdentifier, Integer.valueOf(version));
        if (fileRecordId == null) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "无该文件");
        }
        FileRecord fileRecord = new FileRecord();
        fileRecord.setId(fileRecordId);
        fileRecord.setModifiedTime(new Date());
        fileRecordMapper.updateByPrimaryKeySelective(fileRecord);

        //检测是否新增指标
        List<String> indicators =  excelFileDetailMapper.selectNameByFileRecordId(fileRecordId);
        if (recordList.get(0).size() > indicators.size()) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "新增指标后请保存为新版本");
        }


        //2.更新各个动物记录表 规定一个必须的标识符为id number
        DataImportDTO animalDataDTO = DataHelper.excelDataToBean(recordList, Animal.class, 0, 1);
        DataImportDTO growthDataDTO = DataHelper.excelDataToBean(recordList, AnimalGrowthIndicatorRecord.class, 0, 1);
        DataImportDTO breedingDataDTO = DataHelper.excelDataToBean(recordList, AnimalBreedingIndicatorRecord.class, 0, 1);

        List animalList = animalDataDTO.getCommonList();
        List growthList = growthDataDTO.getCommonList();
        List breedingList = breedingDataDTO.getCommonList();

        //3.获取id_number
        List<String> idNumberList = new ArrayList<String>();
        for (Object object : animalList) {
            Animal animal = (Animal) object;
            if (animal.getIdNumber() == null) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "id number不能为空");
            }
            idNumberList.add(animal.getIdNumber());
        }
        Map<String, Animal> idNumberMap = animalMapper.selectIdMap(idNumberList, Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        //检测是否新增记录
        if ((recordList.size() - 1) > idNumberMap.size()) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "新增动物记录后请保存为新版本");
        }


        //4.为动物设置id并更新
        for (int i = 0; i < animalList.size(); i++) {
            Animal animal = (Animal) animalList.get(i);
            AnimalGrowthIndicatorRecord growthIndicatorRecord = (AnimalGrowthIndicatorRecord) growthList.get(i);
            AnimalBreedingIndicatorRecord animalBreedingIndicatorRecord = (AnimalBreedingIndicatorRecord) breedingList.get(i);

            String idNumber = animal.getIdNumber();
            String dbId = idNumberMap.get(idNumber).getId();
            animal.setId(dbId);
            growthIndicatorRecord.setAnimalId(dbId);
            animalBreedingIndicatorRecord.setAnimalId(dbId);
        }
        int animalStatus = animalMapper.updateBatch(animalList);
        int growthStatus = animalGrowthIndicatorRecordMapper.updateBatch(growthList);
        int breedingStatus = animalBreedingIndicatorRecordMapper.updateBatch(breedingList);

        if (animalStatus <= 0 && growthStatus <= 0 && breedingStatus <= 0) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "更新失败");
        }
        return new Response(HttpStatus.OK.value(), "更新成功");
    }

    /**
     * v2
     * @param projectId
     * @param fileIdentifier
     * @param version
     * @return
     */
    public Response listAnimalRecords(String projectId, String fileIdentifier, String version) {
        if (projectId == null || "".equals(projectId) || fileIdentifier == null || "".equals(fileIdentifier) || version == null || "".equals(version)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        Integer fileRecordId = fileRecordMapper.selectIdByProjectIdAndFileIdentifierAndVersion(projectId, fileIdentifier, Integer.valueOf(version));
        if (fileRecordId == null) {
            return new Response(HttpStatus.NO_CONTENT.value(), "无该文件信息");
        }

        //1.获取该版本所选取的指标项
        List<String> initIndicatorList = excelFileDetailMapper.selectNameByFileRecordId(fileRecordId);
        List<String> indicatorList = new ArrayList<String>();
        for (int i = 0; i < initIndicatorList.size(); i++) {
            String spaceField = initIndicatorList.get(i);
            String underlineField = BeanUtil.spaceFieldToUnderline(spaceField);
            indicatorList.add(underlineField);
        }

        //2.获取数据
        List<AnimalRecord> animalIndicatorRecordList = animalRecordMapper.selectSelective(indicatorList, Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        FileRecord fileRecord = fileRecordMapper.selectByPrimaryKey(fileRecordId);

        synchronized (this) {
            //3.设置返回字段的顺序
            setFieldSequence(indicatorList);  //注解设置存在互斥

            //4.组装返回对象
            DataExportDTO dataExportDTO = new DataExportDTO();
            dataExportDTO.setProjectId(projectId);
            dataExportDTO.setFileIdentifier(fileIdentifier);
            dataExportDTO.setVersion(version);
            dataExportDTO.setDataList(animalIndicatorRecordList);
            dataExportDTO.setFilename(fileRecord.getFilename());

            return new Response(dataExportDTO, HttpStatus.OK.value(), "获取数据成功");
        }
    }

    private void setFieldSequence(List<String> indicatorList) {
        try {
            //获取注解示例
            JsonPropertyOrder annotation = AnimalRecord.class.getAnnotation(JsonPropertyOrder.class);
            //获取注解的handler，注解的值存在该handler对象中
            InvocationHandler handler = Proxy.getInvocationHandler(annotation);
            //获取存储注解值的字段对象
            Field handleField = handler.getClass().getDeclaredField("memberValues");
            handleField.setAccessible(true);
            Map memberValues = (Map) handleField.get(handler);

            //设置新值
            String[] newValues = new String[indicatorList.size()];
            for (int i = 0; i < indicatorList.size(); i++) {
                newValues[i] = StringUtil.underlineToCamel(indicatorList.get(i));
            }
            memberValues.put("value", newValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * v2
     * @param projectId
     * @param fileIdentifier
     * @param version
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response deleteCurrentVersion(String projectId, String fileIdentifier, String version) {

        if (projectId == null || "".equals(projectId) || fileIdentifier == null || "".equals(fileIdentifier) || version == null || "".equals(version)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }
        Integer fileRecordId = fileRecordMapper.selectIdByProjectIdAndFileIdentifierAndVersion(projectId, fileIdentifier, Integer.valueOf(version));
        if (fileRecordId == null) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数错误");
        }

        int growthResult = animalGrowthIndicatorRecordMapper.deleteByProjectIdAndFileIdentifierAndVersion(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        int breedingResult = animalBreedingIndicatorRecordMapper.deleteByProjectIdAndFileIdentifierAndVersion(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        int animalResult = animalMapper.deleteByProjectIdAndFileIdentifierAndVersion(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));

        int fileDetailResult = excelFileDetailMapper.deleteByFileRecordId(fileRecordId);
        int fileResult = fileRecordMapper.deleteByPrimaryKey(fileRecordId);

        if (growthResult > 0 && breedingResult > 0 && animalResult > 0 && fileDetailResult > 0 && fileResult > 0) {
            return new Response(HttpStatus.OK.value(), "删除成功");
        }

        return new Response(HttpStatus.BAD_REQUEST.value(), "删除失败");
    }




    @Deprecated
    public Response getIndicatorRecordDetail(String projectId, String fileIdentifier, String version) {

        if (projectId == null || "".equals(projectId) || fileIdentifier == null || "".equals(fileIdentifier) || version == null || "".equals(version)) {
            return new Response(HttpStatus.BAD_REQUEST.value(),"参数不能为空");
        }

        Integer fileRecordId = fileRecordMapper.selectIdByProjectIdAndFileIdentifierAndVersion(projectId, fileIdentifier, Integer.valueOf(version));
        //1.获取该版本所选取的指标项
        List<String> initIndicatorList = excelFileDetailMapper.selectNameByFileRecordId(fileRecordId);
        List<String> indicatorList = new ArrayList<String>();
        for (int i = 0; i < initIndicatorList.size(); i++) {
            String spaceField = initIndicatorList.get(i);
            String underlineField = BeanUtil.spaceFieldToUnderline(spaceField);
            indicatorList.add(underlineField);
        }

        //2.获取数据
        List<AnimalIndicatorRecord> animalIndicatorRecordList = animalIndicatorRecordMapper.selectSelective(indicatorList, Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));

        return new Response(animalIndicatorRecordList, HttpStatus.OK.value(), "获取数据成功");
    }

    public Response listIndicatorRecords(String projectId) {

        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        List<FileRecord> fileRecordList = fileRecordMapper.selectIndicatorRecordFiles(Integer.valueOf(projectId));
        if (fileRecordList == null || fileRecordList.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "尚未上传文件");
        }
        return new Response(fileRecordList, HttpStatus.OK.value(), "文件列表");
    }

    public Response listIndicatorRecordVersions(String projectId, String fileIdentifier) {

        if (projectId == null || "".equals(projectId) || fileIdentifier == null || "".equals(fileIdentifier)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }


        List<FileRecord> fileRecordList = fileRecordMapper.selectIndicatorRecordFileVersions(Integer.valueOf(projectId), fileIdentifier);
        if (fileRecordList == null || fileRecordList.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "没有文件");
        }
        return new Response(fileRecordList, HttpStatus.OK.value(), "文件版本列表");
    }

    public Response listAllIndicators() {

        List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectAllIndicators();
        if (animalIndicatorList == null || animalIndicatorList.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "指标库为空");
        }
        return new Response(animalIndicatorList, HttpStatus.OK.value(), "指标库");
    }

    public Response listAllIndicatorTypes() {
        List<Integer> indicatorTypes = animalIndicatorMapper.selectIndicatorTypes();
        if (indicatorTypes == null || indicatorTypes.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "指标类型为空");
        }

        return new Response(indicatorTypes, HttpStatus.OK.value(), "指标类型类别");

    }

    public Response listIndicatorsByType(String type) {

        if (type == null || "".equals(type)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        List<AnimalIndicator> animalIndicators = animalIndicatorMapper.selectIndicatorsByType(Integer.valueOf(type));
        if (animalIndicators == null || animalIndicators.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "指标库为空");
        }

        return new Response(animalIndicators, HttpStatus.OK.value(), "指标库");
    }
}
