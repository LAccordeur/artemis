package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.Project;
import com.kuo.artemis.server.service.ProjectService;
import com.kuo.artemis.server.service.UserProjectService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/5
 */
@Controller
@RequestMapping(value = "/api", produces = {"application/json;charset=utf8"})
public class ProjectController {

    @Inject
    private ProjectService projectService;

    @Inject
    private UserProjectService userProjectService;


    /**
     * 创建一个课题
     * @param project
     * @return
     */
    @RequestMapping(value = "/project", method = RequestMethod.POST)
    @ResponseBody
    public Response createProject(@RequestBody Project project) {
        return projectService.createProject(project);
    }

    /**
     * 更新课题信息
     * @param project
     * @return
     */
    @RequestMapping(value = "/project", method = RequestMethod.PUT)
    @ResponseBody
    public Response updateProjectInfo(@RequestBody Project project) {
        return projectService.updateProjectInfoById(project);
    }


    /**
     * 获取课题信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/project/{projectId}", method = RequestMethod.GET)
    @ResponseBody
    public Response getProjectInfo(@PathVariable("projectId") String id) {
        return projectService.getProjectInfoById(id);
    }


    /**
     * 获取某个课题下的所有成员
     * @param projectId
     * @return
     */
    @RequestMapping(value = "/project/{projectId}/member", method = RequestMethod.GET)
    public Response listProjectMember(@PathVariable String projectId) {
        return userProjectService.listProjectMembersById(projectId);
    }

    /**
     * 根据课题名称关键词查询课题（未完成）
     * @param keyword
     * @return
     */
    @RequestMapping(value = "/project/info")
    public Response queryProjectByKeyword(String keyword) {
        return null;
    }





}
