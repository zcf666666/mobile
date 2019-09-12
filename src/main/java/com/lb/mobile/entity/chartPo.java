package com.lb.mobile.entity;

import java.util.Date;

public class chartPo {
    private String id;

    private Integer lotteryNum;

    private Integer lotteryType;

    private String lotteryFNo;

    private String lotteryMNo;

    private String lotteryBNo;

    private Date createDate;

    private String lotteryJson;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getLotteryNum() {
        return lotteryNum;
    }

    public void setLotteryNum(Integer lotteryNum) {
        this.lotteryNum = lotteryNum;
    }

    public Integer getLotteryType() {
        return lotteryType;
    }

    public void setLotteryType(Integer lotteryType) {
        this.lotteryType = lotteryType;
    }

    public String getLotteryFNo() {
        return lotteryFNo;
    }

    public void setLotteryFNo(String lotteryFNo) {
        this.lotteryFNo = lotteryFNo == null ? null : lotteryFNo.trim();
    }

    public String getLotteryMNo() {
        return lotteryMNo;
    }

    public void setLotteryMNo(String lotteryMNo) {
        this.lotteryMNo = lotteryMNo == null ? null : lotteryMNo.trim();
    }

    public String getLotteryBNo() {
        return lotteryBNo;
    }

    public void setLotteryBNo(String lotteryBNo) {
        this.lotteryBNo = lotteryBNo == null ? null : lotteryBNo.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getLotteryJson() {
        return lotteryJson;
    }

    public void setLotteryJson(String lotteryJson) {
        this.lotteryJson = lotteryJson == null ? null : lotteryJson.trim();
    }
}