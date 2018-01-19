package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;

import com.kuo.artemis.server.core.dto.excel.DataImportDTO;
import com.kuo.artemis.server.core.helper.DataHelper;
import com.kuo.artemis.server.dao.AnimalIndicatorRecordMapper;
import com.kuo.artemis.server.service.AnimalIndicatorRecordService;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/9
 */
public class AnimalIndicatorRecordServiceImpl implements AnimalIndicatorRecordService {

    @Inject
    private AnimalIndicatorRecordMapper animalIndicatorRecordMapper;


    public Response createNewRecordVersion(List<List<String>> recordList, String projectId) throws Exception {
        //1.获取当前文件的最新版本号
        int currentVersion;
        synchronized (this) {
            currentVersion = animalIndicatorRecordMapper.selectLastestVersion(projectId);
        }

        int newVersion = currentVersion + 1;

        //2.对数据进行转换
        DataImportDTO result = DataHelper.excelIndicatorDataToBean(recordList, 0, 1);
        Map<Class, List> objectMap = result.getObjectList();


        return null;
    }

    public Response saveRecord(List<List<String>> recordList, String projectId) {
        return null;
    }

    public Response getIndicatorRecordDetail(String projectId, String fileIdentifier, String version) {
        return null;
    }

    public Response listIndicatorRecords(String projectId) {
        return null;
    }

    public Response listIndicatorRecordVersions(String projectId, String fileIdentifier) {
        return null;
    }
}
