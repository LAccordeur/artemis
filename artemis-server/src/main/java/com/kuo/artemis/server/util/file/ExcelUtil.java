package com.kuo.artemis.server.util.file;

import com.kuo.artemis.server.core.factory.TypeBindFactory;
import com.kuo.artemis.server.util.constant.ExcelConst;
import com.kuo.artemis.server.util.constant.FieldClassConst;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean2;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

/**
 * @Author : guoyang
 * @Description : 用于处理Excel相关的解析，导出
 * @Date : Created on 2017/11/25
 */
public final class ExcelUtil {


    /**
     * 根据文件后缀名创建相应的处理Excel的对象
     * @param inputStream
     * @param filename
     * @return
     */
    public static Workbook createExcelObject(InputStream inputStream, String filename) throws IOException {

        if (filename != null) {

            if (filename.endsWith(".xls")) {
                return new HSSFWorkbook(inputStream);
            } else if (filename.endsWith(".xlsx")) {
                return new XSSFWorkbook(inputStream);
            } else {
                return null;
            }

        } else {
            return null;
        }

    }

    /**
     * 解析excel文件的表title,规定excel文件的第一行为英文title
     * @param workbook
     * @param sheetIndex
     * @return
     * @throws Exception
     */
    public static List<String> parseExcelFields(Workbook workbook, int sheetIndex) throws Exception {

        if (workbook == null) {
            throw new Exception("Workbook is null!");
        }

        Sheet sheet = workbook.getSheetAt(sheetIndex);
        Row row = sheet.getRow(0);

        //标题总列数
        int columnCount = row.getPhysicalNumberOfCells();
        List<String> list = new ArrayList<String>();
        for (int i = 0; i < columnCount; i++) {
            list.add(formatForImport(row.getCell(i).getStringCellValue()));
        }

        return list;
    }

    /**
     * 将Excel字段名格式转化为Java驼峰类型  ##BUG##  等于一情况下UpperCase待商榷
     * @param value
     * @return
     */
    private static String formatForImport(String value) {
        if (value.contains(" ")) {
            String[] words = value.trim().split(" ");
            StringBuffer newValue = new StringBuffer();
            for (int i = 0; i < words.length; i++) {
                //System.out.println(words[i]);
                if (words[i].length() > 1) {
                    if (i == 0) {
                        newValue.append(words[i].substring(0, 1).toLowerCase() + words[i].substring(1, (words[i]).length()));
                    } else {
                        newValue.append(words[i].substring(0, 1).toUpperCase() + words[i].substring(1, (words[i]).length()));
                    }
                } else {
                    if (i != 0) {
                        if (words[i].length() == 1 && words[i] != " ") {
                            newValue.append(words[i].toUpperCase());
                        }
                    } else {
                        if (words[i].length() == 1 && words[i] != " ") {
                            newValue.append(words[i]);
                        }
                    }
                }
            }
            value = newValue.toString();

        }

        return value;
    }



    /**
     * 解析Excel表的正文内容，标题名为Java驼峰型
     * @param workbook
     * @param sheetIndex
     * @Param rowIndex
     * @return
     * @throws Exception
     */
    public static List<Map<String, Object>> parseExcelContent(Workbook workbook, int sheetIndex, int rowIndex) throws Exception {

        if (workbook == null) {
            throw new Exception();
        }

        Row row = null;
        List<Map<String, Object>> rowList = new ArrayList<Map<String, Object>>();

        Sheet sheet = workbook.getSheetAt(sheetIndex);
        //总行数
        int rowCount = sheet.getLastRowNum();
        //总列数
        int columnCount = sheet.getRow(0).getPhysicalNumberOfCells();

        //excel每一列的字段名
        List<String> fields = parseExcelFields(workbook, sheetIndex);
        //依次解析正文
        for (int i = rowIndex; i <= rowCount; i++) {
            row = sheet.getRow(i);
            Map<String, Object> rowItem = new HashMap();
            for (int j = 0; j < columnCount; j++) {
                Object item = getCellFormatValue(row.getCell(j));
                //System.out.println("Field:" + fields.get(j) + "--- Type:" + item.getClass());
                rowItem.put(fields.get(j), item);
            }
            rowList.add(rowItem);
        }

        return rowList;
    }



