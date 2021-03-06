package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.ExcelTest;
import com.kuo.artemis.server.entity.ExcelTestThree;
import com.kuo.artemis.server.entity.NutritionStandard;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Deprecated
public interface ExcelTestMapper extends BaseMapper {
    int insert(ExcelTest record);

    int insertSelective(ExcelTest record);

    int insertBatch(List rows);

    List<ExcelTest> selectSelective(List<String> columns);

    List<NutritionStandard> selectMultiObject(List<Integer> ids);

    ExcelTestThree selectTest(@Param("id") Integer id);
}