package com.lb.mobile.task;

import com.lb.mobile.task.service.JobService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class JobTask {
    private static final Logger log = LoggerFactory.getLogger(JobTask.class);
    @Autowired
    JobService jobService;
    @Scheduled(cron = "0 0/5 10-11 * * ?")
//    @Scheduled(cron = "0 0/5 20-21 * * ?")
    public void lotteryDraw() {
        log.info("JobTask lotteryDraw begin run , datetime："+new Date());
        jobService.lotteryDraw();
        log.info("JobTask lotteryDraw over run , datetime："+new Date());
    }
}
