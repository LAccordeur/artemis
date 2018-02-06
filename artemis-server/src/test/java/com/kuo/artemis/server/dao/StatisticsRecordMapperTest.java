package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.StatisticsDetailItem;
import com.kuo.artemis.server.entity.StatisticsDetailRecord;
import com.kuo.artemis.server.entity.StatisticsRecord;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class StatisticsRecordMapperTest {
    @Test
    public void deleteRecordById() throws Exception {
        Integer result = statisticsRecordMapper.deleteRecordById(1);
        System.out.println(result);
    }

    @Resource
    private StatisticsRecordMapper statisticsRecordMapper;

    @Resource
    private StatisticsDetailRecordMapper statisticsDetailRecordMapper;

    @Resource
    private StatisticsDetailItemMapper statisticsDetailItemMapper;

    @Test
    public void selectStatisticsRecordByProjectId() throws Exception {
        System.out.println(statisticsRecordMapper.selectStatisticsRecordByProjectId(20));
    }

    @Test
    public void selectStatisticsRecordDetailByRecordId() throws Exception {
        StatisticsRecord record = statisticsRecordMapper.selectStatisticsRecordDetailByRecordId(1);
        System.out.println(record);
    }

    @Test
    public void insertRecord() throws Exception {
        StatisticsRecord record = new StatisticsRecord();
        record.setProjectId(20);
        record.setStatisticsMethod(Short.valueOf("1"));
        record.setUserId(7);
        statisticsRecordMapper.insertSelective(record);
        Integer recordId = record.getId();

        for (int i = 0; i < 2; i++) {
            //对指标的数据进行处理
            StatisticsDetailRecord statisticsDetailRecord = new StatisticsDetailRecord();
            //statisticsDetailRecordList.add(statisticsDetailRecord);
            statisticsDetailRecord.setStatisticsIndicatorId(20);
            statisticsDetailRecord.setStatisticsIndicatorName("BW week14");
            statisticsDetailRecord.setpValue(BigDecimal.valueOf(0.211));
            statisticsDetailRecord.setStatisticsRecordId(recordId);
            statisticsDetailRecordMapper.insertSelective(statisticsDetailRecord);

            Integer detailId = statisticsDetailRecord.getId();
            //指标的数据有两个处理组
            List<StatisticsDetailItem> statisticsDetailItemList = new ArrayList<StatisticsDetailItem>();

            for (int j = 0; j < 2; j++) {
                StatisticsDetailItem item = new StatisticsDetailItem();
                item.setStatisticsDetailRecordId(detailId);
                item.setItemCode("T"+(j+1));
                item.setItemMean(BigDecimal.valueOf(3+j));
                item.setItemStderr(BigDecimal.valueOf(0.12));
                statisticsDetailItemList.add(item);
            }
            statisticsDetailItemMapper.insertBatch(statisticsDetailItemList);
        }

    }

}