package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.dto.excel.DataSaveCommand;
import com.kuo.artemis.server.entity.Animal;

import java.util.List;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public interface AnimalIndicatorRecordService {

    /**
     * 获取某个课题下已录入的指标数据
     *
     * @param projectId
     * @param fileIdentifier
     * @param version
     * @return
     */
    Response getIndicatorRecordDetail(String projectId, String fileIdentifier, String version);


    /**
     * 创建新的数据版本
     *
     * @param command
     * @return
     */
    Response createNewRecordVersion(DataImportCommand command) throws Exception;

    /**
     * v2
     * @param command
     * @return
     * @throws Exception
     */
    Response createRecordVersion(DataImportCommand command) throws Exception;

    /**
     * v2
     * @param projectId
     * @param fileIdentifier
     * @param version
     * @return
     */
    Response listAnimalRecords(String projectId, String fileIdentifier, String version);

    /**
     * v2
     * @param projectId
     * @param fileIdentifier
     * @param version
     * @return
     */
    Response deleteCurrentVersion(String projectId, String fileIdentifier, String version);

    /**
     * v2
     * @param command
     * @return
     * @throws Exception
     */
    Response saveCurrentRecord(DataSaveCommand command) throws Exception;


    /**
     * 获取某个课题下已导入的指标文件列表
     *
     * @param projectId
     * @return
     */
    Response listIndicatorRecords(String projectId);

    /**
     * 获取某个文件的所有版本
     *
     * @param fileIdentifier
     * @return
     */
    Response listIndicatorRecordVersions(String projectId, String fileIdentifier);


    Response listAllIndicators();

    Response listAllIndicatorTypes();

    Response listIndicatorsByType(String type);
}