    /**
     * 获取cell单元格的值
     * @param cell
     * @return
     */
    public static Object getCellFormatValue(Cell cell) {
        Object cellValue = "";

        if (cell != null) {
            //判断当前cell的Type
            switch (cell.getCellType()) {
                //数值型(包含日期和数值)
                case Cell.CELL_TYPE_NUMERIC:{
                    cellValue = getValueOfNumericCell(cell);
                    break;
                }
                case Cell.CELL_TYPE_FORMULA: {
                    //读公式计算值
                    try {
                        cellValue = getValueOfNumericCell(cell);
                    } catch (IllegalStateException e) {
                        try {
                            cellValue = cell.getRichStringCellValue().toString();
                        } catch (IllegalStateException e2) {
                            e.printStackTrace();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    break;
                }
                case Cell.CELL_TYPE_STRING: {
                    cellValue = cell.getRichStringCellValue().getString();
                    break;
                }
                case Cell.CELL_TYPE_BOOLEAN: {
                    cellValue = "" + cell.getBooleanCellValue();
                    break;
                }
                case Cell.CELL_TYPE_BLANK: {
                    cellValue = "";
                    break;
                }
                case Cell.CELL_TYPE_ERROR: {
                    cellValue = "";
                    break;
                }
                default:
                    cellValue = cell.getStringCellValue().toString();

            }
        } else {
            cellValue = "";
        }

        return cellValue;
    }

    /**
     * 获取Numeric类型的值（由于POI对日期支持不好，会将日期转化成double型）
     * @param cell
     * @return
     */
    private static Object getValueOfNumericCell(Cell cell) {
        Boolean isDate = DateUtil.isCellDateFormatted(cell);
        Double value = cell.getNumericCellValue();
        Object resultValue = null;

        if (isDate) {
            //日期型
            Date date = DateUtil.getJavaDate(value);

            if ((date.toString()).contains(ExcelConst.DEFAULT_YEAR)) {
                SimpleDateFormat format = new SimpleDateFormat(ExcelConst.TIME_FORMAT);
                resultValue = format.format(date);
            } else {
                SimpleDateFormat format = new SimpleDateFormat(ExcelConst.DATA_FORMAT);
                resultValue = format.format(date);
            }

        } else {
            //数值型
            resultValue = getRealStringValueOfDouble(value);
        }

        return resultValue;
    }

    /**
     * 处理科学计数法与普通计数法的字符串显示，尽最大努力保持精度
     * @param d
     * @return
     */
    private static String getRealStringValueOfDouble(Double d) {
        String doubleStr = d.toString();
        boolean b = doubleStr.contains("E");
        int indexOfPoint = doubleStr.indexOf('.');
        if (b) {
            int indexOfE = doubleStr.indexOf('E');
            // 小数部分
            BigInteger xs = new BigInteger(doubleStr.substring(indexOfPoint
                    + BigInteger.ONE.intValue(), indexOfE));
            // 指数
            int pow = Integer.valueOf(doubleStr.substring(indexOfE
                    + BigInteger.ONE.intValue()));
            int xsLen = xs.toByteArray().length;
            int scale = xsLen - pow > 0 ? xsLen - pow : 0;
            doubleStr = String.format("%." + scale + "f", d);
        } else {
            java.util.regex.Pattern p = Pattern.compile(".0$");
            java.util.regex.Matcher m = p.matcher(doubleStr);
            if (m.find()) {
                doubleStr = doubleStr.replace(".0", "");
            }
        }
        return doubleStr;
    }

    /**
     * 导出Excel文件模板   ##modified## 未来可增加样式的美化
     * @param
     */
    public static Workbook exportExcelTemplate(List<String> englishFields, List<String> chineseFields) {

        //1.创建一个Workbook对象对应一个Excel文件
        XSSFWorkbook workbook = getXSSfSheets(englishFields, chineseFields);


        /*//6.写入数据
        for (int i = 0; i < contents.size(); i++) {
            row = sheet.createRow(i+1);
            List<Object> rowItem = contents.get(i);
            for (int j = 0; j < contents.get(i).size(); j++) {
                cell = row.createCell(j);
                cell.setCellValue((String) rowItem.get(j));
            }
        }*/

        return workbook;
    }


    /**
     * field中的标题名形如init BW 即在Excel中呈现的形式
     * @param englishFields
     * @param chineseFields
     * @param dataRows
     * @return
     */
    public static Workbook exportExcelWithData(List<String> englishFields, List<String> chineseFields, List<Map<String, Object>> dataRows) {
        XSSFWorkbook workbook = getXSSfSheets(englishFields, chineseFields);
        XSSFSheet sheet = workbook.getSheet("sheet 1");

        //写入数据，由于前两行为中英文标题行，故从第三行开始
        for (int i = 0; i < dataRows.size(); i++) {
            XSSFRow row = sheet.createRow(i + 2);
            Map<String, Object> dataRow = dataRows.get(i);
            for (int j = 0; j < englishFields.size(); j++) {
                XSSFCell cell = row.createCell(j);
                cell.setCellValue((String) dataRow.get(englishFields.get(j)));
            }
        }


        return workbook;
    }

    private static XSSFWorkbook getXSSfSheets(List<String> englishFields, List<String> chineseFields) {
        //1.创建一个Workbook对象对应一个Excel文件
        XSSFWorkbook workbook = new XSSFWorkbook();
        //2.添加sheet
        XSSFSheet sheet = workbook.createSheet("sheet 1");
        //3.添加表头
        XSSFRow englishRow = sheet.createRow(0);
        //4.设置表头格式
        XSSFCellStyle style = workbook.createCellStyle();
        style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
        //5.设置英文表头
        XSSFCell cell = null;
        for (int i = 0; i < englishFields.size(); i++) {
            cell = englishRow.createCell(i);
            cell.setCellValue(englishFields.get(i));
            cell.setCellStyle(style);
        }

        //6.设置中文表头
        XSSFRow chineseRow = sheet.createRow(1);
        for (int i = 0; i < chineseFields.size(); i++) {
            cell = chineseRow.createCell(i);
            cell.setCellValue(chineseFields.get(i));
            cell.setCellStyle(style);
        }
        return workbook;
    }

    /**
     * 将包含来自多个表的指标的数据LIST解析成一个LIST，该LIST中的每个元素中的指标都来自同一个表
     * @param rows
     * @param fields
     * @return
     * @throws Exception
     */
    @Deprecated
    public static List<List<Map<String, Object>>> parseStringToMapList(List<Map<String, Object>> rows, List<String> fields) throws Exception {

        List<List<Map<String, Object>>> resultList = new ArrayList<List<Map<String, Object>>>();

        //解析出这个Excel中的指标所来自的表对象
        Set<Class> classSet = new HashSet<Class>();
        for (int i = 0; i < fields.size(); i++) {
            classSet.add(getClassByField(fields.get(i)));
        }
        if (classSet.contains(null)) {
            classSet.remove(null);
        }

        //解析出每个class对象包含Excel文件中的哪些列
        Map<Class, List<Integer>> classMap = new HashMap<Class, List<Integer>>();

        Iterator<Class> iterator = classSet.iterator();
        while (iterator.hasNext()) {
            Class clazz = iterator.next();
            List columns = new ArrayList();
            classMap.put(clazz, columns);
            for (int i = 0; i < fields.size(); i++) {
                //判断该字段所在的class是否和这个类对象一致
                if (clazz.equals(getClassByField(fields.get(i)))) {
                    columns.add(i);
                }
            }
        }

        //根据每个类拥有的列进行解析
        Set<Class> keySet = classMap.keySet();
        Iterator<Class> classIterator = keySet.iterator();
        while(classIterator.hasNext()) {
            Class key = classIterator.next();
            List<Integer> columns = classMap.get(key);

            List<Map<String, Object>> rowResult = new ArrayList<Map<String, Object>>();
            resultList.add(rowResult);
            for (int i = 0; i < rows.size(); i++) {
                Map<String, Object> rowMap = new HashMap();
                rowResult.add(rowMap);

                Map<String, Object> row = rows.get(i);
                for (int j = 0; j < columns.size(); j++) {
                    rowMap.put(fields.get(columns.get(j)), row.get(fields.get(columns.get(j))));
                }
                
            }

        }



        return resultList;
    }


    /**
     * 对包含来自多个类的指标的Excel解析结果进行分组
     * @param rows
     * @param fields
     * @return
     */
    public static Map<Class, List<Map<String, Object>>> groupExcel(List<Map<String, Object>> rows, List<String> fields) {
        Map<Class, List<Map<String, Object>>> resultMap = new HashMap<Class, List<Map<String, Object>>>();

        //解析出这个Excel中的指标所来自的类对象
        Set<Class> classSet = getClassSet(fields);


        //根据每个类拥有的列进行解析O(n^2)
        Iterator<Class> setIterator = classSet.iterator();
        while (setIterator.hasNext()){
            Class clazz = setIterator.next();
            //先初始化好数据结构
            //1.来自同一表中的指标的多行记录用一个List表示
            List<Map<String, Object>> beanList = new ArrayList<Map<String, Object>>();
            resultMap.put(clazz, beanList);

            //2.来自同一表中的一行记录用一个Map表示
            for (int j = 0; j < rows.size(); j++) {
                Map<String, Object> rowMap = new HashMap();
                beanList.add(rowMap);
            }

        }



        //解析赋值
        //1.先从列开始
        for (int i = 0; i < fields.size(); i++) {
            String fieldName = fields.get(i);
            Class clazz = getClassByField(fieldName);
            //2.获取该列字段所在的类
            List<Map<String, Object>> list = resultMap.get(clazz);

            //3.从行开始,一次为每个map赋值
            for (int j = 0; j < rows.size(); j++) {
                Object value = rows.get(j).get(fieldName);
                list.get(j).put(fieldName, value);
            }
        }

        return resultMap;
    }

    public static Set<Class> getClassSet(List<String> fields) {
        //解析出这个Excel中的指标所来自的类对象
        Set<Class> classSet = new HashSet<Class>();
        for (int i = 0; i < fields.size(); i++) {
            classSet.add(getClassByField(fields.get(i)));
        }
        if (classSet.contains(null)) {
            classSet.remove(null);
        }

        return classSet;
    }

    /**
     * 将键值对绑定到相应的类对象中
     * @param beanClass
     * @param fieldValueMap
     * @return
     * @throws Exception
     */
    public static <T> T dataBind(Class<T> beanClass, Map<String, Object> fieldValueMap) throws Exception {
        T bean = null;

        //通过反射生成对象
        bean = beanClass.newInstance();

       /* //利用Apache的工具类进行数据绑定
        BeanUtils.populate(bean, fieldValueMap);

        //return bean;*/



        //获取类的方法
        Method[] methods = beanClass.getMethods();
        int len = methods.length;
        for(int i = 0; i < len; ++i) {
            Method method = methods[i];
            String methodName = method.getName();
            //如果方法名是set开头的且名字长度大于3的
            if(methodName.startsWith("set") && methodName.length() > 3) {
                //获取方法的参数类型
                Class[] types = method.getParameterTypes();
                //只有一个参数的方法才继续执行
                if(types.length == 1) {
                    //取字段名且让其首字母小写
                    String attrName = firstCharToLowerCase(methodName.substring(3));
                    Class<?> paramType = types[0];
                    //map中是否有属性名
                    if(fieldValueMap.containsKey(attrName)) {
                        Object value = fieldValueMap.get(attrName);
                        try {

                            //通过反射的方式执行bean的mothod方法，在这里相当于执行set方法赋值
                            Object param = TypeBindFactory.createBean(paramType, value);
                            if (param != null) {
                                method.invoke(bean, param);
                            }

                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                            continue;
                        } catch (InvocationTargetException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return bean;
    }

    //取字段名且让其首字母小写
    public static String firstCharToLowerCase(String substring) {
        if (substring!=null&& substring.charAt(0)>='A' && substring.charAt(0)<='Z'){
            char[] arr = substring.toCharArray();
            arr[0] = (char)(arr[0] + 32);
            return new String(arr);
        }else {
            return substring;
        }
    }


    /**
     * 通过字段名(指标名)获取其所在的类名
     * @param fieldName
     * @return
     */
    public static Class getClassByField(String fieldName) {

        return FieldClassConst.fieldClassMap.get(fieldName);

    }
}
