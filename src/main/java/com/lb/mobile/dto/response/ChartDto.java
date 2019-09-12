package com.lb.mobile.dto.response;

import java.io.Serializable;
import java.util.Date;

public class ChartDto implements Serializable {

    public String lotteryFullNo;
    public String lotteryNum;
    public int lotteryType;
    public String lotteryFNo ;
    public String lotteryMNo;
    public String lotteryBNo;
    public Date createDate;

    public String getLotteryFullNo() {
        return lotteryFullNo;
    }

    public void setLotteryFullNo(String lotteryFullNo) {
        this.lotteryFullNo = lotteryFullNo;
    }

    public String getLotteryNum() {
        return lotteryNum;
    }

    public void setLotteryNum(String lotteryNum) {
        this.lotteryNum = lotteryNum;
    }

    public int getLotteryType() {
        return lotteryType;
    }

    public void setLotteryType(int lotteryType) {
        this.lotteryType = lotteryType;
    }

    public String getLotteryFNo() {
        return lotteryFNo;
    }

    public void setLotteryFNo(String lotteryFNo) {
        this.lotteryFNo = lotteryFNo;
    }

    public String getLotteryMNo() {
        return lotteryMNo;
    }

    public void setLotteryMNo(String lotteryMNo) {
        this.lotteryMNo = lotteryMNo;
    }

    public String getLotteryBNo() {
        return lotteryBNo;
    }

    public void setLotteryBNo(String lotteryBNo) {
        this.lotteryBNo = lotteryBNo;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
