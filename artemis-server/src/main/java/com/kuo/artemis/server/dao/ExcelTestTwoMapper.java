package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.ExcelTestTwo;

import java.util.List;

public interface ExcelTestTwoMapper extends BaseMapper {
    int insert(ExcelTestTwo record);

    int insertSelective(ExcelTestTwo record);

    int insertBatch(List rows);
}