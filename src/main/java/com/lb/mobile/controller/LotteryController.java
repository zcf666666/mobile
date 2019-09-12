package com.lb.mobile.controller;

import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.entity.concernPo;
import com.lb.mobile.service.LotteryService;
import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("lottery")
public class LotteryController {
    private static final Logger log = LoggerFactory.getLogger(LotteryController.class);
    @Autowired
    public LotteryService LotteryService;
    @RequestMapping(value = "/latest-lottery",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult latestLottery(HttpServletRequest request , @RequestBody Map<String,Object> param){
        return LotteryService.txLatestLottery(param);
    }
    @RequestMapping(value = "/lottery-chart",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult lotteryChart(HttpServletRequest request , @RequestBody Map<String,Object> param){
        return LotteryService.txLotteryChart(param);
    }
    @RequestMapping(value = "/attention-lottery",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult attentionLottery(HttpServletRequest request , @RequestBody concernPo concernPo){
        return LotteryService.txAttentionLottery(concernPo);
    }
    @RequestMapping(value = "/unsubscribe-lottery",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult unsubscribeLottery(HttpServletRequest request , @RequestBody Map dto){
        return LotteryService.txUnsubscribeLottery(dto);
    }
    @RequestMapping(value = "/attention-lotterylist",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult attentionLotteryList(HttpServletRequest request , @RequestBody Map<String,Object> param){
        return LotteryService.txAttentionLotteryList(param);
    }
}
