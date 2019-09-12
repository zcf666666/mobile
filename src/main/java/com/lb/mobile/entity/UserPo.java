package com.lb.mobile.entity;

import java.util.Date;

public class UserPo {
    private String uid;

    private String openId;

    private String ctmPhone;

    private String ctmName;

    private String nickName;

    private String ctmPwd;

    private Integer ctmSex;

    private String headUrl;

    private Integer ctmSource;

    private Integer provinceCode;

    private Integer cityCode;

    private Integer ctmGenre;

    private Date createDate;

    private Date updateDate;

    private String remark;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    public String getCtmPhone() {
        return ctmPhone;
    }

    public void setCtmPhone(String ctmPhone) {
        this.ctmPhone = ctmPhone == null ? null : ctmPhone.trim();
    }

    public String getCtmName() {
        return ctmName;
    }

    public void setCtmName(String ctmName) {
        this.ctmName = ctmName == null ? null : ctmName.trim();
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName == null ? null : nickName.trim();
    }

    public String getCtmPwd() {
        return ctmPwd;
    }

    public void setCtmPwd(String ctmPwd) {
        this.ctmPwd = ctmPwd == null ? null : ctmPwd.trim();
    }

    public Integer getCtmSex() {
        return ctmSex;
    }

    public void setCtmSex(Integer ctmSex) {
        this.ctmSex = ctmSex;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl == null ? null : headUrl.trim();
    }

    public Integer getCtmSource() {
        return ctmSource;
    }

    public void setCtmSource(Integer ctmSource) {
        this.ctmSource = ctmSource;
    }

    public Integer getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(Integer provinceCode) {
        this.provinceCode = provinceCode;
    }

    public Integer getCityCode() {
        return cityCode;
    }

    public void setCityCode(Integer cityCode) {
        this.cityCode = cityCode;
    }

    public Integer getCtmGenre() {
        return ctmGenre;
    }

    public void setCtmGenre(Integer ctmGenre) {
        this.ctmGenre = ctmGenre;
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