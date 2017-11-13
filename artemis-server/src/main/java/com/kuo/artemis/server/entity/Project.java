package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Project {
    private Integer id;

    private String projectName;

    private Integer projectAdminId;

    private String projectAdminName;

    private String projectIntro;

    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", projectName='" + projectName + '\'' +
                ", projectAdminId=" + projectAdminId +
                ", projectAdminName='" + projectAdminName + '\'' +
                ", projectIntro='" + projectIntro + '\'' +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public Integer getProjectAdminId() {
        return projectAdminId;
    }

    public void setProjectAdminId(Integer projectAdminId) {
        this.projectAdminId = projectAdminId;
    }

    public String getProjectAdminName() {
        return projectAdminName;
    }

    public void setProjectAdminName(String projectAdminName) {
        this.projectAdminName = projectAdminName == null ? null : projectAdminName.trim();
    }

    public String getProjectIntro() {
        return projectIntro;
    }

    public void setProjectIntro(String projectIntro) {
        this.projectIntro = projectIntro == null ? null : projectIntro.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}