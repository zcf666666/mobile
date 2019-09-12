package com.lb.mobile.entity;

import java.util.Date;

public class lotteryInfoPo {
    private String id;

    private Integer lotteryId;

    private String lotteryFullNo;

    private Integer lotteryNum;

    private String lotteryFNo;

    private String lotteryMNo;

    private String lotteryBNo;

    private Integer lotteryStatus;

    private Date lotteryDate;

    private Date createDate;

    private Date updateDate;

    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getLotteryId() {
        return lotteryId;
    }

    public void setLotteryId(Integer lotteryId) {
        this.lotteryId = lotteryId;
    }

    public String getLotteryFullNo() {
        return lotteryFullNo;
    }

    public void setLotteryFullNo(String lotteryFullNo) {
        this.lotteryFullNo = lotteryFullNo == null ? null : lotteryFullNo.trim();
    }

    public Integer getLotteryNum() {
        return lotteryNum;
    }

    public void setLotteryNum(Integer lotteryNum) {
        this.lotteryNum = lotteryNum;
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

    public Integer getLotteryStatus() {
        return lotteryStatus;
    }

    public void setLotteryStatus(Integer lotteryStatus) {
        this.lotteryStatus = lotteryStatus;
    }

    public Date getLotteryDate() {
        return lotteryDate;
    }

    public void setLotteryDate(Date lotteryDate) {
        this.lotteryDate = lotteryDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}