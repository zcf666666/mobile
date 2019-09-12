package com.lb.mobile.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.comm.base.constant.Constant;
import com.lb.mobile.dao.postInfoPoMapper;
import com.lb.mobile.dto.response.PostInfoDto;
import com.lb.mobile.service.SubjectService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.Map;

@Service
public class SubjectServiceIpml implements SubjectService {

    private static final Logger log = LoggerFactory.getLogger(SubjectServiceIpml.class);
    @Value("${server.url}")
    String  address;
    @Autowired
    postInfoPoMapper postInfoMapper;
    @Override
    public ResponseResult txSubjectInfo(Map dto) {
        Object lotteryType = dto.get("lotteryType");
        if(ObjectUtils.isEmpty(lotteryType)){
            return ResponseResult.err("missing param lotteryType");
        }
        dto.put("type", Constant.PostInfoType.postinfo_type_special_information);
        Object pageNo = dto.get("pageNo");
        Object pageSize = dto.get("pageSize");
        int pageNoN = ObjectUtils.isEmpty(pageNo)? 1: Integer.parseInt(String.valueOf(pageNo));
        int pageSizeN = ObjectUtils.isEmpty(pageSize)? 10: Integer.parseInt(String.valueOf(pageSize));
        PageHelper.startPage(pageNoN,pageSizeN);
        PageInfo<PostInfoDto> pageInfo  = new PageInfo<>(postInfoMapper.selectPostInfoByMap(dto));
        return ResponseResult.success(pageInfo,address);
    }
}
