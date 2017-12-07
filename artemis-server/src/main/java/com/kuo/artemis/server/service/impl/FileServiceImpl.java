package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.ExcelDTO;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.command.ExportExcelCommand;
import com.kuo.artemis.server.core.helper.ExcelHelper;
import com.kuo.artemis.server.core.thread.ImportExcelTask;
import com.kuo.artemis.server.dao.*;
import com.kuo.artemis.server.entity.AnimalIndicator;
import com.kuo.artemis.server.entity.AnimalIndicatorRecord;
import com.kuo.artemis.server.service.FileService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

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

    @Inject
    private AnimalGrowthRecordMapper animalGrowthRecordMapper;

    @Inject
    private AnimalIndicatorMapper animalIndicatorMapper;

    @Inject
    private AnimalIndicatorRecordMapper animalIndicatorRecordMapper;


    private ExecutorService executorService = Executors.newCachedThreadPool();

    /**
     * 接收用户上传的文件并解析导入至数据库中   ##BUG## 1.未进行上传记录更新 2.未考虑历史记录 3.未进行计算指标的更新
     * @param file
     * @return
     * @throws Exception
     */
    public Response parseAndSaveExcel(MultipartFile file) throws Exception {


        //解析
        //1.将Excel文件解析
        ExcelDTO excelDTO = ExcelHelper.parseExcel(file);

        //2.依次将List中的每一行数据转化为改行所对应的对象
        Map<Class, List<Map<String, Object>>> map = excelDTO.getItems();
        Set<Map.Entry<Class, List<Map<String, Object>>>> set = map.entrySet();
        Iterator<Map.Entry<Class, List<Map<String, Object>>>> iterator = set.iterator();
        /*while (iterator.hasNext()) {
            Map.Entry<Class, List<Map<String, Object>>> entry = iterator.next();
            Class key = entry.getKey();
            List<Map<String, Object>> value = entry.getValue();


            List resultList = new ArrayList();
            for (int i = 0; i < value.size(); i++) {

                resultList.add(ExcelHelper.parseExcelRowToBean(key, value.get(i)));
            }
            //选择mapper进行导入
            if ("ExcelTestMapper".startsWith(key.getSimpleName())) {
                excelTestMapper.insertBatch(resultList);
            } else if ("ExcelTestTwoMapper".startsWith(key.getSimpleName())) {
                excelTestTwoMapper.insertBatch(resultList);
            }

        }*/


        List<BaseMapper> mappers = new ArrayList<BaseMapper>();
        mappers.add(excelTestMapper);
        mappers.add(excelTestTwoMapper);


        ImportExcelTask task = new ImportExcelTask(iterator, mappers);

        List<Future<Integer>> futures = new ArrayList<Future<Integer>>();
        for (int i = 0; i < set.size(); i++) {
            Future<Integer> future = executorService.submit(task);
            futures.add(future);
        }

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
                return new Response(HttpStatus.BAD_REQUEST.value(), "upload fail");
            }
        }



        //保存至数据库
        //int result = excelTestMapper.insertBatch(resultList);     // ##BUG##  多次导入同一文件

        /*if (result > 0) {
            return new Response(HttpStatus.OK.value(), "upload success");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Excel数据有误，上传失败");
        }*/
        return new Response(HttpStatus.OK.value(), "upload success");
    }


    /**
     * 根据用户选择的指标导出数据录入的excel模板  ##BUG## 未更新文件记录表
     * @param command
     * @return
     */
    public Response exportExcelTemplate(ExportExcelCommand command) {

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
        Workbook template = ExcelHelper.exportExcelTemplate(command);
        Response<Workbook> response = new Response<Workbook>();
        response.setData(template);

        return response;
    }

    public Response exportExcelWithData(ExportExcelCommand command) {
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
        //4.获取数据表正文数据
        List<Map<String, Object>> dataRows;

        //变量名转为下划线类型以便在数据库中查询
        List<String> underlineFields = new ArrayList<String>();
        for (int i = 0; i < englishName.size(); i++) {
            String oldField = englishName.get(i);
            StringBuffer newField = new StringBuffer();
            if (oldField.contains(" ")) {
                String[] words = oldField.trim().split(" ");
                if (words.length > 1) {
                    for (int j = 0; j < words.length; j++) {
                        newField.append(words[i].toLowerCase()).append("_");
                    }
                } else  {

                }
            }
            underlineFields.add(newField.toString());
        }
        List<AnimalIndicatorRecord> animalIndicatorRecords = animalIndicatorRecordMapper.selectSelective(null);



        return null;
    }
}
