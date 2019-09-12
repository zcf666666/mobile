package com.lb.mobile.dto.requst;

import java.io.Serializable;

public class SchemeQueryDto implements Serializable {
    public  String uid;
    public  String LotteryType;
    public  String pageNo;
    public  String pageSize;

    public String getPageNo() {
        return pageNo;
    }

    public void setPageNo(String pageNo) {
        this.pageNo = pageNo;
    }

    public String getPageSize() {
        return pageSize;
    }

    public void setPageSize(String pageSize) {
        this.pageSize = pageSize;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getLotteryType() {
        return LotteryType;
    }

    public void setLotteryType(String lotteryType) {
        LotteryType = lotteryType;
    }
}
