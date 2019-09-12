package com.lb.mobile.dto.response;

import java.io.Serializable;
import java.util.Date;

public class UserLotteryDto implements Serializable {

    public int lotteryId;
    public String lotteryFullNo;
    public int lotteryNum;
    public String lotteryDate;//时间戳

    public int getLotteryId() {
        return lotteryId;
    }

    public void setLotteryId(int lotteryId) {
        this.lotteryId = lotteryId;
    }

    public String getLotteryFullNo() {
        return lotteryFullNo;
    }

    public void setLotteryFullNo(String lotteryFullNo) {
        this.lotteryFullNo = lotteryFullNo;
    }

    public int getLotteryNum() {
        return lotteryNum;
    }

    public void setLotteryNum(int lotteryNum) {
        this.lotteryNum = lotteryNum;
    }

    public String getLotteryDate() {
        return lotteryDate;
    }

    public void setLotteryDate(Date lotteryDate) {
        this.lotteryDate = lotteryDate == null ? null : String.valueOf(lotteryDate.getTime());
    }
}
