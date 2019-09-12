package com.lb.mobile.dao;

import com.lb.mobile.entity.fansPo;

import java.util.List;
import java.util.Map;

public interface fansPoMapper {
    int insert(fansPo record);

    int insertSelective(fansPo record);

    List<fansPo> selectFansByMap(Map<String,Object> param);

   int deleteByMap(Map<String,Object> param);

   int updateByPrimaryKeySelective(fansPo record);
}