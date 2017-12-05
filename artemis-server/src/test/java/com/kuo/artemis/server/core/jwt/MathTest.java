package com.kuo.artemis.server.core.jwt;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/19
 */
public class MathTest {

    public static void main(String[] args) {
        System.out.println(getScore(3488,2255, 1832, 150, 16));
        System.out.println(getScore(3398,2072, 5800, 250, 28));
        System.out.println(getScore(3914,2926, 2908, 153, 23));
        System.out.println(getScore(2134,1052, 2500, 142, 9));
        System.out.println(getScore(3185,2255, 2500, 116, 12));
        System.out.println(getScore(1285,355, 1509, 126.4, 20));
        System.out.println(getScore(2637,1646, 4200, 139, 7));
        System.out.println("++" + getScore(3029-2080, 7300, 250, 38));
        System.out.println(getScore(1915,1155, 3269, 115, 12));
        System.out.println(getScore(2760,1890, 3600, 100, 24));
        System.out.println(getScore(3221,2103, 2956, 165, 17));
        System.out.println(getScore(1286,426, 1153	,119, 13));
        System.out.println(getScore(2082,1198, 4270, 135, 9));
        System.out.println(getScore(3433,2457, 5289, 234,25));
        System.out.println(getScore(2284,653, 8171,200	,26));
        System.out.println(getScore(3676, 2743, 3000, 143, 22));

        System.out.println("-----------------------");
        System.out.println(getScore(3488-2255, 28.5*64.5*0.57));
        System.out.println(getScore(3398-2072, 55*69*1.26));
        System.out.println(getScore(3914-2926, 28*60*0.65));
        System.out.println(getScore(2134-1052, 42*58*0.42));
        System.out.println(getScore(3185-2255, 16*50*0.50));
        System.out.println(getScore(1285-355, 37.4*43*0.46));
        System.out.println(getScore(2637-1646, 35*62*0.42));
        System.out.println("++" + getScore(3029-2080, 27*1.52*71));
        System.out.println(getScore(1915-1155, 20*50*0.45));
        System.out.println(getScore(2760-1890, 25*45*0.30));
        System.out.println(getScore(3221-2103, 25*95*0.45));
        System.out.println(getScore(1286-426, 28*40*0.51));
        System.out.println(getScore(2082-1198, 13.5*0.78*43.5));
        System.out.println(getScore(3433-2457, 57*84*0.93));
        System.out.println(getScore(2284-653, 40*110*0.50));
        System.out.println(getScore(3676-2743, 11*53*0.79));
    }

    public static double getScore(double...params) {
        double score = 0;
        for (double param : params) {
            score = Math.atan(param) + score;
        }

        return score;
    }
}
