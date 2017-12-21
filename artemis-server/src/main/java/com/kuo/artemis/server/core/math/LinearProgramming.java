package com.kuo.artemis.server.core.math;

import com.quantego.clp.CLP;
import com.quantego.clp.CLPExpression;
import com.quantego.clp.CLPVariable;
import com.quantego.clp.CLPVariableSet;
import com.sun.istack.internal.NotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/18
 */
public class LinearProgramming {

    /**
     * 线性规划求最大值
     * @param objectFunctionCoefficientList
     * @param constraintFunctionCoefficientList
     * @param constraintFunctionValueList
     * @param variableLeftBoundList
     * @param variableRightBoundList
     * @return
     */
    public static LinearProgrammingResult getMaximize(@NotNull List<Double> objectFunctionCoefficientList, @NotNull List<List<Double>> constraintFunctionCoefficientList, @NotNull List<Double> constraintFunctionValueList, List<Double> variableLeftBoundList, List<Double> variableRightBoundList) {

        LinearProgrammingResult result = new LinearProgrammingResult();

        //1.从参数中提取必要的信息
        int variableSize = objectFunctionCoefficientList.size();  //模型中的所有变量数
        int constraintSize = constraintFunctionValueList.size();  //约束方程数

        //2.建立线性规划模型
        CLP model = new CLP();
        //3.创建变量
        CLPVariableSet variableSet = model.addVariables(variableSize);
        CLPVariable[] variables = variableSet.build();
        Map<CLPVariable, Double> map = new HashMap<CLPVariable, Double>();
        for (int i = 0; i < variables.length; i++) {
            //设置每个变量的范围
            if (variableLeftBoundList != null && variableRightBoundList != null) {
                variables[i].bounds(variableLeftBoundList.get(i), variableRightBoundList.get(i));
            } else if (variableLeftBoundList != null) {
                variables[i].lb(variableLeftBoundList.get(i));
            } else if (variableRightBoundList != null) {
                variables[i].ub(variableRightBoundList.get(i));
            }
            map.put(variables[i], objectFunctionCoefficientList.get(i));
        }

        //4.设置目标函数
        model.addObjective(map, 0);

        //5.设置约束条件
        for (int i = 0; i < constraintSize; i++) {
            //按行进行构建约束方程
            CLPExpression expression = model.createExpression();
            List<Double> coefficientList = constraintFunctionCoefficientList.get(i);
            for (int j = 0; j < variableSize; j++) {
                expression.add(coefficientList.get(j), variables[j]);
            }
            expression.leq(constraintFunctionValueList.get(i));
        }

        //6.求解
        CLP.STATUS status = model.maximize();
        result.setStatus(status);

        //7.设置返回结果
        List<Double> resultVarValueList = new ArrayList<Double>();
        for (int i = 0; i < variableSize; i++) {
            Double value = model.getSolution(variables[i]);
            resultVarValueList.add(value);
        }
        result.setVariableValueList(resultVarValueList);

        Double resultValue = model.getObjectiveValue();
        result.setResultValue(resultValue);


        return result;

    }


    /**
     * 线性规划求最小值
     * @param objectFunctionCoefficientList
     * @param constraintFunctionCoefficientList
     * @param constraintFunctionValueList
     * @param variableLeftBoundList
     * @param variableRightBoundList
     * @return
     */
    public static LinearProgrammingResult getMinimize(List<Double> objectFunctionCoefficientList, List<List<Double>> constraintFunctionCoefficientList, List<Double> constraintFunctionValueList, List<Double> variableLeftBoundList, List<Double> variableRightBoundList) {

        LinearProgrammingResult result = new LinearProgrammingResult();

        //1.从参数中提取必要的信息
        int variableSize = objectFunctionCoefficientList.size();  //模型中的所有变量数
        int constraintSize = constraintFunctionValueList.size();  //约束方程数

        //2.建立线性规划模型
        CLP model = new CLP();
        //3.创建变量
        CLPVariableSet variableSet = model.addVariables(variableSize);
        CLPVariable[] variables = variableSet.build();
        Map<CLPVariable, Double> map = new HashMap<CLPVariable, Double>();
        for (int i = 0; i < variables.length; i++) {
            //设置每个变量的范围
            if (variableLeftBoundList != null && variableRightBoundList != null) {
                variables[i].bounds(variableLeftBoundList.get(i), variableRightBoundList.get(i));
            } else if (variableLeftBoundList != null) {
                variables[i].lb(variableLeftBoundList.get(i));
            } else if (variableRightBoundList != null) {
                variables[i].ub(variableRightBoundList.get(i));
            }
            map.put(variables[i], objectFunctionCoefficientList.get(i));
        }

        //4.设置目标函数
        model.addObjective(map, 0);

        //5.设置约束条件
        for (int i = 0; i < constraintSize; i++) {
            //按行进行构建约束方程
            CLPExpression expression = model.createExpression();
            List<Double> coefficientList = constraintFunctionCoefficientList.get(i);
            for (int j = 0; j < variableSize; j++) {
                expression.add(coefficientList.get(j), variables[j]);
            }
            expression.eq(constraintFunctionValueList.get(i));

        }

        //6.求解
        CLP.STATUS status = model.minimize();
        result.setStatus(status);

        //7.设置返回结果
        List<Double> resultVarValueList = new ArrayList<Double>();
        for (int i = 0; i < variableSize; i++) {
            Double value = model.getSolution(variables[i]);
            resultVarValueList.add(value);
        }
        result.setVariableValueList(resultVarValueList);

        Double resultValue = model.getObjectiveValue();
        result.setResultValue(resultValue);

        return result;

    }
}
