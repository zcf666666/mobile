package com.lb.mobile.service;

import com.lb.mobile.comm.base.ResponseResult;

import java.text.ParseException;
import java.util.Map;


public interface HeadLineService {
    ResponseResult txBanners(Map dto);
    ResponseResult txNotice(Map dto);
    ResponseResult txLotterys(Map dto) throws ParseException;
    ResponseResult txStickPostinfos(Map dto);
    ResponseResult txNewestPostinfos(Map dto);
}