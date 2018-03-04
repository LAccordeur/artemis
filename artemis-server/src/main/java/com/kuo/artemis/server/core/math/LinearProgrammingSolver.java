package com.kuo.artemis.server.core.math;

/*import com.datumbox.framework.mathematics.linearprogramming.LPSolver;
import lpsolve.LpSolve;*/

import com.datumbox.framework.core.mathematics.linearprogramming.LPSolver;
import com.kuo.artemis.server.core.factory.DecimalFormatFactory;
import com.quantego.clp.CLP;
import org.apache.commons.math3.optim.linear.LinearConstraint;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/3
 */
public class LinearProgrammingSolver {

    /**
     *
     * @param objectFunctionCoefficientList
     * @param constraintFunctionCoefficientList
     * @param constraintFunctionLeftValueBoundList
     * @param constraintFunctionRightValueBoundList
     * @param variableLeftBoundList
     * @param variableRightBoundList
     * @return
     */
    public static LinearProgrammingResult getMinimize(List<Double> objectFunctionCoefficientList, List<List<Double>> constraintFunctionCoefficientList, List<Double> constraintFunctionLeftValueBoundList, List<Double> constraintFunctionRightValueBoundList, List<Double> variableLeftBoundList, List<Double> variableRightBoundList) {

        //先对传入参数进行判断是否合法
        if (objectFunctionCoefficientList.size() == variableLeftBoundList.size() && objectFunctionCoefficientList.size() == variableRightBoundList.size()) {
            //do nothing
        } else {
            return null;
        }

        if (constraintFunctionCoefficientList.size() == constraintFunctionLeftValueBoundList.size() && constraintFunctionCoefficientList.size() == constraintFunctionRightValueBoundList.size()) {
            //do nothing
        } else {
            return null;
        }

        LinearProgrammingResult result = new LinearProgrammingResult();
        List<LPSolver.LPConstraint> linearConstraintsList = new ArrayList<LPSolver.LPConstraint>();

        //1.从参数中提取必要的信息
        int variableSize = objectFunctionCoefficientList.size();  //模型中的所有变量数

        //2.设置目标函数的系数
        double[] linearObjectiveFunction = listToArray(objectFunctionCoefficientList, null);

        //3.设置每个变量的范围
        for (int i = 0; i < variableSize; i++) {
            double[] coefficients = setOneAtIndex(i, variableSize);
            LPSolver.LPConstraint constraintLeft = new LPSolver.LPConstraint(coefficients, LPSolver.GEQ, variableLeftBoundList.get(i) * 0.01);
            LPSolver.LPConstraint constraintRight = new LPSolver.LPConstraint(coefficients, LPSolver.LEQ, variableRightBoundList.get(i) * 0.01);
            linearConstraintsList.add(constraintLeft);
            linearConstraintsList.add(constraintRight);
        }
        double[] basicCoefficients = setOneList(variableSize, 1);
        LPSolver.LPConstraint lpConstraint = new LPSolver.LPConstraint(basicCoefficients, LPSolver.EQ, 1);
        linearConstraintsList.add(lpConstraint);

        //4.设置约束函数
        for (int i = 0; i < constraintFunctionCoefficientList.size(); i++) {
            List<Double> constraintFunctionCoefficient = constraintFunctionCoefficientList.get(i);
            Double leftBound = constraintFunctionLeftValueBoundList.get(i);
            Double rightBound = constraintFunctionRightValueBoundList.get(i);
            LPSolver.LPConstraint lpConstraintLeft = new LPSolver.LPConstraint(listToArray(constraintFunctionCoefficient, null), LPSolver.GEQ, leftBound);
            LPSolver.LPConstraint lpConstraintRight = new LPSolver.LPConstraint(listToArray(constraintFunctionCoefficient, null), LPSolver.LEQ, rightBound);
            linearConstraintsList.add(lpConstraintLeft);
            linearConstraintsList.add(lpConstraintRight);
        }


        //5.求解
        LPSolver.LPResult lpResult = null;
        try {
            lpResult = LPSolver.solve(linearObjectiveFunction, linearConstraintsList, true, false);
        } catch (Exception e) {
            e.printStackTrace();
            result.setStatus(CLP.STATUS.INFEASIBLE);
            setDefaultResult(result, objectFunctionCoefficientList, constraintFunctionCoefficientList, constraintFunctionLeftValueBoundList, constraintFunctionRightValueBoundList, variableLeftBoundList, variableRightBoundList);
            return result;
        }
        System.out.println(lpResult.getObjectiveValue());

        Double objectiveValue = lpResult.getObjectiveValue();
        double[] variableValues = lpResult.getVariableValues();

        //6.设置返回结果
        DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
        //设置目标变量
        result.setVariableValueList(arrayToList(variableValues));
        //目标变量系数下限与上限
        result.setVariableValueLeftBoundList(variableLeftBoundList);
        result.setVariableValueRightBoundList(variableRightBoundList);
        //约束方程函数值下限与上限
        result.setConstraintValueLeftBoundList(constraintFunctionLeftValueBoundList);
        result.setConstraintValueRightBoundList(constraintFunctionRightValueBoundList);
        //约束方程函数值
        List<Double> constraintFunctionValueList = new ArrayList<Double>();
        for (int i = 0; i < constraintFunctionCoefficientList.size(); i++) {
            Double functionValue = 0D;
            List<Double> functionCoefficientList = constraintFunctionCoefficientList.get(i);
            for (int j = 0; j < functionCoefficientList.size(); j++) {
                functionValue = functionValue + functionCoefficientList.get(j) * variableValues[j];
            }
            constraintFunctionValueList.add(Double.valueOf(decimalFormat.format(functionValue)));
        }
        result.setConstraintFunctionValueList(constraintFunctionValueList);
        result.setStatus(CLP.STATUS.OPTIMAL);
        result.setResultValue(objectiveValue);

        return result;
    }

