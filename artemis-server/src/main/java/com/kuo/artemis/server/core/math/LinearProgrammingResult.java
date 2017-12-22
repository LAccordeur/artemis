package com.kuo.artemis.server.core.math;

import com.quantego.clp.CLP;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/18
 */
public class LinearProgrammingResult {

    private List<Double> variableValueList;    //目标函数变量的最终取值集合

    private List<Double> variableValueLeftBoundList;    //目标函数变量值的下限集合，取决于输入

    private List<Double> variableValueRightBoundList;    //目标函数值的上限集合，取决于输入

    private List<Double> constraintFunctionValueList;    //每个约束方程的值

    private List<Double> constraintValueLeftBoundList;    //约束变量的取值下限集合，取决于输入

    private List<Double> constraintValueRightBoundList;    //约束变量的取值上限集合， 取决于输入

    private Double resultValue;    //目标函数的最终取值

    private CLP.STATUS status;    //线性规划状态

    @Override
    public String toString() {
        return "LinearProgrammingResult{" +
                "variableValueList=" + variableValueList +
                ", variableValueLeftBoundList=" + variableValueLeftBoundList +
                ", variableValueRightBoundList=" + variableValueRightBoundList +
                ", constraintFunctionValueList=" + constraintFunctionValueList +
                ", constraintValueLeftBoundList=" + constraintValueLeftBoundList +
                ", constraintValueRightBoundList=" + constraintValueRightBoundList +
                ", resultValue=" + resultValue +
                ", status=" + status +
                '}';
    }

    public List<Double> getVariableValueLeftBoundList() {
        return variableValueLeftBoundList;
    }

    public void setVariableValueLeftBoundList(List<Double> variableValueLeftBoundList) {
        this.variableValueLeftBoundList = variableValueLeftBoundList;
    }

    public List<Double> getVariableValueRightBoundList() {
        return variableValueRightBoundList;
    }

    public void setVariableValueRightBoundList(List<Double> variableValueRightBoundList) {
        this.variableValueRightBoundList = variableValueRightBoundList;
    }

    public List<Double> getConstraintValueLeftBoundList() {
        return constraintValueLeftBoundList;
    }

    public void setConstraintValueLeftBoundList(List<Double> constraintValueLeftBoundList) {
        this.constraintValueLeftBoundList = constraintValueLeftBoundList;
    }

    public List<Double> getConstraintValueRightBoundList() {
        return constraintValueRightBoundList;
    }

    public void setConstraintValueRightBoundList(List<Double> constraintValueRightBoundList) {
        this.constraintValueRightBoundList = constraintValueRightBoundList;
    }

    public List<Double> getConstraintFunctionValueList() {
        return constraintFunctionValueList;
    }

    public void setConstraintFunctionValueList(List<Double> constraintFunctionValueList) {
        this.constraintFunctionValueList = constraintFunctionValueList;
    }

    public List<Double> getVariableValueList() {
        return variableValueList;
    }

    public void setVariableValueList(List<Double> variableValueList) {
        this.variableValueList = variableValueList;
    }

    public Double getResultValue() {
        return resultValue;
    }

    public void setResultValue(Double resultValue) {
        this.resultValue = resultValue;
    }

    public CLP.STATUS getStatus() {
        return status;
    }

    public void setStatus(CLP.STATUS status) {
        this.status = status;
    }
}
