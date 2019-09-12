package com.lb.mobile.dao;

import com.lb.mobile.entity.smsPo;

public interface smsPoMapper {
    int deleteByPrimaryKey(String id);

    int insert(smsPo record);

    int insertSelective(smsPo record);

    smsPo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(smsPo record);

    int updateByPrimaryKeyWithBLOBs(smsPo record);

    int updateByPrimaryKey(smsPo record);
}