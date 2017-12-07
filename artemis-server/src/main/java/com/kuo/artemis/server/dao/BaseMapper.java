package com.kuo.artemis.server.dao;

import java.util.List;

public interface BaseMapper {
    int insertBatch(List rows);
}
