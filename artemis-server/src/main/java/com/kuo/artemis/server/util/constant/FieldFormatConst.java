package com.kuo.artemis.server.util.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description : 用于对原始的excel二维数组结构中字段名转换成符合Java命名规范的名字
 * @Date : Created on 2017/12/18
 */
public class FieldFormatConst {
    public final static Map<String, String> map = new HashMap<String, String>();

    static {
        map.put("标准名称", "nutritionStandardName");
        map.put("原料名称","materialName");
        map.put("价格","materialPrice");
        map.put("标准水份","waterContentStandard");
        map.put("实际水份","waterContentActual");
        map.put("电解质平衡","dietaryElectrolyteBalance");
        map.put("实际电解质平衡值","dietaryElectrolyteBalanceActual");
        map.put("钠Na","natrium");
        map.put("实际钠Na","natriumActual");
        map.put("钾K","kalium");
        map.put("实际钾K","kaliumActual");
        map.put("氯Cl","chlorine");
        map.put("实际氯Cl","chlorineActual");
        map.put("标准消化能DE","digestiveEnergyStandard");
        map.put("实际消化能DE","digestiveEnergyActual");
        map.put("净能NE","netEnergy");
        map.put("实际净能NE","netEnergyActual");
        map.put("亚油酸","linolicAcid");
        map.put("实际亚油酸","linolicAcidActual");
        map.put("粗蛋白质CP", "crudeProtein");
        map.put("实际粗蛋白质CP", "crudeProteinActual");
        map.put("粗脂肪EE", "crudeFat");
        map.put("实际粗脂肪EE", "crudeFatActual");
        map.put("粗纤维CF", "crudeFiber");
        map.put("实际粗纤维CF", "crudeFiberActual");
        map.put("粗灰分Ash", "crudeAsh");
        map.put("实际粗灰分Ash", "crudeAshActual");
        map.put("中性洗涤纤维NDF", "nertralDetergentFiber");
        map.put("实际中性洗涤纤维NDF", "neutralDetergentFiberActual");
        map.put("酸性洗涤纤维ADF", "acidDetergentFiber");
        map.put("实际酸性洗涤纤维ADF", "acidDetergentFiberActual");
        map.put("钙Ca", "calcium");
        map.put("实际钙Ca", "calciumActual");
        map.put("总磷P", "totalPhosphor");
        map.put("实际总磷P", "totalPhosphorActual");
        map.put("有效磷A-P", "availablePhosphor");
        map.put("实际有效磷A-P", "availablePhosphorActual");
        map.put("赖氨酸Lys", "lysine");
        map.put("实际赖氨酸Lys", "lysineActual");
        map.put("蛋氨酸Met", "methionine");
        map.put("实际蛋氨酸Met", "methionineActual");
        map.put("色氨酸Trp", "tryptophan");
        map.put("实际色氨酸Trp", "tryptophanActual");
        map.put("苏氨酸Thr", "threonine");
        map.put("实际苏氨酸Thr", "threonineActual");
        map.put("缬氨酸Val", "valine");
        map.put("实际缬氨酸Val", "valineActual");
        map.put("精氨酸Arg", "arginine");
        map.put("实际精氨酸Arg", "arginineActual");
        map.put("异亮氨酸Ile", "isoleucine");
        map.put("实际异亮氨酸Ile", "isoleucineActual");
        map.put("亮氨酸Leu", "leucine");
        map.put("实际亮氨酸Leu", "leucineActual");
        map.put("胱氨酸Cys", "cystine");
        map.put("实际胱氨酸Cys", "cystineActual");
        map.put("蛋+胱", "methionineCystine");
        map.put("实际蛋+胱", "methionineCystineActual");
        map.put("可消化赖氨酸Lys", "digestibleLysine");
        map.put("实际可消化赖氨酸Lys", "digestibleLysineActual");
        map.put("可消化蛋氨酸Met", "digestibleMethionine");
        map.put("实际可消化蛋氨酸Met", "digestibleMethionineActual");
        map.put("可消化色氨酸Trp", "digestibleTryptophan");
        map.put("实际可消化色氨酸Trp", "digestibleTryptophanActual");
        map.put("可消化苏氨酸Thr", "digestibleThreonine");
        map.put("实际可消化苏氨酸Thr", "digestibleThreonineActual");
        map.put("可消化缬氨酸Val", "digestibleValine");
        map.put("实际可消化缬氨酸Val", "digestibleValineActual");
        map.put("可消化精氨酸Arg", "digestibleArginine");
        map.put("实际可消化精氨酸Arg", "digestibleArginineActual");
        map.put("可消化异亮氨酸Ile", "digestibleIsoleucine");
        map.put("实际可消化异亮氨酸Ile", "digestibleIsoleucineActual");
        map.put("可消化亮氨酸Leu", "digestibleLeucine");
        map.put("实际可消化亮氨酸Leu", "digestibleLeucineActual");
        map.put("可消化胱氨酸Cys", "digestibleCystine");
        map.put("实际可消化胱氨酸Cys", "digestibleCystineActual");
        map.put("可消化蛋+胱", "digestibleMethionineCystine");
        map.put("可消化蛋+胱氨酸", "digestibleMethionineCystine");
        map.put("实际可消化蛋+胱", "digestibleMethionineCystineActual");
        map.put("赖氨酸Lys消化率", "lysineDigestibility");
        map.put("蛋氨酸Met消化率", "methionineDigestibility");
        map.put("色氨酸Trp消化率", "tryptophanDigestibility");
        map.put("苏氨酸Thr消化率", "threonineDigestibility");
        map.put("缬氨酸Val消化率", "valineDigestibility");
        map.put("精氨酸Arg消化率", "arginineDigestibility");
        map.put("异亮氨酸Ile消化率", "isoleucineDigestibility");
        map.put("亮氨酸Leu消化率", "leucineDigestibility");
        map.put("胱氨酸Cys消化率", "cystineDigestibility");
        map.put("蛋+胱消化率", "methionineCystineDigestibility");
        map.put("水分系数", "waterContentCoefficient");
        map.put("粗蛋白系数", "crudeProteinCoefficient");
        map.put("粗脂肪系数", "crudeFatCoefficient");
        map.put("粗纤维系数", "crudeFiberCoefficient");
        map.put("粗灰分系数", "crudeAshCoefficient");

        //TODO  添加对应关系
    }
}
