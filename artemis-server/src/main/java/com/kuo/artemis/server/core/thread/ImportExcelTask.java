package com.kuo.artemis.server.core.thread;

import com.kuo.artemis.server.core.helper.ExcelHelper;
import com.kuo.artemis.server.dao.BaseMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/6
 */
public class ImportExcelTask implements Callable<Integer> {

    protected Logger logger = LoggerFactory.getLogger(ImportExcelTask.class);

    private Iterator<Map.Entry<Class, List<Map<String, Object>>>> iterator; //获取导入任务的共享iterator

    private List<BaseMapper> mappers;


    private ReentrantLock lock = new ReentrantLock();

    public ImportExcelTask(Iterator<Map.Entry<Class, List<Map<String, Object>>>> iterator, List<BaseMapper> mappers) {
        this.iterator = iterator;
        this.mappers = mappers;
    }


    public Integer call() {
        Class key = null;
        List<Map<String, Object>> value = null;

        //从iterator中获取一个需要插入的资源
        try {
            lock.lock();
            if (iterator.hasNext()) {
                Map.Entry<Class, List<Map<String, Object>>> entry = iterator.next();
                key = entry.getKey();
                value = entry.getValue();
            }
            logger.info("key:" + key.getSimpleName());
            logger.info("value:" + value.toString());
            lock.unlock();
        } catch (Exception e) {
            e.printStackTrace();
            if (lock.isLocked()) {
                lock.unlock();
            }
        } finally {
            if (lock.isLocked()) {
                lock.unlock();
            }
        }

        List resultList = new ArrayList();
        for (int i = 0; i < value.size(); i++) {
            try {
                resultList.add(ExcelHelper.parseExcelRowToBean(key, value.get(i)));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        int result = 0;
        for (BaseMapper mapper : mappers) {
            Class[] mapperInterfaces = mapper.getClass().getInterfaces();
            String mapperName = mapperInterfaces[0].getSimpleName();
            if (mapperName.equals(key.getSimpleName() + "Mapper")) {
                result = mapper.insertBatch(resultList);
            }
        }

        return result;

    }
}
