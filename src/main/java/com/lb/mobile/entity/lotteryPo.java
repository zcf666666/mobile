package com.lb.mobile.entity;

import java.util.Date;

public class lotteryPo {
    private Integer id;

    private String lotteryName;

    private Date createDate;

    private Date updateDate;

    private String remark;

    private String lotteryReferral;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLotteryName() {
        return lotteryName;
    }

    public void setLotteryName(String lotteryName) {
        this.lotteryName = lotteryName == null ? null : lotteryName.trim();
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

    public String getLotteryReferral() {
        return lotteryReferral;
    }

    public void setLotteryReferral(String lotteryReferral) {
        this.lotteryReferral = lotteryReferral == null ? null : lotteryReferral.trim();
    }
}