    private static void setDefaultResult(LinearProgrammingResult result, List<Double> objectFunctionCoefficientList, List<List<Double>> constraintFunctionCoefficientList, List<Double> constraintFunctionLeftValueBoundList, List<Double> constraintFunctionRightValueBoundList, List<Double> variableLeftBoundList, List<Double> variableRightBoundList) {

        int variableSize = variableLeftBoundList.size();
        result.setStatus(CLP.STATUS.INFEASIBLE);
        //设置目标变量上限与下限
        result.setVariableValueLeftBoundList(variableLeftBoundList);
        result.setVariableValueRightBoundList(variableRightBoundList);
        //设置目标变量的值
        double[] values = setOneList(variableSize, 1.0 / variableSize);
        result.setVariableValueList(arrayToList(values));
        //设置约束方程的上下限
        result.setConstraintValueLeftBoundList(constraintFunctionLeftValueBoundList);
        result.setConstraintValueRightBoundList(constraintFunctionRightValueBoundList);

        DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
        //约束方程函数值
        List<Double> constraintFunctionValueList = new ArrayList<Double>();
        for (int i = 0; i < constraintFunctionCoefficientList.size(); i++) {
            Double functionValue = 0D;
            List<Double> functionCoefficientList = constraintFunctionCoefficientList.get(i);
            for (int j = 0; j < functionCoefficientList.size(); j++) {
                functionValue = functionValue + functionCoefficientList.get(j) * values[j];
            }
            constraintFunctionValueList.add(Double.valueOf(decimalFormat.format(functionValue)));
        }
        result.setConstraintFunctionValueList(constraintFunctionValueList);

        //设置结果
        double resultValue = 0;
        for (int i = 0; i < variableSize; i++) {
            resultValue = resultValue + values[i] * objectFunctionCoefficientList.get(i);
        }
        result.setResultValue(resultValue);

    }

    private static double[] listToArray(List<Double> doubleList, Double coefficient) {
        int length = doubleList.size();
        double[] result = new double[length];

        if (coefficient == null) {
            for (int i = 0; i < length; i++) {
                result[i] = doubleList.get(i);
            }
        } else {
            for (int i = 0; i < length; i++) {
                result[i] = doubleList.get(i) * coefficient;
            }
        }

        return result;
    }

    private static List<Double> arrayToList(double[] doubles) {

        List<Double> doubleList = new ArrayList<Double>();

        for (int i = 0; i < doubles.length; i++) {
            doubleList.add((doubles[i]));
        }


        return doubleList;
    }

    private static double[] setOneAtIndex(int index, int length) {
        double[] doubles = new double[length];
        for (int i = 0; i < length; i++) {
            if (i != index) {
                doubles[i] = 0;
            } else {
                doubles[i] = 1;
            }
        }
        return doubles;
    }

    private static double[] setOneList(int length, double value) {
        double[] doubles = new double[length];
        for (int i = 0; i < length; i++) {
            doubles[i] = value;
        }

        return doubles;
    }
}
