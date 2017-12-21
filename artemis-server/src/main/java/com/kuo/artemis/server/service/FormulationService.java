package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.formulation.FormulationParams;
import com.kuo.artemis.server.core.dto.formulation.FormulationResult;
import com.kuo.artemis.server.entity.Formulation;
import com.kuo.artemis.server.entity.FormulationMaterial;

import java.util.List;

/**
 * @author guoyang  TODO
 */
public interface FormulationService {

    /**
     * 展示某个项目下的所有配方简略信息
     * @param projectId
     * @return
     */
    Response listFormulations(String projectId);

    /**
     * 根据配方名获取配方id
     * @param formulationName
     * @return
     */
    Response getIdByFormulationName(String formulationName);

    /**
     * 获取某个课题下的所有配方名称
     * @param projectId
     * @return
     */
    Response listFormulationNames(String projectId);

    /**
     * 获取配方的详细信息
     * @param formulationId
     * @return
     */
    Response getFormulationDetail(String formulationId);

    /**
     * 更新配方基本信息
     * @param formulation
     * @return
     */
    Response updateFormulationBasic(Formulation formulation);

    /**
     * 更新配方的详细信息
     * @param formulationMaterials
     * @return
     */
    //Response updateFormulationDetail(List<FormulationMaterial> formulationMaterials);

    /**
     * 删除某个配方
     * @param formulationId
     * @return
     */
    Response deleteFormulation(String formulationId);

    /**
     * 规划配方
     * @param params
     * @return
     */
    Response programNewFormulation(FormulationParams params);

    /**
     * 生成一个新配方
     * @param result
     * @return
     */
    Response createNewFormulation(FormulationResult result);
}
