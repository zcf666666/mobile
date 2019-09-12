package com.lb.mobile.entity;

import java.math.BigDecimal;
import java.util.Date;

public class professorPo {
    private String id;

    private String uid;

    private Integer lotteryGenre;

    private String prfTip;

    private BigDecimal prfRate;

    private Date createDate;

    private String remark;

    private String pfrReferral;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public Integer getLotteryGenre() {
        return lotteryGenre;
    }

    public void setLotteryGenre(Integer lotteryGenre) {
        this.lotteryGenre = lotteryGenre;
    }

    public String getPrfTip() {
        return prfTip;
    }

    public void setPrfTip(String prfTip) {
        this.prfTip = prfTip == null ? null : prfTip.trim();
    }

    public BigDecimal getPrfRate() {
        return prfRate;
    }

    public void setPrfRate(BigDecimal prfRate) {
        this.prfRate = prfRate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getPfrReferral() {
        return pfrReferral;
    }

    public void setPfrReferral(String pfrReferral) {
        this.pfrReferral = pfrReferral == null ? null : pfrReferral.trim();
    }
}