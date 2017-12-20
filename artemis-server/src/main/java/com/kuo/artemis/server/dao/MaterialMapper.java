package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Material;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MaterialMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Material record);

    int insertSelective(Material record);

    List<Material> selectByUserId(@Param("userId") Integer userId);

    Material selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Material record);

    int updateByPrimaryKey(Material record);
}