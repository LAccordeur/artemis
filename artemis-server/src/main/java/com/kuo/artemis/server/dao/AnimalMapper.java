package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Animal;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;

public interface AnimalMapper extends BaseMapper {
    int deleteByPrimaryKey(String id);

    int insert(Animal record);

    int insertSelective(Animal record);

    List<Animal> selectByProjectId(@Param("projectId") Integer projectId);

    Animal selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Animal record);

    int updateByPrimaryKey(Animal record);

    int insertBatch(List records);

    int updateBatch(List records);

    int deleteByProjectIdAndFileIdentifierAndVersion(@Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier, @Param("version") Integer version);

    int insertAnimalGroupDetailBatch(List<Animal> rows);

    List<Animal> selectAnimalGroupDetailList(@Param("projectId") Integer projectId);

    @MapKey("id_number")
    Map<String, Animal> selectIdMap(@Param("list") List<String> idNumbers, @Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier, @Param("version") Integer version);

    int deleteAnimalGroupByProjectId(@Param("projectId") Integer projectId);

    int selectAnimalGroupStatus(@Param("projectId") Integer projectId);
}