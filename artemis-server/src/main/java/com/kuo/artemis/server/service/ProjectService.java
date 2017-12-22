package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.Project;

public interface ProjectService {

    Response createProject(Project project);

    Response getProjectInfoById(String projectId);

    Response updateProjectInfoById(Project project);

    Response searchProject(String keyword);

}
