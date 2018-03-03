package com.kuo.artemis.server.core.math;

/*import com.datumbox.framework.mathematics.linearprogramming.LPSolver;
import lpsolve.LpSolve;*/

import com.datumbox.framework.core.mathematics.linearprogramming.LPSolver;

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

        int variableSize = objectFunctionCoefficientList.size();  //模型中的所有变量数

        double[] linearObjectiveFunction = listToArray(objectFunctionCoefficientList, null);

        List<LPSolver.LPConstraint> linearConstraintsList = new ArrayList<LPSolver.LPConstraint>();

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


        for (int i = 0; i < constraintFunctionCoefficientList.size(); i++) {
            List<Double> constraintFunctionCoefficient = constraintFunctionCoefficientList.get(i);
            Double leftBound = constraintFunctionLeftValueBoundList.get(i);
            Double rightBound = constraintFunctionRightValueBoundList.get(i);
            LPSolver.LPConstraint lpConstraintLeft = new LPSolver.LPConstraint(listToArray(constraintFunctionCoefficient, null), LPSolver.GEQ, leftBound);
            LPSolver.LPConstraint lpConstraintRight = new LPSolver.LPConstraint(listToArray(constraintFunctionCoefficient, null), LPSolver.LEQ, rightBound);
            linearConstraintsList.add(lpConstraintLeft);
            linearConstraintsList.add(lpConstraintRight);
        }


        LPSolver.LPResult lpResult = null;
        try {
            lpResult = LPSolver.solve(linearObjectiveFunction, linearConstraintsList, true, false);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(lpResult.getObjectiveValue());

        LinearProgrammingResult result = new LinearProgrammingResult();
        result.setResultValue(lpResult.getObjectiveValue());
        return result;
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
