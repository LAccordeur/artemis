package com.kuo.artemis.server.core.helper;

import com.kuo.artemis.server.core.dto.statistics.StatisticsItem;
import com.kuo.artemis.server.entity.StatisticsDetailItem;
import com.kuo.artemis.server.entity.StatisticsDetailRecord;
import com.kuo.artemis.server.entity.StatisticsRecord;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/2/6
 */
@Deprecated
public class StatisticsHelper {





    /**
     * 一个指标的分析流程：进行分析的时候根据用户提交的参数做如下操作
     * 1.构建好一个统计记录的对象（包含三个层次的）
     * 2.获取所有要分析的指标
     * 3.对每个指标进行如下demo方法中的操作
     */
    @Deprecated
    public void demo(StatisticsRecord record) {
        //基础的准备数据
        String indicatorName = "dd";
        List<String> treatmentCodeList = new ArrayList<String>();
        List<StatisticsDetailItem> statisticsDetailItemList = new ArrayList<StatisticsDetailItem>();
        StatisticsDetailRecord detailRecord = new StatisticsDetailRecord();
        detailRecord.setStatisticsDetailItemList(statisticsDetailItemList);

        record.getStatisticsDetailRecordList().add(detailRecord);

        List<List<Double>> statisticsData = new ArrayList<List<Double>>();
        for (int i = 0; i < treatmentCodeList.size(); i++) {
            //获取这个指标下每个处理组的数据
            List<Double> treatmentData = new ArrayList<Double>();
            statisticsData.add(treatmentData);
            StatisticsItem item = new StatisticsItem();
            item.setInitialData(treatmentData);
            statisticsDetailItemList.add(item);
            //分析每个处理组的均值与标准误
            item.setItemMean(BigDecimal.valueOf(11));
            item.setItemStderr(BigDecimal.valueOf(0.1));
        }

        //将statisticsData进行相应的统计方法分析得到p值
        detailRecord.setpValue(BigDecimal.valueOf(22));
        detailRecord.setStatisticsIndicatorName(indicatorName);
    }

    //多因素分析的流程（单个指标）
    //1.根据处理组依次获取数据（包含两个因素的各自水平也要连同获取），这样每个item对象包含该指标的某个处理组的数据，以及该处理组对应的因素A的水平和因素B的水平
    //2.对每个item对象计算均值和标准误
    //3.将这个指标的item list进行分类处理按因素A的水平放在两个map中
    //4.依次对每个map中的数据根据因素B的水平放入TransposeDataCollection
    //5.将上述的TransposeDataCollection放入TransposeDataCollection2D对象
}
