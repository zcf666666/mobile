package com.lb.mobile.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.comm.base.constant.Constant;
import com.lb.mobile.dao.commentPoMapper;
import com.lb.mobile.dao.postInfoPoMapper;
import com.lb.mobile.dao.schemePoMapper;
import com.lb.mobile.dto.response.CommentDto;
import com.lb.mobile.dto.response.PostInfoDto;
import com.lb.mobile.dto.response.SchemeDetailDto;
import com.lb.mobile.entity.postInfoPo;
import com.lb.mobile.service.HotInformationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HotInformationServiceIpml implements HotInformationService {
    private static final Logger log = LoggerFactory.getLogger(HotInformationServiceIpml.class);
    @Value("${server.url}")
    String  address;
    @Autowired
    postInfoPoMapper postInfoMapper;
    @Autowired
    commentPoMapper commentPoMapper;
    @Override
    public ResponseResult txHotPostinfos(Map dto) {
        dto.put("type", Constant.PostInfoType.postinfo_type_hot_information);
        Object pageNo = dto.get("pageNo");
        Object pageSize = dto.get("pageSize");
        int pageNoN = ObjectUtils.isEmpty(pageNo)? 1: Integer.parseInt(String.valueOf(pageNo));
        int pageSizeN = ObjectUtils.isEmpty(pageSize)? 10: Integer.parseInt(String.valueOf(pageSize));
        PageHelper.startPage(pageNoN,pageSizeN);
        PageInfo<PostInfoDto> pageInfo  = new PageInfo<>(postInfoMapper.selectPostInfoByMap(dto));
        return ResponseResult.success(pageInfo,address);
    }

    @Override
    public ResponseResult txPostinfoDetail(Map dto) {
        Map<String,Object> resultMap = new HashMap<>();
        Object pid = dto.get("pid");
        Object limit = dto.get("limit");
        if(ObjectUtils.isEmpty(pid)){
            return  ResponseResult.err("missing param pid");
        }
        postInfoPo postInfoPo = postInfoMapper.selectByPrimaryKey(String.valueOf(pid));
        resultMap.put("postInfoPo",postInfoPo);
        dto.clear();
        dto.put("postId",pid);
        List<CommentDto> commentDtos = commentPoMapper.selectCommentInfosByMap(dto);
        Object pageNo = dto.get("pageNo");
        Object pageSize = dto.get("pageSize");

        PageHelper.startPage(ObjectUtils.isEmpty(pageNo) ? 0 : Integer.valueOf(pageNo.toString()),ObjectUtils.isEmpty(pageSize) ? 5 : Integer.parseInt(pageSize.toString()) );
        PageInfo<CommentDto> pageInfo = new PageInfo<>(commentDtos);
        resultMap.put("commentDtos",pageInfo);
        return ResponseResult.success(resultMap,address);
    }
}
