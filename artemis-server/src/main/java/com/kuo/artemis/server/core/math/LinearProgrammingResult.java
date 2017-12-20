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

    private List<Double> coefficientFunctionValueList;    //每个约束方程的值  TODO 未赋值

    private Double resultValue;    //目标函数的最终取值

    private CLP.STATUS status;    //线性规划状态

    @Override
    public String toString() {
        return "LinearProgrammingResult{" +
                "variableValueList=" + variableValueList +
                ", coefficientFunctionValueList=" + coefficientFunctionValueList +
                ", resultValue=" + resultValue +
                ", status=" + status +
                '}';
    }

    public List<Double> getCoefficientFunctionValueList() {
        return coefficientFunctionValueList;
    }

    public void setCoefficientFunctionValueList(List<Double> coefficientFunctionValueList) {
        this.coefficientFunctionValueList = coefficientFunctionValueList;
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
