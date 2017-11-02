package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.entity.Project;
import com.kuo.artemis.server.service.ProjectService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class ProjectServiceImplTest {
    @Test
    public void getProjectInfoById() throws Exception {
        System.out.println(projectService.getProjectInfoById("3"));
    }

    @Test
    public void updateProjectInfoById() throws Exception {


    }

    @Resource
    private ProjectService projectService;

    @Test
    public void createProject() throws Exception {
        Project project = new Project();
        project.setProjectName("这是一个另外的测试的项目");
        project.setProjectAdminId(3);
        project.setProjectIntro("这真的是一个测试的项目");

        projectService.createProject(project);
    }

}