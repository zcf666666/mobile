package com.lb.mobile.dao;

import com.lb.mobile.entity.lotteryInfoPo;

import java.util.List;
import java.util.Map;

public interface lotteryInfoPoMapper {
    int deleteByPrimaryKey(String id);

    int insert(lotteryInfoPo record);

    int insertSelective(lotteryInfoPo record);

    lotteryInfoPo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(lotteryInfoPo record);

    int updateByPrimaryKey(lotteryInfoPo record);

    List<lotteryInfoPo> selectLotteryListByStatus(int lotteryStatus);

    lotteryInfoPo selectLotteryByMap(Map dto);

    List<lotteryInfoPo> selectLatestLotteryInfoList(Map dto);

    List<lotteryInfoPo> selectEntityByMap(Map dto);

    List<lotteryInfoPo> selectUserLotteryByMap(Map dto);
}