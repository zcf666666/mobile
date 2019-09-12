package com.lb.mobile.service;

import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.entity.concernPo;

import java.util.Map;

public interface LotteryService {
    ResponseResult txLatestLottery(Map dto);
    ResponseResult txLotteryChart(Map dto);
    ResponseResult txAttentionLottery(concernPo concernPo);
    ResponseResult txAttentionLotteryList(Map dto);
    ResponseResult txUnsubscribeLottery(Map dto);
}
