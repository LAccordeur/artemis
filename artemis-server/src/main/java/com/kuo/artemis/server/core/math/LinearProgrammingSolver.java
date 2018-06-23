package com.kuo.artemis.server.core.math;

/*import com.datumbox.framework.mathematics.linearprogramming.LPSolver;
import lpsolve.LpSolve;*/

import com.datumbox.framework.core.mathematics.linearprogramming.LPSolver;
import com.kuo.artemis.server.core.factory.DecimalFormatFactory;
import com.quantego.clp.CLP;
import org.apache.commons.math3.optim.linear.LinearConstraint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/3
 */
public class LinearProgrammingSolver {


    private static Logger logger = LoggerFactory.getLogger(LinearProgrammingSolver.class);

    public static void main(String[] args) {
        List<Double> objectFunctionCoefficientList = new ArrayList<Double>(Arrays.asList(1800.0, 1900.0, 1900.0, 1820.0, 1900.0, 1300.0, 1500.0, 1000.0, 1700.0, 1800.0, 2100.0, 2200.0, 1700.0));

        List<List<Double>> constraintFunctionCoefficientsList = new ArrayList<List<Double>>();
        List<Double> constraintFunctionCoefficient1 = new ArrayList<Double>(Arrays.asList(14.0, 14.0, 14.0, 14.0, 14.0, 12.0, 13.0, 13.0, 12.0, 14.0, 13.0, 12.0, 13.5));
        List<Double> constraintFunctionCoefficient2 = new ArrayList<Double>(Arrays.asList(12.0, 14.0, 14.0, 13.5, 15.0, 13.0, 14.0, 14.0, 13.0, 15.0, 13.0, 14.0, 14.5));
        List<Double> constraintFunctionCoefficient3 = new ArrayList<Double>(Arrays.asList(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0));
        List<Double> constraintFunctionCoefficient4 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient5 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient6 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient7 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient8 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient9 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient10 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient11 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient12 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient13 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient14 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient15 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient16 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient17 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient18 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient19 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient20 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient21 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient22 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient23 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient24 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient25 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient26 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient27 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient28 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient29 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient30 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient31 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient32 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient33 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient34 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient35 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient36 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient37 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient38 = new ArrayList<Double>();
        List<Double> constraintFunctionCoefficient39 = new ArrayList<Double>();
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient1);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient2);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient3);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient4);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient5);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient6);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient7);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient8);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient9);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient10);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient11);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient12);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient13);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient14);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient15);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient16);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient17);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient18);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient19);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient20);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient21);
        constraintFunctionCoefficientsList.add(constraintFunctionCoefficient22);

        List<Double> constraintFunctionLeftValueBoundList = new ArrayList<Double>();
        List<Double> constraintFunctionRightValueBoundList = new ArrayList<Double>();

        List<Double> variableLeftBoundList = new ArrayList<Double>();
        List<Double> variableRightBoundList = new ArrayList<Double>();

    }

    private static String doubleArrayToString(double[] doubles) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        for (int i = 0; i < doubles.length; i++) {
            stringBuilder.append(doubles[i] + ", ");
        }
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

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


        logger.debug("---------------------------------linear programming----------------------------------");
        logger.info("object function coefficient: " + objectFunctionCoefficientList.toString() + " | size"  + objectFunctionCoefficientList.size());
        logger.info("constrain function constraint function coefficients' size : " + constraintFunctionCoefficientList.size());
        for (List list : constraintFunctionCoefficientList) {
            logger.info("constrain function constraint function coefficient : " + list.toString()  + " | size"  + list.size());
        }
        logger.info("constraint function left value bound : " + constraintFunctionLeftValueBoundList.toString() + " | size"  + constraintFunctionLeftValueBoundList.size() );
        logger.info("constraint function right value bound : " + constraintFunctionRightValueBoundList.toString() + " | size"  + constraintFunctionRightValueBoundList.size() );
        logger.info("variable left bound : " + variableLeftBoundList.toString() + " | size"  + variableLeftBoundList.size());
        logger.info("variable right bound : " + variableRightBoundList.toString() + " | size"  + variableRightBoundList.size());
        logger.debug("-------------------------------------------------------------------------");


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

        //print log
        logger.info("---------------------------------------------constraint--------------------------------------------------");
        for (LPSolver.LPConstraint constraint : linearConstraintsList) {
            logger.info("constraint: " + doubleArrayToString(constraint.getContraintBody()) + " | size: " + constraint.getContraintBody().length + " | value: " + constraint.getValue() + " | sign:" + constraint.getSign());
        }
        logger.info("---------------------------------------------------------------------------------------------------------");

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
