package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.*;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.ProjectService;
import org.apache.commons.lang3.StringUtils;
import org.json.HTTP;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :处理建立课题、更新课题、获取课题信息相关的任务
 * @Date : Created on 2017/10/30
 */
@Service
@Transactional
public class ProjectServiceImpl implements ProjectService {

    @Inject
    private ProjectMapper projectMapper;

    @Inject
    private UserProjectMapper userProjectMapper;

    @Inject
    private RoleMapper roleMapper;

    @Inject
    private RolePermissionMapper rolePermissionMapper;

    @Inject
    private PermissionMapper permissionMapper;

    @Inject
    private UserRoleMapper userRoleMapper;

    @Inject
    private UserMapper userMapper;

    @Inject
    private MaterialMapper materialMapper;

    @Inject
    private NutritionStandardMapper nutritionStandardMapper;

    /**
     * 创建一个课题
     * @param project
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response createProject(Project project) {

        Response response = new Response();


        Integer userId = project.getProjectAdminId();
        //创建课题以及一系列的级联操作
        //1.创建课题
        if (userId != null) {
            String adminName = userMapper.selectById(userId).getUserName();
            project.setProjectAdminName(adminName);
        }
        projectMapper.insertSelective(project);
        //2.创建用户课题关系
        Integer newProjectId = project.getId();
        userProjectMapper.insertUserProjectByCreate(new UserProjectKey(userId, newProjectId));
        //3.创建角色
        Role role = new Role(newProjectId, "课题负责人", 0);
        roleMapper.insertSelective(role);
        Integer newRoleId = role.getId();

        //4.创建角色权限关系
        List<Integer> permissionIdList = permissionMapper.selectPermissionIdList();
        List<RolePermissionKey> rolePermissionList = new ArrayList<RolePermissionKey>();
        for (Integer id : permissionIdList) {
            RolePermissionKey rolePermissionKey = new RolePermissionKey();
            rolePermissionList.add(rolePermissionKey);
            rolePermissionKey.setRoleId(newRoleId);
            rolePermissionKey.setPermissionId(id);
        }

        /*RolePermission rolePermission = new RolePermission();
        rolePermission.setPermissionId(1);
        rolePermission.setRoleId(1);
        rolePermissionMapper.insertSelective(rolePermission);*/


        //5.创建用户初始的原料库和指标库
        List<Material> materialListFromDB = materialMapper.selectByUserId(userId);
        if (materialListFromDB == null || materialListFromDB.size() == 0) {
            List<Material> materialList = materialMapper.selectBaseMaterial();
            for (Material material : materialList) {
                material.setId(null);
                material.setUserId(userId);
            }
            materialMapper.insertBatch(materialList);
        }


        List<NutritionStandard> nutritionStandardListFromDB = nutritionStandardMapper.selectByUserId(userId);
        if (nutritionStandardListFromDB == null || nutritionStandardListFromDB.size() ==0) {
            List<NutritionStandard> nutritionStandardList = nutritionStandardMapper.selectBaseNutritionStandards();
            for (NutritionStandard nutritionStandard : nutritionStandardList) {
                nutritionStandard.setId(null);
                nutritionStandard.setUserId(userId);
            }
            nutritionStandardMapper.insertBatch(nutritionStandardList);

        }

        rolePermissionMapper.insertBatch(rolePermissionList);
        //6.创建用户角色关系
        int result = userRoleMapper.insertSelective(new UserRole(userId, newRoleId));


        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("创建课题成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("创建课题失败");
        }



        return response;
    }


    /**
     * 通过课题id获取课题的详细信息
     * @param projectId
     * @return
     */
    public Response getProjectInfoById(String projectId) {

        Response response = new Response();

        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        Project data = projectMapper.selectByPrimaryKey(Integer.parseInt(projectId));

        if (data != null) {
            response.setData(data);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("获取课题信息成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("获取课题信息失败");
        }


        return response;
    }

    /**
     * 更新课题信息
     * @param project
     * @return
     */
    public Response updateProjectInfoById(Project project) {
        Response response = new Response();


        int result = projectMapper.updateByPrimaryKeySelective(project);

        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("更新课题信息成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("更新课题信息失败");
        }

        return response;
    }


    public Response searchProject(String keyword) {
        if ("".equals(keyword)) {
            return new Response(HttpStatus.NO_CONTENT.value(), "搜索参数不能为空");
        }

        List<Project> projectList = projectMapper.selectByKeyword(keyword);

        if (StringUtils.isNumeric(keyword)) {
            Project project = projectMapper.selectByPrimaryKey(Integer.valueOf(keyword));
            if (projectList != null) {
                projectList.add(project);
            } else {
                projectList = new ArrayList<Project>();
                projectList.add(project);
            }

        }
        projectList.remove(null);
        return new Response(projectList, HttpStatus.OK.value(), "课题搜索列表");
    }


    public Response deleteProject(String projectId) {
        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        int result = projectMapper.deleteByPrimaryKey(Integer.valueOf(projectId));

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "删除成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "删除失败");
        }
    }
}
