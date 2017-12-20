package com.kuo.artemis.server.core.math;

import com.quantego.clp.CLP;
import com.quantego.clp.CLPExpression;
import com.quantego.clp.CLPVariable;
import com.quantego.clp.CLPVariableSet;
import org.junit.Test;

import java.util.*;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/18
 */
public class LinearProgramTest {
    @Test
    public void test() {
        CLP model = new CLP();
        CLPVariable x = model.addVariable().lb(0);
        CLPVariable y = model.addVariable().lb(0);


        model.createExpression().add(3, x).add(4, y).leq(135);
        model.createExpression().add(5, x).add(2, y).leq(180);

        Map<CLPVariable, Double> map = new HashMap<CLPVariable, Double>();
        map.put(x, Double.valueOf(20));
        map.put(y, Double.valueOf(15));
        model.addObjective(map, 0);
        System.out.println(model.toString());
        model.printModel();
        //CLPVariable result = model.addVariable();
        //double a = model.getSolution(result);
        CLP.STATUS status = model.maximize();
        System.out.println(status);
        double xResult = model.getSolution(x);
        System.out.println(xResult);
        double yResult = model.getSolution(y);
        System.out.println(yResult);
    }

    @Test
    public void test2() {
        int varSize = 8;

        CLP model = new CLP();
        CLPVariableSet variableSet = model.addVariables(varSize);

    }

    @Test
    public void test3() {
        /*double[] c = { 10.0, -57.0, -9.0, -24.0 };
        double[] b = {  0.0,   0.0,  1.0 };
        double[][] A = {
                { 0.5, -5.5, -2.5, 9.0 },
                { 0.5, -1.5, -0.5, 1.0 },
                { 1.0,  0.0,  0.0, 0.0 },
        };*/

        double[][] A = {
                { -1,  1,  0 },
                {  1,  4,  0 },
                {  2,  1,  0 },
                {  3, -4,  0 },
                {  0,  0,  1 },
        };
        double[] c = { 1, 1, 1 };
        double[] b = { 5, 45, 27, 24, 4 };


        CLP model = new CLP();
        CLPVariableSet set = model.addVariables(c.length);
        CLPVariable[] clpVariables = set.build();

        Map<CLPVariable, Double> map = new HashMap<CLPVariable, Double>();
        for (int i = 0; i < clpVariables.length; i++) {
            map.put(clpVariables[i], c[i]);
        }
        model.addObjective(map, 0);

        System.out.println(A.length);
        for (int i = 0; i < A.length; i++) {
            double[] temp = A[i];
            CLPExpression expression = model.createExpression();
            for (int j = 0; j < temp.length; j++) {
                expression.add(clpVariables[j], temp[j]);

            }
            expression.leq(b[i]);
        }

        model.maximize();
        double[] result = new double[clpVariables.length];

        for (int i =0; i < clpVariables.length; i++) {
            result[i] = model.getSolution(clpVariables[i]);
        }

        model.printModel();
        for (int i = 0; i < result.length; i++) {
            System.out.println(result[i]);
        }
    }

    @Test
    public void test4() {



        List<Double> objectList = new ArrayList<Double>();
        objectList.add(1D);
        objectList.add(1D);
        objectList.add(1D);

        List<Double> valueList;
        valueList = Arrays.asList(5D, 45D, 27D, 24D, 4D);

        List<List<Double>> lists = new ArrayList<List<Double>>();
        List<Double> row1 = Arrays.asList(-1D,  1D,  0D);
        lists.add(row1);
        List<Double> row2 = Arrays.asList(1D,  4D,  0D);
        lists.add(row2);
        List<Double> row3 = Arrays.asList(2D,  1D,  0D);
        lists.add(row3);
        List<Double> row4 = Arrays.asList(3D, -4D,  0D);
        lists.add(row4);
        List<Double> row5 = Arrays.asList(0D,  0D,  1D);
        lists.add(row5);

        LinearProgrammingResult result = LinearProgramming.getMaximize(objectList, lists, valueList, null, null);
        System.out.println(result);
    }
}
