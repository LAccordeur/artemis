package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;

import com.kuo.artemis.server.core.dto.excel.DataImportDTO;
import com.kuo.artemis.server.core.helper.DataHelper;
import com.kuo.artemis.server.dao.*;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.AnimalIndicatorRecordService;
import com.kuo.artemis.server.util.common.StringUtil;
import com.kuo.artemis.server.util.common.UUIDUtil;
import com.kuo.artemis.server.util.constant.FileTypeConst;
import com.kuo.artemis.server.util.constant.OperationTypeConst;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    @Transactional(rollbackFor = Exception.class)
    public Response createNewRecordVersion(List<List<String>> recordList, String projectId, String userId, String filename) throws Exception {

        int currentVersion;
        synchronized (this) {
            //1.获取当前文件的最新版本号
            String fileIdentifier = StringUtil.getHashSubCode(filename);
            currentVersion = fileRecordMapper.selectLastestVersion(Integer.valueOf(projectId), fileIdentifier);
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
            for (int i = 0; i < animalList.size(); i++) {
                Animal animal = (Animal) animalList.get(i);
                animal.setId(animalIds.get(i));
                animal.setFileIdentifier(fileIdentifier);
                animal.setUserId(Integer.valueOf(userId));
                animal.setProjectId(Integer.valueOf(projectId));
                animal.setVersion(newVersion);
            }
            animalMapper.insertBatch(animalList);

            List animalGrowthList = objectMap.get(AnimalGrowthRecord.class);
            for (int i = 0; i < animalGrowthList.size(); i++) {
                AnimalGrowthRecord animalGrowthRecord = (AnimalGrowthRecord) animalGrowthList.get(i);
                animalGrowthRecord.setAnimalId(animalIds.get(i));
                animalGrowthRecord.setFileIdentifier(fileIdentifier);
                animalGrowthRecord.setUserId(Integer.valueOf(userId));
                animalGrowthRecord.setProjectId(Integer.valueOf(projectId));
                animalGrowthRecord.setVersion(newVersion);
            }
            animalGrowthRecordMapper.insertBatch(animalGrowthList);

            List animalGutList = objectMap.get(AnimalGutMicrobiotaRecord.class);
            for (int i = 0; i < animalGutList.size(); i++) {
                AnimalGutMicrobiotaRecord gutMicrobiotaRecord = (AnimalGutMicrobiotaRecord) animalGutList.get(i);
                gutMicrobiotaRecord.setAnimalId(animalIds.get(i));
                gutMicrobiotaRecord.setFileIdentifier(fileIdentifier);
                gutMicrobiotaRecord.setUserId(Integer.valueOf(userId));
                gutMicrobiotaRecord.setProjectId(Integer.valueOf(projectId));
                gutMicrobiotaRecord.setVersion(newVersion);
            }

        }
        return new Response(HttpStatus.OK.value(), "创建新版本成功");
    }

    @Transactional(rollbackFor = Exception.class)
    public Response saveRecord(List<List<String>> recordList, String projectId, String userId, String fileId) throws Exception {

        //1.更新文件记录
        FileRecord fileRecord = new FileRecord();
        fileRecord.setId(Integer.valueOf(fileId));
        fileRecordMapper.updateByPrimaryKeySelective(fileRecord);

        //2.更新各个动物表
        DataImportDTO result = DataHelper.excelIndicatorDataToBean(recordList, 0, 1);
        Map<Class, List> objectMap = result.getObjectList();

        List animalList = objectMap.get(Animal.class);
        animalMapper.updateBatch(animalList);
        List animalGrowthList = objectMap.get(AnimalGrowthRecord.class);
        animalGrowthRecordMapper.updateBatch(animalGrowthList);
        List animalGutList = objectMap.get(AnimalGutMicrobiotaRecord.class);
        animalGutMicrobiotaRecordMapper.updateBatch(animalGutList);

        return new Response(HttpStatus.OK.value(), "更新数据成功");
    }

    public Response getIndicatorRecordDetail(String projectId, String fileIdentifier, String version) {

        Integer fileRecordId = fileRecordMapper.selectIdByFileIdentifierAndVersion(fileIdentifier, Integer.valueOf(version));
        //1.获取该版本所选取的指标项
        List<String> indicatorList = animalIndicatorMapper.selectNameByFileRecordId(fileRecordId);

        //2.获取数据
        List<AnimalIndicatorRecord> animalIndicatorRecordList = animalIndicatorRecordMapper.selectSelective(indicatorList, Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));

        return new Response(animalIndicatorRecordList, HttpStatus.OK.value(), "获取数据成功");
    }

    public Response listIndicatorRecords(String projectId) {

        List<FileRecord> fileRecordList = fileRecordMapper.selectIndicatorRecordFiles(Integer.valueOf(projectId));

        return new Response(fileRecordList, HttpStatus.OK.value(), "文件列表");
    }

    public Response listIndicatorRecordVersions(String projectId, String fileIdentifier) {

        List<FileRecord> fileRecordList = fileRecordMapper.selectIndicatorRecordFileVersions(Integer.valueOf(projectId), fileIdentifier);
        return new Response(fileRecordList, HttpStatus.OK.value(), "文件版本列表");
    }
}
