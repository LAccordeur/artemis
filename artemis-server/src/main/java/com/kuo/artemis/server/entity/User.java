package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.Date;

//@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(value = {"modifiedTime"})
public class User {
    private Integer id;

    private String userName;

    private Byte userGender;

    @NotNull
    @Length(min = 11, max = 11)
    private String userPhone;

    private String userEmail;

    private String userPassword;

    private String university;

    private String verificationCode;

    private Byte userIdentity;

    private Byte status;

    private Date createTime;

    private Date modifiedTime;


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", userGender=" + userGender +
                ", userPhone='" + userPhone + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", university='" + university + '\'' +
                ", userIdentity=" + userIdentity +
                ", status=" + status +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                '}';
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Byte getUserGender() {
        return userGender;
    }

    public void setUserGender(Byte userGender) {
        this.userGender = userGender;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university == null ? null : university.trim();
    }

    public Byte getUserIdentity() {
        return userIdentity;
    }

    public void setUserIdentity(Byte userIdentity) {
        this.userIdentity = userIdentity;
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