package com.lb.mobile.dao;

import com.lb.mobile.entity.lotteryPo;

public interface lotteryPoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(lotteryPo record);

    int insertSelective(lotteryPo record);

    lotteryPo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(lotteryPo record);

    int updateByPrimaryKeyWithBLOBs(lotteryPo record);

    int updateByPrimaryKey(lotteryPo record);
}