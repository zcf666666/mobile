package com.lb.mobile.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.comm.base.constant.Constant;
import com.lb.mobile.comm.util.DateUtil;
import com.lb.mobile.dao.filePoMapper;
import com.lb.mobile.dao.lotteryInfoPoMapper;
import com.lb.mobile.dao.noticePoMapper;
import com.lb.mobile.dao.postInfoPoMapper;
import com.lb.mobile.dto.response.PostInfoDto;
import com.lb.mobile.entity.filePo;
import com.lb.mobile.entity.noticePo;
import com.lb.mobile.service.HeadLineService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HeadLineServiceIpml implements HeadLineService {

    private static final Logger log = LoggerFactory.getLogger(HeadLineServiceIpml.class);

    @Value("${server.url}")
    String  address;
    @Autowired
    filePoMapper filePoMapper;
    @Autowired
    noticePoMapper noticePoMapper;
    @Autowired
    lotteryInfoPoMapper  lotteryInfoPoMapper;
    @Autowired
    postInfoPoMapper postInfoMapper;
    @Override
    public ResponseResult txBanners(Map dto) {
        if (! dto.containsKey("limit")){
            dto.put( "limit",5);
        }
        dto.put("fileType", Constant.FileType.file_type_bannner);
        dto.put("isEnable",Constant.IsEnable.source_isenable_yes);
        List<filePo> filePos = filePoMapper.selectFileListByMap(dto);
        return ResponseResult.success(filePos,address);
    }

    @Override
    public ResponseResult txNotice(Map dto) {
        dto.put("noticeType", Constant.NoticeType.notice_type_announcement);
        dto.put("isEnable",Constant.IsEnable.source_isenable_yes);
        if (dto.containsKey("limit")){
            return ResponseResult.success(noticePoMapper.selectNoticeByMap(dto));
        }
        Object pageNo = dto.get("pageNo");
        Object pageSize = dto.get("pageSize");
        int pageNoN = ObjectUtils.isEmpty(pageNo)? 1: Integer.parseInt(String.valueOf(pageNo));
        int pageSizeN = ObjectUtils.isEmpty(pageSize)? 10: Integer.parseInt(String.valueOf(pageSize));
        PageHelper.startPage(pageNoN,pageSizeN);
        PageInfo<noticePo> pageInfo  = new PageInfo<>(noticePoMapper.selectNoticeByMap(dto));
        return ResponseResult.success(pageInfo);
    }

    @Override
    public ResponseResult txLotterys(Map dto) throws ParseException {

        Object uid = dto.get("uid");
        Object limit = dto.get("limit");
        Date date = new Date();
        String strDate = DateUtil.parseDateToStr(date, DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS);
        String from =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 20:40:00";
        String to =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 22:00:00";
        boolean b = DateUtil.belongCalendar(strDate, from, to);
        if(b){
            dto.clear();
            dto.put("limit",1);
           return   ResponseResult.success(lotteryInfoPoMapper.selectEntityByMap(dto));
        }
        if(!ObjectUtils.isEmpty(uid)){
            if (ObjectUtils.isEmpty(limit)){
                dto.remove("limit");
                dto.put("limit",10);
            }
            return ResponseResult.success(lotteryInfoPoMapper.selectUserLotteryByMap(dto));
        }
        if (ObjectUtils.isEmpty(limit)){
            dto.remove("limit");
            dto.put("limit",10);
        }
        return   ResponseResult.success(lotteryInfoPoMapper.selectLatestLotteryInfoList(dto));
    }

    @Override
    public ResponseResult txStickPostinfos(Map dto) {
        Object uid = dto.get("uid");
        Object limit = dto.get("limit");
        Map<String,Object> resultMap = new HashMap<>();
        dto.clear();
        dto.put("limit",ObjectUtils.isEmpty(limit)? 2 : limit);
        dto.put("type",Constant.PostInfoType.postinfo_type_sticky_information);
        List<PostInfoDto> stickyPostInfos = postInfoMapper.selectPostInfoByMap(dto);
        resultMap.put("stickyPostInfos",stickyPostInfos);
        dto.clear();
        dto.put("limit",1);
        dto.put("type",Constant.PostInfoType.postinfo_type_special_information);
        if(! ObjectUtils.isEmpty(uid)){
            dto.put("uid",uid);
            List<PostInfoDto> postInfoDtos = postInfoMapper.selectStickyPostInfoByMap(dto);
            resultMap.put("specialPostInfos",postInfoDtos);
            return ResponseResult.success(resultMap,address);
        }
        List<PostInfoDto> specialPostInfos = postInfoMapper.selectPostInfoByMap(dto);
        resultMap.put("specialPostInfos",specialPostInfos);
        return ResponseResult.success(resultMap,address);

    }
    @Override
    public ResponseResult txNewestPostinfos(Map dto) {
        dto.put("type",Constant.PostInfoType.postinfo_type_laster_information);
        Object pageNo = dto.get("pageNo");
        Object pageSize = dto.get("pageSize");
        int pageNoN = ObjectUtils.isEmpty(pageNo)? 1: Integer.parseInt(String.valueOf(pageNo));
        int pageSizeN = ObjectUtils.isEmpty(pageSize)? 10: Integer.parseInt(String.valueOf(pageSize));
        PageHelper.startPage(pageNoN,pageSizeN);
        PageInfo<PostInfoDto> pageInfo  = new PageInfo<>(postInfoMapper.selectPostInfoByMap(dto));
        return ResponseResult.success(pageInfo,address);
    }
}
