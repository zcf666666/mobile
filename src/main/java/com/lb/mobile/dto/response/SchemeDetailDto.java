package com.lb.mobile.dto.response;

import java.io.Serializable;
import java.util.Date;

public class SchemeDetailDto implements Serializable {

    public String schemeId;
    public String proUid;
    public String schemePeriods;
    public String schemeName;
    public String schemeGenrePd;
    public String schemeFull;
    public String schemeDec;
    public Date createDate;
    public String nickName;
    public String ctmName;
    public String headUrl;
    public String fileUrl;
    public String commentUid;
    public String ctMsg;
    public String commentDate;

    public String getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(String schemeId) {
        this.schemeId = schemeId;
    }

    public String getProUid() {
        return proUid;
    }

    public void setProUid(String proUid) {
        this.proUid = proUid;
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

    public String getSchemeGenrePd() {
        return schemeGenrePd;
    }

    public void setSchemeGenrePd(String schemeGenrePd) {
        this.schemeGenrePd = schemeGenrePd;
    }

    public String getSchemeFull() {
        return schemeFull;
    }

    public void setSchemeFull(String schemeFull) {
        this.schemeFull = schemeFull;
    }

    public String getSchemeDec() {
        return schemeDec;
    }

    public void setSchemeDec(String schemeDec) {
        this.schemeDec = schemeDec;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getCtmName() {
        return ctmName;
    }

    public void setCtmName(String ctmName) {
        this.ctmName = ctmName;
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

    public String getCommentUid() {
        return commentUid;
    }

    public void setCommentUid(String commentUid) {
        this.commentUid = commentUid;
    }

    public String getCtMsg() {
        return ctMsg;
    }

    public void setCtMsg(String ctMsg) {
        this.ctMsg = ctMsg;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate== null ? null : String.valueOf(commentDate.getTime());
    }
}
