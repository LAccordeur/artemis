package com.kuo.artemis.server.util.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/18
 */
public class FieldFormatConst {
    public final static Map<String, String> map = new HashMap<String, String>();

    static {
        map.put("原料名称","materialName");
        map.put("价格","materialPrice");
        map.put("标准水份","");
        map.put("实际水份","");
        map.put("电解质平衡","");
        map.put("实际电解质平衡值","");
        map.put("钠Na","");
        map.put("实际钠Na","");
        map.put("钾K","");
        map.put("实际钾K","");
        map.put("氯Cl","");
        map.put("实际氯Cl","");
        map.put("标准消化能","");
        map.put("实际消化能","");
        map.put("净能","");
        map.put("实际净能","");
        map.put("亚油酸","");
        map.put("实际亚油酸","");
        map.put("粗蛋白质", "");
        map.put("实际粗蛋白质", "");
        map.put("粗脂肪", "");
        map.put("实际粗脂肪", "");
        map.put("粗纤维", "");
        map.put("实际粗纤维", "");
        map.put("粗灰分", "");
        map.put("实际粗灰分", "");
        map.put("中性洗涤纤维", "");
        map.put("实际中性洗涤纤维", "");
        map.put("酸性洗涤纤维", "");
        map.put("实际酸性洗涤纤维", "");
        //TODO  添加对应关系
    }
}
