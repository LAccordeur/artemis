package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.dto.animal.GroupDesignMovingSheet;
import com.kuo.artemis.server.core.dto.animal.GroupDesignSummary;
import com.kuo.artemis.server.util.constant.GroupDesignStatus;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public class GroupDesignResult {

    private String projectId;    //课题id

    private GroupDesignSummary summary;   //分组结果总结

    private GroupDesignMovingSheet movingSheet;   //分组结果movingSheet

    private GroupDesignParam param;

    private String status;    //分组结果状态

    @Override
    public String toString() {
        return "GroupDesignResult{" +
                "projectId='" + projectId + '\'' +
                ", summary=" + summary +
                ", movingSheet=" + movingSheet +
                ", param=" + param +
                ", status='" + status + '\'' +
                '}';
    }

    public GroupDesignParam getParam() {
        return param;
    }

    public void setParam(GroupDesignParam param) {
        this.param = param;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public GroupDesignSummary getSummary() {
        return summary;
    }

    public void setSummary(GroupDesignSummary summary) {
        this.summary = summary;
    }

    public GroupDesignMovingSheet getMovingSheet() {
        return movingSheet;
    }

    public void setMovingSheet(GroupDesignMovingSheet movingSheet) {
        this.movingSheet = movingSheet;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
