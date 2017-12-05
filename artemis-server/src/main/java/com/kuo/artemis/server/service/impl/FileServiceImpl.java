package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.ExcelDTO;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.helper.ExcelHelper;
import com.kuo.artemis.server.dao.ExcelTestMapper;
import com.kuo.artemis.server.dao.ExcelTestTwoMapper;
import com.kuo.artemis.server.dao.RolePermissionMapper;
import com.kuo.artemis.server.service.FileService;
import com.kuo.artemis.server.util.constant.ExcelConst;
import com.kuo.artemis.server.util.file.ExcelUtil;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.util.*;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/27
 */
@Service
public class FileServiceImpl implements FileService {

    @Inject
    private ExcelTestMapper excelTestMapper;

    @Inject
    private ExcelTestTwoMapper excelTestTwoMapper;

    public Response parseAndSaveExcel(MultipartFile file) throws Exception {



        //解析
        //1.将Excel文件解析
        ExcelDTO excelDTO = ExcelHelper.parseExcel(file);

        //2.依次将List中的每一行数据转化为改行所对应的对象
        Map<Class, List<Map<String, Object>>> map = excelDTO.getItems();
        Set<Map.Entry<Class, List<Map<String, Object>>>> set = map.entrySet();
        Iterator<Map.Entry<Class, List<Map<String, Object>>>> iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry<Class, List<Map<String, Object>>> entry = iterator.next();
            Class key = entry.getKey();
            List<Map<String, Object>> value = entry.getValue();

            List resultList = new ArrayList();
            for (int i = 0; i < value.size(); i++) {
                    //##BUG##  如何获取对象类型
                resultList.add(ExcelHelper.parseExcelRowToBean(key, value.get(i)));
            }
            //选择mapper进行导入
            if ("ExcelTestMapper".startsWith(key.getSimpleName())) {
                excelTestMapper.insertBatch(resultList);
            } else if ("ExcelTestTwoMapper".startsWith(key.getSimpleName())) {
                excelTestTwoMapper.insertBatch(resultList);
            }

        }

        //保存至数据库
        //int result = excelTestMapper.insertBatch(resultList);     // ##BUG##  多次导入同一文件

        /*if (result > 0) {
            return new Response(HttpStatus.OK.value(), "upload success");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Excel数据有误，上传失败");
        }*/
        return null;
    }
}
