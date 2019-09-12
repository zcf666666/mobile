package com.lb.mobile.dto.response;

import java.io.Serializable;

public class ProfessorDto implements Serializable {
    public String uid;
    public String ctmName;
    public String nickName;
    public String headUrl;
    public String fileUrl;
    public String prfRate;
    public String pfrReferral;
    public String prfTip;
    public String lotteryGenre;
    public String fansNum;
    public String attentionNum;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getCtmName() {
        return ctmName;
    }

    public void setCtmName(String ctmName) {
        this.ctmName = ctmName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getPrfRate() {
        return prfRate;
    }

    public void setPrfRate(String prfRate) {
        this.prfRate = prfRate;
    }

    public String getPfrReferral() {
        return pfrReferral;
    }

    public void setPfrReferral(String pfrReferral) {
        this.pfrReferral = pfrReferral;
    }

    public String getPrfTip() {
        return prfTip;
    }

    public void setPrfTip(String prfTip) {
        this.prfTip = prfTip;
    }

    public String getLotteryGenre() {
        return lotteryGenre;
    }

    public void setLotteryGenre(String lotteryGenre) {
        this.lotteryGenre = lotteryGenre;
    }

    public String getFansNum() {
        return fansNum;
    }

    public void setFansNum(String fansNum) {
        this.fansNum = fansNum;
    }

    public String getAttentionNum() {
        return attentionNum;
    }

    public void setAttentionNum(String attentionNum) {
        this.attentionNum = attentionNum;
    }
}
