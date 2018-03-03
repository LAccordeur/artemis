package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.factory.DecimalFormatFactory;
import com.quantego.clp.CLP;
import org.apache.commons.math3.optim.PointValuePair;
import org.apache.commons.math3.optim.linear.*;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/24
 */
public class NewLinearProgramming {

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

        //1.从参数中提取必要的信息
        int variableSize = objectFunctionCoefficientList.size();  //模型中的所有变量数

        List<LinearConstraint> linearConstraintList = new ArrayList<LinearConstraint>();

        //2.设置每个变量的范围(单纯性法不支持SimpleBounds)
        //SimpleBounds simpleBounds = new SimpleBounds(listToArray(variableLeftBoundList, 0.01), listToArray(variableRightBoundList, 0.01));
        for (int i = 0; i < variableSize; i++) {
            double[] coefficients = setOneAtIndex(i, variableSize);
            LinearConstraint linearConstraintLeft = new LinearConstraint(coefficients, Relationship.GEQ, variableLeftBoundList.get(i) * 0.01);
            LinearConstraint linearConstraintRight = new LinearConstraint(coefficients, Relationship.LEQ, variableRightBoundList.get(i) * 0.01);
            linearConstraintList.add(linearConstraintLeft);
            linearConstraintList.add(linearConstraintRight);
        }
        double[] basicCoefficients = setOneList(variableSize, 1);
        LinearConstraint linearConstraint = new LinearConstraint(basicCoefficients, Relationship.EQ, 1);
        linearConstraintList.add(linearConstraint);


        //3.创建目标函数
        LinearObjectiveFunction linearObjectiveFunction = new LinearObjectiveFunction(listToArray(objectFunctionCoefficientList, null), 0);

        //4.设置下界、上界约束函数
        for (int i = 0; i < constraintFunctionCoefficientList.size(); i++) {
            List<Double> constraintFunctionCoefficient = constraintFunctionCoefficientList.get(i);
            Double leftBound = constraintFunctionLeftValueBoundList.get(i);
            Double rightBound = constraintFunctionRightValueBoundList.get(i);
            LinearConstraint linearConstraintLeft = new LinearConstraint(listToArray(constraintFunctionCoefficient, null), Relationship.GEQ, leftBound);
            LinearConstraint linearConstraintRight = new LinearConstraint(listToArray(constraintFunctionCoefficient, null), Relationship.LEQ, rightBound);
            linearConstraintList.add(linearConstraintLeft);
            linearConstraintList.add(linearConstraintRight);
        }
        //约束函数

        LinearConstraintSet linearConstraintSet = new LinearConstraintSet(linearConstraintList);

        //5.求解线性规划
        SimplexSolver simplexSolver = new SimplexSolver(0.01, 10, 0.0001);
        PointValuePair pointValuePair = null;
        SolutionCallback solutionCallback = new SolutionCallback();
        try {
            pointValuePair = simplexSolver.optimize(linearObjectiveFunction, linearConstraintSet, new NonNegativeConstraint(true), solutionCallback);

        } catch (Exception e) {
            e.printStackTrace();
            result.setStatus(CLP.STATUS.INFEASIBLE);
            setDefaultResult(result, objectFunctionCoefficientList, constraintFunctionCoefficientList, constraintFunctionLeftValueBoundList, constraintFunctionRightValueBoundList, variableLeftBoundList, variableRightBoundList);
            return result;
        }


        //6.设置返回结果
        DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
        Double objectValue = pointValuePair.getValue();
        double[] variableValues = pointValuePair.getPoint();
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
        //设置线性规划结果值
        result.setResultValue(objectValue);
        result.setStatus(CLP.STATUS.OPTIMAL);

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
