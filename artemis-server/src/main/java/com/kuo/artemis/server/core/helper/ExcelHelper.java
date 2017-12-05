package com.kuo.artemis.server.core.helper;

import com.kuo.artemis.server.core.dto.ExcelDTO;
import com.kuo.artemis.server.util.file.ExcelUtil;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author : guoyang
 * @Description : Excel文件操作相关的助手类
 * @Date : Created on 2017/11/25
 */
public class ExcelHelper {

    /**
     * 解析excel文件
     * @param file
     * @return
     * @throws Exception
     */
    public static ExcelDTO parseExcel(MultipartFile file) throws Exception {

        ExcelDTO excelDTO = new ExcelDTO();

        String filename = file.getOriginalFilename();
        InputStream inputStream = file.getInputStream();
        excelDTO.setFilename(filename);
        excelDTO.setInputStream(inputStream);


        //解析开始
        //1.创建workbook对象
        Workbook workbook = ExcelUtil.createExcelObject(inputStream, filename);
        if (workbook == null) {
            throw new Exception("workbook is null!");
        }

        //2.解析表title
        List<String> fields =  ExcelUtil.parseExcelFields(workbook, 0);
        excelDTO.setFields(fields);
        //3.获取指标来自的类
        Set<Class> classSet = ExcelUtil.getClassSet(fields);
        excelDTO.setClasses(classSet);
        //4.解析表正文
        List<Map<String, Object>> rowList = ExcelUtil.parseExcelContent(workbook, 0, 2);

        Map<Class, List<Map<String,Object>>> map;
        if (classSet.size() == 1) {
            //Excel文件中的指标来自同一个类
            map = new HashMap<Class, List<Map<String, Object>>>();
            map.put(ExcelUtil.getClassByField(fields.get(0)), rowList);
            excelDTO.setItems(map);
        } else if (classSet.size() > 1) {
            //Excel文件中的指标来自多个类
            map = ExcelUtil.groupExcel(rowList, fields);
            excelDTO.setItems(map);
        }


        try {
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (Exception e) {
            throw e;
        }

        return excelDTO;
    }

    /**
     * 将Excel每行中的数据键值对转化为其所在的对象(暂时无法解析日期格式)  ##BUG##
     * @param clazz
     * @param fieldValueMap
     * @param <T>
     * @return
     * @throws Exception
     */
    public static <T> T parseExcelRowToBean(Class<T> clazz, Map<String, Object> fieldValueMap) throws Exception {
        return ExcelUtil.dataBind(clazz, fieldValueMap);
    }

    /**
     * 发送excel文件
     */
    public static byte[] sendExcel(List<String> titles, List<List<Object>> contents) {
        //Workbook workbook = ExcelUtil.exportExcel(titles, contents);
        return null;
    }
}
