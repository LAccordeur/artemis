package com.kuo.artemis.server.entity;

import java.util.Date;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/26
 */
@Deprecated
public class ExcelTestThree {

    private String id;

    private String excelTestId;

    private String name;

    private long score;

    private int age;

    private Date birthday;

    private String university;

    private String school;

    private Integer grade;

    @Override
    public String toString() {
        return "ExcelTestThree{" +
                "id='" + id + '\'' +
                ", excelTestId='" + excelTestId + '\'' +
                ", name='" + name + '\'' +
                ", score=" + score +
                ", age=" + age +
                ", birthday=" + birthday +
                ", university='" + university + '\'' +
                ", school='" + school + '\'' +
                ", grade=" + grade +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getExcelTestId() {
        return excelTestId;
    }

    public void setExcelTestId(String excelTestId) {
        this.excelTestId = excelTestId;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
}
