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

    private GroupDesignSummary summary;   //分组结果总结

    private GroupDesignMovingSheet movingSheet;   //分组结果movingSheet

    private GroupDesignStatus status;    //分组结果状态

    @Override
    public String toString() {
        return "GroupDesignResult{" +
                "summary=" + summary +
                ", movingSheet=" + movingSheet +
                ", status=" + status +
                '}';
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

    public GroupDesignStatus getStatus() {
        return status;
    }

    public void setStatus(GroupDesignStatus status) {
        this.status = status;
    }
}
