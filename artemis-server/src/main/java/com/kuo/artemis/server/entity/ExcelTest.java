package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.JsonSerializable;

import java.util.Date;
@Deprecated
public class ExcelTest {
    private String name;

    private long score;

    private Integer age;

    private Date birthday;

    @JsonProperty(value = "my name")
    private String myName;

    @JsonProperty(value = "create time")
    private Date createTime;

    @Override
    public String toString() {
        return "ExcelTest{" +
                "name='" + name + '\'' +
                ", score=" + score +
                ", age=" + age +
                ", birthday=" + birthday +
                ", myName='" + myName + '\'' +
                ", createTime=" + createTime +
                '}';
}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getScore() {
        return score;
    }

    public void setScore(long score) {
        this.score = score;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getMyName() {
        return myName;
    }

    public void setMyName(String myName) {
        this.myName = myName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}