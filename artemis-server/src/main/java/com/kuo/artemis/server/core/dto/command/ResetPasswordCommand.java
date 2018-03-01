package com.kuo.artemis.server.core.dto.command;

import javax.validation.constraints.NotNull;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/1
 */
public class ResetPasswordCommand {

    @NotNull
    private String phone;   //用户账号

    @NotNull
    private String verificationCode;  //旧密码

    @NotNull
    private String newPassword;

    @Override
    public String toString() {
        return "ResetPasswordCommand{" +
                "phone='" + phone + '\'' +
                ", verificationCode='" + verificationCode + '\'' +
                ", newPassword='" + newPassword + '\'' +
                '}';
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
