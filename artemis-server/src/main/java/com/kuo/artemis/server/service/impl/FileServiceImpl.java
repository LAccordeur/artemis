package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.ExcelDTO;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.helper.ExcelHelper;
import com.kuo.artemis.server.dao.ExcelTestMapper;
import com.kuo.artemis.server.dao.RolePermissionMapper;
import com.kuo.artemis.server.service.FileService;
import com.kuo.artemis.server.util.constant.ExcelConst;
import com.kuo.artemis.server.util.file.ExcelUtil;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/27
 */
@Service
public class FileServiceImpl implements FileService {

    @Inject
    private ExcelTestMapper excelTestMapper;

    public Response parseAndSaveExcel(MultipartFile file) throws Exception {

        //解析
        //1.将Excel文件解析：一行用一个Map表示，所有行用一个List表示
        List<Map<String, Object>> rows = ExcelHelper.parseExcel(file);

        List<Object> resultList = new ArrayList();
        //2.依次将List中的每一行数据转化为改行所对应的对象
        for (int i = 0; i < rows.size(); i++) {

            Class<?> clazz = Class.forName(ExcelConst.ENTITY_PACKAGE + "." + "ExcelTest");    //*****未解决！！！！如何获取对象类型
            resultList.add(ExcelUtil.dataBind(clazz, rows.get(i)));

        }

        //保存至数据库
        int result = excelTestMapper.insertBatch(resultList);

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "upload success");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Excel数据有误，上传失败");
        }
    }
}
