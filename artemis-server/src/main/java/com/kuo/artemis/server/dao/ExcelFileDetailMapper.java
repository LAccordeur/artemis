package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.ExcelFileDetail;

import java.util.List;

public interface ExcelFileDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ExcelFileDetail record);

    int insertBatch(List<ExcelFileDetail> records);

    int insertSelective(ExcelFileDetail record);

    ExcelFileDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ExcelFileDetail record);

    int updateByPrimaryKey(ExcelFileDetail record);
}