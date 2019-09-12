package com.lb.mobile.task.service;

import com.lb.mobile.comm.base.constant.Constant;
import com.lb.mobile.comm.util.JsonUtil;
import com.lb.mobile.dao.lotteryInfoPoMapper;
import com.lb.mobile.entity.lotteryInfoPo;
import com.lb.mobile.service.SchemeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class JobServiceImpl implements  JobService {

    private static final Logger log = LoggerFactory.getLogger(JobServiceImpl.class);
    @Autowired
    public lotteryInfoPoMapper lotteryInfoPoMapper;
    @Autowired
    public SchemeService SchemeService;
    @Override
    public void lotteryDraw() {
        log.info("JobServiceImpl lotteryDraw task start work, datetime："+new Date());
        List<lotteryInfoPo> lotteryInfoPos = lotteryInfoPoMapper.selectLotteryListByStatus(Constant.LotteryStatus.lottery_status_wait);
        log.info("JobServiceImpl lotteryDraw task data[]{}:"+ JsonUtil.toJSONString(lotteryInfoPos));
        if(lotteryInfoPos.size()==0|| null==lotteryInfoPos){
            log.info("without source can do work,JobServiceImpl lotteryDraw lotteryInfoPosis[]{}："+lotteryInfoPos);
            return;
        }
        for (lotteryInfoPo lotteryInfoPo : lotteryInfoPos){
            SchemeService.fillSchemePrediction(lotteryInfoPo);
        }
        log.info("JobServiceImpl lotteryDraw task finish work, datetime："+new Date());
    }
}
