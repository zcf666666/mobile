package com.lb.mobile.service;

import com.lb.mobile.comm.base.ResponseResult;

import java.util.Map;

public interface HotInformationService {
    ResponseResult txHotPostinfos(Map dto);
    ResponseResult txPostinfoDetail(Map dto);
}
