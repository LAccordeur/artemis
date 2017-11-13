package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Permission {
    private Integer id;

    private String permissionName;

    private String permissionNameEnglish;

    private String permissionDescription;

    private String permissionDescriptionEnglish;

    private Boolean permissionType;

    private Boolean permissionAction;

    private Integer parentId;

    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", permissionName='" + permissionName + '\'' +
                ", permissionNameEnglish='" + permissionNameEnglish + '\'' +
                ", permissionDescription='" + permissionDescription + '\'' +
                ", permissionDescriptionEnglish='" + permissionDescriptionEnglish + '\'' +
                ", permissionType=" + permissionType +
                ", permissionAction=" + permissionAction +
                ", parentId=" + parentId +
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

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName == null ? null : permissionName.trim();
    }

    public String getPermissionNameEnglish() {
        return permissionNameEnglish;
    }

    public void setPermissionNameEnglish(String permissionNameEnglish) {
        this.permissionNameEnglish = permissionNameEnglish == null ? null : permissionNameEnglish.trim();
    }

    public String getPermissionDescription() {
        return permissionDescription;
    }

    public void setPermissionDescription(String permissionDescription) {
        this.permissionDescription = permissionDescription == null ? null : permissionDescription.trim();
    }

    public String getPermissionDescriptionEnglish() {
        return permissionDescriptionEnglish;
    }

    public void setPermissionDescriptionEnglish(String permissionDescriptionEnglish) {
        this.permissionDescriptionEnglish = permissionDescriptionEnglish == null ? null : permissionDescriptionEnglish.trim();
    }

    public Boolean getPermissionType() {
        return permissionType;
    }

    public void setPermissionType(Boolean permissionType) {
        this.permissionType = permissionType;
    }

    public Boolean getPermissionAction() {
        return permissionAction;
    }

    public void setPermissionAction(Boolean permissionAction) {
        this.permissionAction = permissionAction;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
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