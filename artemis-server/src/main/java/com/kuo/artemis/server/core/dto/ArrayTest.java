package com.kuo.artemis.server.core.dto;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/23
 */
@Deprecated
public class ArrayTest {
    private List<String> lists;

    private List<List<String>> multiList;

    @Override
    public String toString() {
        return "ArrayTest{" +
                "lists=" + lists +
                ", multiList=" + multiList +
                '}';
    }

    public List<List<String>> getMultiList() {
        return multiList;
    }

    public void setMultiList(List<List<String>> multiList) {
        this.multiList = multiList;
    }

    public List<String> getLists() {
        return lists;
    }

    public void setLists(List<String> lists) {
        this.lists = lists;
    }
}
