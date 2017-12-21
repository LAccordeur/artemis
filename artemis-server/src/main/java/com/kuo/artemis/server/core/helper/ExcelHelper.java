package com.kuo.artemis.server.core.helper;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.excel.IndicatorExcelExportCommand;
import com.kuo.artemis.server.core.dto.excel.IndicatorExcelImportDTO;
import com.kuo.artemis.server.core.dto.excel.ExcelImportDTO;
import com.kuo.artemis.server.entity.Animal;
import com.kuo.artemis.server.util.common.BeanUtil;
import com.kuo.artemis.server.util.common.UUIDUtil;
import com.kuo.artemis.server.util.file.ExcelUtil;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.*;

/**
 * @Author : guoyang
 * @Description : Excel文件操作相关的助手
 * @Date : Created on 2017/11/25
 */
public class ExcelHelper {

    /**
     * 解析indicator excel文件
     * @param command
     * @return
     * @throws Exception
     */
    public static IndicatorExcelImportDTO parseIndicatorExcel(FileImportCommand command) throws Exception {

        MultipartFile file = command.getFile();
        String projectId = command.getProjectId();

        IndicatorExcelImportDTO indicatorExcelImportDTO = new IndicatorExcelImportDTO();

        String filename = file.getOriginalFilename();
        InputStream inputStream = file.getInputStream();
        indicatorExcelImportDTO.setFilename(filename);
        indicatorExcelImportDTO.setInputStream(inputStream);


        //解析开始
        //1.创建workbook对象
        Workbook workbook = ExcelUtil.createExcelObject(inputStream, filename);
        if (workbook == null) {
            throw new Exception("workbook is null!");
        }


        //2.解析表title
        List<String> fields =  ExcelUtil.parseExcelFields(workbook, 0, 0, 0);
        indicatorExcelImportDTO.setFields(fields);
        //3.获取指标来自的类
        Set<Class> classSet = ExcelUtil.getClassSet(fields);
        indicatorExcelImportDTO.setClasses(classSet);

        //记录initial BW形式的表头
        List<String> indicators = ExcelUtil.getExcelInitFields(workbook, 0, 0, 0);
        indicatorExcelImportDTO.setIndicators(indicators);

        //4.解析表正文
        List<Map<String, Object>> rowList = ExcelUtil.parseExcelContent(workbook, 0, 0, 2, 0);

        Map<Class, List<Map<String,Object>>> map;
        if (classSet.size() == 1) {
            //Excel文件中的指标来自同一个类
            map = new HashMap<Class, List<Map<String, Object>>>();
            map.put(ExcelUtil.getClassByField(fields.get(0)), rowList);
            //指定主键uuid
            appointIds(rowList, map, projectId);
            indicatorExcelImportDTO.setItems(map);
        } else if (classSet.size() > 1) {
            //Excel文件中的指标来自多个类
            map = ExcelUtil.groupExcel(rowList, fields);
            //指定主键uuid
            appointIds(rowList, map, projectId);
            indicatorExcelImportDTO.setItems(map);
        }


        try {
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (Exception e) {
            throw e;
        }

        return indicatorExcelImportDTO;
    }


    /**
     * 解析material excel文件
     * @param command
     * @return
     */
    public static ExcelImportDTO parseMaterialExcel(FileImportCommand command) throws Exception {
        ExcelImportDTO excelImportDTO = new ExcelImportDTO();

        //1.从命令中获取解析需要的参数
        MultipartFile file = command.getFile();
        InputStream inputStream = file.getInputStream();
        String filename = file.getOriginalFilename();
        String userId = command.getUserId();

        //2.创建Workbook
        Workbook workbook = ExcelUtil.createExcelObject(inputStream, filename);

        //3.解析表头,暂时默认表头为第一行
        List<String> field = ExcelUtil.getExcelInitFields(workbook, 0, 0, 0);

        //4.解析正文
        List<Map<String, Object>> contents = ExcelUtil.parseExcelContent(workbook, 0, 0, 1, 0);

        //5.为每一行的数据加入id和userId用来导入数据库
        for (int i = 0; i < contents.size(); i++) {
            Map<String, Object> row = contents.get(i);
            row.put("userId", userId);
            //row.put("id", UUIDUtil.get32UUIDLowerCase());
        }

        excelImportDTO.setItems(contents);
        excelImportDTO.setInitFields(field);

        return excelImportDTO;
    }

    /**
     * 解析nutrition excel文件
     * @param command
     * @return
     * @throws Exception
     */
    public static ExcelImportDTO parseNutritionExcelImportDTO(FileImportCommand command) throws Exception {
        ExcelImportDTO nutritionExcelImportDTO = new ExcelImportDTO();

        //1.获取参数
        //1.从命令中获取解析需要的参数
        MultipartFile file = command.getFile();
        InputStream inputStream = file.getInputStream();
        String filename = file.getOriginalFilename();
        String userId = command.getUserId();

        //2.创建Workbook
        Workbook workbook = ExcelUtil.createExcelObject(inputStream, filename);

        //3.解析表头,暂时默认表头为第一行
        List<String> field = ExcelUtil.getExcelInitFields(workbook, 0, 0, 0);

        //4.解析正文
        List<Map<String, Object>> contents = ExcelUtil.parseExcelContent(workbook, 0, 0, 1, 0);

        //5.为每一行的数据加入id和userId用来导入数据库
        for (int i = 0; i < contents.size(); i++) {
            Map<String, Object> row = contents.get(i);
            row.put("userId", userId);
            //row.put("id", UUIDUtil.get32UUIDLowerCase());
        }

        nutritionExcelImportDTO.setItems(contents);

        return nutritionExcelImportDTO;
    }

    private static void appointIds(List<Map<String, Object>> rowList, Map<Class, List<Map<String, Object>>> map, String projectId) {
        //为每个对象指定id
        List<String> UUIDs = UUIDUtil.list32UUIDLowerCase(rowList.size());
        Set<Map.Entry<Class, List<Map<String, Object>>>> entries = map.entrySet();
        Iterator<Map.Entry<Class, List<Map<String, Object>>>> iterator = entries.iterator();
        while (iterator.hasNext()) {
            Map.Entry<Class, List<Map<String, Object>>> entry = iterator.next();
            Class<?> clazz = entry.getKey();
            List<Map<String, Object>> value = entry.getValue();
            if ((Animal.class).equals(clazz)) {
                for (int i = 0; i < value.size(); i++) {
                    Map<String, Object> row = value.get(i);
                    row.put("id", UUIDs.get(i));
                    row.put("projectId", projectId);
                }
            } else {
                for (int i = 0; i < value.size(); i++) {
                    Map<String, Object> row = value.get(i);
                    row.put("animalId", UUIDs.get(i));
                }
            }
        }
    }

    /**
     * 将Excel每行中的数据键值对转化为其所在的对象(暂时无法解析日期格式)  TODO  ##BUG##日期格式无法解析
     * @param clazz
     * @param fieldValueMap
     * @param <T>
     * @return
     * @throws Exception
     */
    public static <T> T parseExcelRowToBean(Class<T> clazz, Map<String, Object> fieldValueMap) throws Exception {
        return BeanUtil.dataBind(clazz, fieldValueMap);
    }

    /**
     * 导出excel模板文件
     */
    public static Workbook exportExcelTemplate(IndicatorExcelExportCommand command) {

        List<String> englishFields = command.getGetIndicatorEnglishNames();
        List<String> chineseFields = command.getIndicatorNames();
        Workbook workbook = ExcelUtil.exportExcelTemplate(englishFields, chineseFields);
        return workbook;
    }

    /**
     * 导出含有指标记录数据的Excel文件
     * @param command
     * @return
     */
    public static Workbook exportExcelWithData(IndicatorExcelExportCommand command) {

        List<String> englishFields = command.getGetIndicatorEnglishNames();
        List<String> chineseFields = command.getIndicatorNames();
        List<Map<String, Object>> dataRows = command.getDataRows();
        Workbook workbook = ExcelUtil.exportExcelWithData(englishFields, chineseFields, dataRows);
        return workbook;

    }
}
