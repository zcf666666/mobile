package com.lb.mobile.dto.response;


import java.io.Serializable;
import java.util.Date;

public class ProfessorSchemeDto implements Serializable {
    public String  schemeId;
    public String  uid;
    public String schemeLotteryType;
    public String  schemePeriods;
    public String   schemeName;
    public String schemeDec;
    public String  fileUrl;
    public String createDate;

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate == null ? null : String.valueOf(createDate.getTime());
    }

    public String getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(String schemeId) {
        this.schemeId = schemeId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getSchemeLotteryType() {
        return schemeLotteryType;
    }

    public void setSchemeLotteryType(String schemeLotteryType) {
        this.schemeLotteryType = schemeLotteryType;
    }

    public String getSchemePeriods() {
        return schemePeriods;
    }

    public void setSchemePeriods(String schemePeriods) {
        this.schemePeriods = schemePeriods;
    }

    public String getSchemeName() {
        return schemeName;
    }

    public void setSchemeName(String schemeName) {
        this.schemeName = schemeName;
    }

    public String getSchemeDec() {
        return schemeDec;
    }

    public void setSchemeDec(String schemeDec) {
        this.schemeDec = schemeDec;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }
}
