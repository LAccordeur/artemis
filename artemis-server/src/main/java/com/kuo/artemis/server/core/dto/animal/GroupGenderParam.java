package com.kuo.artemis.server.core.dto.animal;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/11
 */
public class GroupGenderParam {
    private Integer replicationRangeBegin;

    private Integer replicationRangeEnd;

    private Integer unitMaleNum;

    private Integer unitFemaleNum;

    public Integer getReplicationRangeBegin() {
        return replicationRangeBegin;
    }

    public void setReplicationRangeBegin(Integer replicationRangeBegin) {
        this.replicationRangeBegin = replicationRangeBegin;
    }

    public Integer getReplicationRangeEnd() {
        return replicationRangeEnd;
    }

    public void setReplicationRangeEnd(Integer replicationRangeEnd) {
        this.replicationRangeEnd = replicationRangeEnd;
    }

    public Integer getUnitMaleNum() {
        return unitMaleNum;
    }

    public void setUnitMaleNum(Integer unitMaleNum) {
        this.unitMaleNum = unitMaleNum;
    }

    public Integer getUnitFemaleNum() {
        return unitFemaleNum;
    }

    public void setUnitFemaleNum(Integer unitFemaleNum) {
        this.unitFemaleNum = unitFemaleNum;
    }
}
