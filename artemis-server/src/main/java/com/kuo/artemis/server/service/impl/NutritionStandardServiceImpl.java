package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.dto.excel.DataImportDTO;
import com.kuo.artemis.server.core.helper.DataHelper;
import com.kuo.artemis.server.dao.NutritionStandardMapper;
import com.kuo.artemis.server.entity.NutritionStandard;
import com.kuo.artemis.server.service.NutritionStandardService;
import com.kuo.artemis.server.util.ValidationUtil;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/21
 */
@Service
public class NutritionStandardServiceImpl implements NutritionStandardService {

    @Inject
    private NutritionStandardMapper nutritionStandardMapper;

    public Response listNutritionStandards(String userId) {

        if (userId == null || "".equals(userId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }
        List<NutritionStandard> nutritionStandardList = nutritionStandardMapper.selectByUserId(Integer.valueOf(userId));

        if (nutritionStandardList == null || nutritionStandardList.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "列表为空");
        }
        //List<List<String>> result = DataHelper.objectListToArrayList(nutritionStandardList);
        return new Response(nutritionStandardList, HttpStatus.OK.value(), "获取营养标准列表成功");
    }


    public Response getNutritionStandardDetail(String nutritionStandardId) {
        if (nutritionStandardId == null || "".equals(nutritionStandardId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        NutritionStandard nutritionStandard = nutritionStandardMapper.selectByPrimaryKey(Integer.valueOf(nutritionStandardId));

        return new Response(nutritionStandard, HttpStatus.OK.value(), "获取营养标准成功");
    }

    public Response listNutritionStandardsBrief(String userId) {
        if (userId == null || "".equals(userId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        List<NutritionStandard> nutritionStandardList = nutritionStandardMapper.selectBriefByUserId(Integer.valueOf(userId));
        if (nutritionStandardList == null || nutritionStandardList.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "列表为空");
        }

        return new Response(nutritionStandardList, HttpStatus.OK.value(), "获取营养标准简略表成功");
    }

    public Response updateNutritionStandardDetail(NutritionStandard nutritionStandard, String userId) {
        //nutritionStandard.setUserId(Integer.valueOf(userId));
        if (userId == null || "".equals(userId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        int result = nutritionStandardMapper.updateByPrimaryKeySelective(nutritionStandard);

        NutritionStandard newNutritionStandard = nutritionStandardMapper.selectByPrimaryKey(nutritionStandard.getId());
        if (result > 0) {
            return new Response(newNutritionStandard, HttpStatus.OK.value(), "更新营养标准成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "更新营养标准失败");
        }

    }

    public Response deleteNutritionStandard(String nutritionStandardId) {
        if (nutritionStandardId == null || "".equals(nutritionStandardId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        int result = nutritionStandardMapper.deleteByPrimaryKey(Integer.valueOf(nutritionStandardId));

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "删除营养标准成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "删除营养标准失败");
        }

    }

    public Response createNewNutritionStandard(NutritionStandard nutritionStandard, String userId) {
        if (userId == null || "".equals(userId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        nutritionStandard.setUserId(Integer.valueOf(userId));
        int result = nutritionStandardMapper.insertSelective(nutritionStandard);

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "创建营养标准成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "创建营养标准失败");
        }

    }

    public Response createNutritionStandardsBatch(DataImportCommand command) throws Exception {

        String userId = command.getUserId();
        List<List<String>> dataList = command.getDataList();

        try {
            ValidationUtil.getInstance().validateParams(command);
        } catch (Exception e) {
            return new Response(e);
        }

        //将二维数组类型的数据进行转换并组装
        DataImportDTO dataImportDTO = DataHelper.excelDataToBean(dataList, NutritionStandard.class, 0, 1);
        List objectList = dataImportDTO.getCommonList();
        for (int i = 0; i < objectList.size(); i++) {
            NutritionStandard nutritionStandard = (NutritionStandard) objectList.get(i);
            nutritionStandard.setUserId(Integer.valueOf(userId));
        }

        //剔除重复数据并增加新添数据
        List<NutritionStandard> dbNutritionStandardList = nutritionStandardMapper.selectByUserId(Integer.valueOf(userId));
        Boolean removeResult = objectList.removeAll(dbNutritionStandardList);
        if (removeResult && objectList != null && objectList.size() == 0) {
            return new Response(dbNutritionStandardList, HttpStatus.NO_CONTENT.value(), "请勿添加重复数据");
        }

        int insertResult = nutritionStandardMapper.insertBatch(objectList);

        if (insertResult > 0) {
            return new Response(HttpStatus.OK.value(), "新增营养标准成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "新增营养标准失败");
        }

    }
}
