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

    private Map<Class, List<Object>> map; //获取导入任务的共享map

    private Iterator<Map.Entry<Class, List<Object>>> iterator;

    private List<BaseMapper> mappers;


    private ReentrantLock lock = new ReentrantLock();


    public ImportExcelTask(Map<Class, List<Object>> map, List<BaseMapper> mappers) {
        this.map = map;
        this.mappers = mappers;
        this.iterator = map.entrySet().iterator();
    }

    public Integer call() {
        Class key = null;
        List<Object> value = null;

        //从iterator中获取一个需要插入的资源
        try {
            lock.lock();
            if (iterator.hasNext()) {
                Map.Entry<Class, List<Object>> entry = iterator.next();
                key = entry.getKey();
                value = entry.getValue();
            } else {
                lock.unlock();
                return 1;
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

        int result = 0;
        for (BaseMapper mapper : mappers) {
            Class[] mapperInterfaces = mapper.getClass().getInterfaces();
            String mapperName = mapperInterfaces[0].getSimpleName();
            if (mapperName.equals(key.getSimpleName() + "Mapper")) {
                try {
                    result = mapper.insertBatch(value);
                } catch (Exception e) {
                    e.printStackTrace();
                    continue;
                }
                return result;
            }
        }

        return result;

    }
}
