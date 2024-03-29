package com.lb.mobile.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lb.mobile.comm.base.ResponseCode;
import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.comm.base.constant.Constant;
import com.lb.mobile.comm.fastdfs.FastdfsClientUtil;
import com.lb.mobile.comm.util.DateUtil;
import com.lb.mobile.comm.util.JsonUtil;
import com.lb.mobile.comm.util.UuidUtil;
import com.lb.mobile.dao.*;
import com.lb.mobile.dto.requst.AttentionProfessorDto;
import com.lb.mobile.dto.requst.SchemePublishDto;
import com.lb.mobile.dto.requst.SchemeQueryDto;
import com.lb.mobile.dto.response.HotProfessorDto;
import com.lb.mobile.dto.response.ProfessorSchemeDto;
import com.lb.mobile.dto.response.SchemeDetailDto;
import com.lb.mobile.entity.*;
import com.lb.mobile.service.ProfessorService;
import org.apache.commons.lang3.StringUtils;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Service
public class ProfessorServiceIpml implements ProfessorService {

    private static final Logger log = LoggerFactory.getLogger(ProfessorServiceIpml.class);

    @Value("${server.url}")
    String  address;
    @Autowired
    professorPoMapper professorPoMapper;
    @Autowired
    fansPoMapper fansPoMapper;
    @Autowired
    schemePoMapper schemePoMapper;
    @Autowired
    commentPoMapper commentPoMapper;
    @Autowired
    favoritePoMapper favoritePoMapper;
    @Autowired
    lotteryInfoPoMapper lotteryInfoPoMapper;
    @Autowired
    FastdfsClientUtil FastdfsClientUtil;
    @Autowired
    filePoMapper filePoMapper;
    @Autowired
    public RedissonClient redissonClient;
    @Override
    public ResponseResult selectHotProfessor(String uid,String limit)  {
        Map<String,Object> param =  new HashMap<>();
        param.put("limit",StringUtils.isBlank(limit)? 3 : Integer.parseInt(limit));
        List<HotProfessorDto> hotProfessorDtos = professorPoMapper.selectHotProfessor(param);
        if(StringUtils.isBlank(uid)){
            return ResponseResult.success(hotProfessorDtos,address);
        }
        param.clear();
        param.put("uid",uid);
        List<fansPo> fansPos = fansPoMapper.selectFansByMap(param);
        if(fansPos.size()==0 || null ==fansPos){
            return ResponseResult.success(hotProfessorDtos,address);
        }
        for (fansPo  fansPo: fansPos){
            for (HotProfessorDto  hotProfessorDto: hotProfessorDtos){
                if (fansPo.getCuid().equals(hotProfessorDto.getUid())){
                    hotProfessorDto.setIsFans(Boolean.TRUE);
                    hotProfessorDto.setStatus(fansPo.getStatus());
                }
            }
        }
        return ResponseResult.success(hotProfessorDtos,address);
    }
    @Override
    public ResponseResult txAttentionProfessor(AttentionProfessorDto dto) {

        String uid = dto.getUid();
        String cuid = dto.getCuid();
        String status = dto.getStatus();

        if(StringUtils.isBlank(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(StringUtils.isBlank(cuid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param cuid");
        }
        if(StringUtils.isBlank(status)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param status");
        }
        Map<String,Object> param =  new HashMap<>();
        param.put("uid", cuid);
        //查出关注人关注的列表
        List<fansPo> attentionPos = fansPoMapper.selectFansByMap(param);

        if("0".equals(status)){//关注
            param.clear();
            param.put("uid", uid);
            param.put("cuid", cuid);
            List<fansPo> fansPoList = fansPoMapper.selectFansByMap(param);
            if(fansPoList.size() != 0){
                return ResponseResult.success( fansPoList.get(0).getStatus());
            }
            boolean  flag  = false;
            fansPo fansPo  = new fansPo();
            fansPo.setUid(uid);
            fansPo.setCuid(cuid);
            for(fansPo fans:attentionPos){
                if(fans.getCuid().equals(uid)){
                    flag = true;
                    fans.setStatus(1);
                    fansPoMapper.updateByPrimaryKeySelective(fans);
                    fansPo.setStatus(1);
                    fansPoMapper.insertSelective(fansPo);
                    return ResponseResult.success(1);
                }
            }
            if(!flag){
                fansPo.setStatus(0);
                fansPoMapper.insertSelective(fansPo);
            }
            return ResponseResult.success(0);
        }else{//取关
            param.clear();
            param.put("uid",uid);
            param.put("cuid", cuid);
            //删除关注信息
            fansPoMapper.deleteByMap(param);
            for(fansPo fans:attentionPos){
                if(fans.getCuid().equals(uid)){
                    fans.setStatus(0);
                    fansPoMapper.updateByPrimaryKeySelective(fans);
                }
            }
            return ResponseResult.success();
        }
    }
    @Override
    public ResponseResult txProfessorSchemes(SchemeQueryDto SchemeQueryDto) {
        String pageSize = SchemeQueryDto.getPageSize();
        String pageNo = SchemeQueryDto.getPageNo();
        PageHelper.startPage(StringUtils.isBlank(pageNo) ? 1 :Integer.parseInt(pageNo),StringUtils.isBlank(pageSize) ? 10 : Integer.parseInt(pageSize) );
        PageInfo<ProfessorSchemeDto> pageInfo = new PageInfo<>( schemePoMapper.selectProfessorSchemesByDto(SchemeQueryDto));
        return ResponseResult.success(pageInfo,address);
    }

    @Override
    public ResponseResult txProfessorInfo(Map<String, String> dto) {
        String uid = dto.get("uid");
        String lotteryGenre = dto.get("lotteryGenre");
        if(StringUtils.isBlank(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(StringUtils.isBlank(lotteryGenre)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param lotteryGenre");
        }
        return ResponseResult.success(professorPoMapper.selectProfessorInfo(dto),address);
    }

    @Override
    public ResponseResult txHistorySchemes(Map<String, Object> dto) {
        Object uid = dto.get("uid");
        Object schemeLotteryType = dto.get("schemeLotteryType");
        if(ObjectUtils.isEmpty(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(ObjectUtils.isEmpty(schemeLotteryType)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param schemeLotteryType");
        }
        dto.put("schemeStatus",new int[]{Constant.SchemeStatus.scheme_status_succ,Constant.SchemeStatus.scheme_status_fail});
        Object pageNo = dto.get("pageNo");
        Object pageSize = dto.get("pageSize");
        PageHelper.startPage(ObjectUtils.isEmpty(pageNo) ? 1 : Integer.valueOf(pageNo.toString()),ObjectUtils.isEmpty(pageSize) ? 5 : Integer.parseInt(pageSize.toString()) );
        PageInfo<schemePoWithBLOBs> pageInfo = new PageInfo<>( schemePoMapper.selectSchemeListByMap(dto));
        return ResponseResult.success(pageInfo);
    }

    @Override
    public ResponseResult txSchemesDetail(Map<String, Object> dto) {
        Object id = dto.get("id");
        Object uid = dto.get("uid");
        Object schemeLotteryType = dto.get("schemeLotteryType");
        if(ObjectUtils.isEmpty(id)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param id");
        }
        if(ObjectUtils.isEmpty(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(ObjectUtils.isEmpty(schemeLotteryType)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param schemeLotteryType");
        }
        Object pageNo = dto.get("pageNo");
        Object pageSize = dto.get("pageSize");
        PageHelper.startPage(ObjectUtils.isEmpty(pageNo) ? 0 : Integer.valueOf(pageNo.toString()),ObjectUtils.isEmpty(pageSize) ? 5 : Integer.parseInt(pageSize.toString()) );
        PageInfo<SchemeDetailDto> pageInfo = new PageInfo<>( schemePoMapper.selectSchemesDetailByDto(dto));
        return ResponseResult.success(pageInfo,address);
    }

    @Override
    public ResponseResult txSchemesComment(commentPo dto) {
        String postId = dto.getPostId();
        String uid = dto.getUid();
        String comment = dto.getComment();
        if(ObjectUtils.isEmpty(postId)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param postId");
        }
        if(ObjectUtils.isEmpty(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(ObjectUtils.isEmpty(comment)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param comment");
        }
        dto.setId(UuidUtil.get32UUID());
        dto.setIsEnable(Constant.IsEnable.source_isenable_yes);
        dto.setCreateDate(new Date());
        return ResponseResult.success(commentPoMapper.insertSelective(dto));
    }
    @Override
    public ResponseResult txIsAttention(Map<String, Object> dto) {
        Object uid = dto.get("uid");
        Object cuid = dto.get("cuid");
        if(ObjectUtils.isEmpty(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(ObjectUtils.isEmpty(cuid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param cuid");
        }
        List<fansPo> fansPos = fansPoMapper.selectFansByMap(dto);
        dto.clear();
        dto.put("uid" ,cuid);
        dto.put("cuid" ,uid);
        List<fansPo> fansCuman = fansPoMapper.selectFansByMap(dto);
        Map<String, Object> resultMap = new HashMap<>();
        if(fansPos.size()==0|| null == fansPos){
            resultMap.put("isFans",Boolean.FALSE);
            return  ResponseResult.success(resultMap);
        }else{
            for (fansPo fansPo:fansPos){
                resultMap.put("status",fansPo.getStatus());
            }
            resultMap.put("isFans",Boolean.TRUE);
        }
        return ResponseResult.success(resultMap);
    }

    @Override
    public ResponseResult txIsEnshrine(favoritePo dto) {
        String uid = dto.getUid();
        String postId = dto.getPostId();
        Integer fileType = dto.getFileType();
        if(StringUtils.isEmpty(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(StringUtils.isEmpty(postId)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param postId");
        }
        if(ObjectUtils.isEmpty(fileType)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param fileType");
        }
        favoritePo favoritePo = favoritePoMapper.selectByEntity(dto);
        if(ObjectUtils.isEmpty(favoritePo)){
            dto.setId(UuidUtil.get32UUID());
            favoritePoMapper.insertSelective(dto);
            return ResponseResult.success();
        }else{
            return  ResponseResult.err(ResponseCode.FAIL.code,"already enshrine");
        }
    }

    @Override
    public ResponseResult txEnshrineDelete(favoritePo dto) {
        String uid = dto.getUid();
        String postId = dto.getPostId();
        Integer fileType = dto.getFileType();
        if(StringUtils.isEmpty(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(StringUtils.isEmpty(postId)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param postId");
        }
        if(ObjectUtils.isEmpty(fileType)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param fileType");
        }
        favoritePo favoritePo = favoritePoMapper.selectByEntity(dto);
        if(ObjectUtils.isEmpty(favoritePo)){
            return ResponseResult.err(ResponseCode.FAIL.code,"already delete");
        }
        return ResponseResult.success(favoritePoMapper.deleteByPrimaryKey(favoritePo.getId()));
    }

    @Override
    public ResponseResult txSchemePeriods(Map<String, Object> dto) {
        Object lotteryType = dto.get("lotteryType");
        if(ObjectUtils.isEmpty(lotteryType)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param lotteryType");
        }
        dto.put("limit",1);
        lotteryInfoPo lotteryInfoPo = lotteryInfoPoMapper.selectLotteryByMap(dto);
        if(ObjectUtils.isEmpty(lotteryInfoPo)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing result lotteryInfoPo");
        }else{
            return ResponseResult.success(lotteryInfoPo.getLotteryNum());
        }
    }

    @Override
    public ResponseResult txSchemePicUpload(MultipartFile file, String uid, String fileName, String fileExt, int fileType, int picNo,
                                          String fileId,String fileUrl) {

        if(ObjectUtils.isEmpty(file)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param file");
        }
        if(ObjectUtils.isEmpty(uid)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(ObjectUtils.isEmpty(fileName)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param fileName");
        }
        if(ObjectUtils.isEmpty(fileExt)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param fileExt");
        }
        if(ObjectUtils.isEmpty(fileType)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param fileType");
        }
        if(ObjectUtils.isEmpty(picNo)){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param picNo");
        }
        String url = FastdfsClientUtil.upload(file);
        Map<String, Object> dto = new HashMap<>();
        if(StringUtils.isNotBlank(fileId) && StringUtils.isNotBlank(fileUrl)){
            FastdfsClientUtil.deleteFile(fileUrl);
            filePo filePo = filePoMapper.selectByPrimaryKey(fileId);
            if(!ObjectUtils.isEmpty(filePo)){
                dto.put("fileId",fileId);
                dto.put("fileUrl",address+url);
                filePo.setFileName(fileName);
                filePo.setFileExt(fileExt);
                filePo.setFileType(fileType);
                filePo.setFileUrl(url);
                filePo.setPicNo(picNo);
                filePo.setIsEnable(Constant.IsEnable.source_isenable_yes);
                filePo.setUpdateDate(new Date());
                filePoMapper.updateByPrimaryKeySelective(filePo);
                return ResponseResult.success(dto);
            }
        }
        String id = UuidUtil.get32UUID();
        filePo filePo  = new filePo();
        filePo.setId(id);
        filePo.setUid(uid);
        filePo.setFileName(fileName);
        filePo.setFileExt(fileExt);
        filePo.setFileType(fileType);
        filePo.setFileUrl(url);
        filePo.setPicNo(picNo);
        filePo.setIsEnable(Constant.IsEnable.source_isenable_yes);
        filePo.setCreateDate(new Date());
        filePoMapper.insertSelective(filePo);
        dto.put("fileId",id);
        dto.put("fileUrl",address+url);
        return ResponseResult.success(dto);
    }

    @Override
    public ResponseResult txSchemePublish(SchemePublishDto dto) throws Exception {
        ResponseResult responseResult = schemePublishVerified(dto);
        if (responseResult.getCode() != ResponseCode.SUCCESS.code) {
            return responseResult;
        }
        filePo filePo = filePoMapper.selectByPrimaryKey(dto.getFileId());
        if (ObjectUtils.isEmpty(filePo)) {
            return ResponseResult.err(ResponseCode.FAIL.code, "missing param filePo");
        }
        String key ="ProfessorServiceIpml"+"schemePublish"+dto.getUid();
        RLock lock = redissonClient.getLock(key);
        try {
            lock.tryLock(10L,TimeUnit.SECONDS);
            Map<String, Object> queryParam = new HashMap<>();
            queryParam.put("uid", dto.getUid());
            queryParam.put("schemeLotteryType", dto.getSchemeLotteryType());
            queryParam.put("schemePeriods", dto.getSchemePeriods());
            List<schemePoWithBLOBs> schemePoWithBLOBs = schemePoMapper.selectSchemeListByMap(queryParam);
            if (schemePoWithBLOBs.size() != 0) {
                return ResponseResult.err(ResponseCode.FAIL.code, "scheme already exit!");
            }
            String id = UuidUtil.get32UUID();
            filePo.setSchemeId(id);
            filePo.setUpdateDate(new Date());
            filePoMapper.updateByPrimaryKeySelective(filePo);

            schemePoWithBLOBs schemePo = JsonUtil.toBean(dto, schemePoWithBLOBs.class);
            schemePo.setId(id);
            schemePo.setSchemeStatus(Constant.SchemeStatus.scheme_status_wait);
            schemePo.setCreateDate(new Date());
            schemePoMapper.insertSelective(schemePo);
            return ResponseResult.success();
        } catch (Exception e) {
            log.info("schemePublish happen exception,param SchemePublishDto:[]{} "+JsonUtil.toJSONString(dto),e);
            throw e;
        } finally {
            lock.unlock();
        }
    }


    public ResponseResult schemePublishVerified(SchemePublishDto dto) throws ParseException {

        if(ObjectUtils.isEmpty(dto.getUid())){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param uid");
        }
        if(ObjectUtils.isEmpty(dto.getSchemeName())){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param schemeName");
        }
        if(ObjectUtils.isEmpty(dto.getSchemeLotteryType())){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param schemeLotteryType");
        }
        if(ObjectUtils.isEmpty(dto.getSchemePeriods())){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param schemePeriods");
        }
        if(ObjectUtils.isEmpty(dto.getSchemeFull())){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param schemeFull");
        }
        if(ObjectUtils.isEmpty(dto.getSchemeGenrePd())){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param schemeGenrePd");
        }
        if(ObjectUtils.isEmpty(dto.getFileId())){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param fileId");
        }
        if(ObjectUtils.isEmpty(dto.getSchemeDec())){
            return ResponseResult.err(ResponseCode.FAIL.code,"missing param schemeDec");
        }
        Date date = new Date();
        String strDate = DateUtil.parseDateToStr(date, DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS);
        switch (dto.getSchemeLotteryType()){
            case Constant.LotteryType.lottery_type_superlotto:
                switch (DateUtil.getDayWeekOfDate2(date)){
                    case 2:case 4:case 7:
                        String from =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 20:40:00";
                        String to =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 22:00:00";
                        boolean b = DateUtil.belongCalendar(strDate, from, to);
                        if(b){
                            return ResponseResult.err(ResponseCode.FAIL.code,"publish time is not in the range");
                        }
                }
                break;
            case Constant.LotteryType.lottery_type_arrange_3:
                String from =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 20:00:00";
                String to =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 22:00:00";
                boolean b = DateUtil.belongCalendar(strDate, from, to);
                if(b) {
                    return ResponseResult.err(ResponseCode.FAIL.code, "publish time is not in the range");
                }
                break;
            case Constant.LotteryType.lottery_type_dualcoloredball:
                switch (DateUtil.getDayWeekOfDate2(date)){
                    case 1:case 3:case 5:
                        String dlfrom =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 20:45:00";
                        String dlto =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 22:00:00";
                        boolean dlb = DateUtil.belongCalendar(strDate, dlfrom, dlto);
                        if(dlb){
                            return ResponseResult.err(ResponseCode.FAIL.code,"publish time is not in the range");
                        }
                }
                break;
            case Constant.LotteryType.lottery_type_lottery_3_d:
                String d3from =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 21:00:00";
                String d3to =  DateUtil.parseDateToStr(date, DateUtil.DATE_FORMAT_YYYY_MM_DD)+" 22:00:00";
                boolean d3b = DateUtil.belongCalendar(strDate, d3from, d3to);
                if(d3b){
                    return ResponseResult.err(ResponseCode.FAIL.code,"publish time is not in the range");
                }
                break;
            default:
                return ResponseResult.err(ResponseCode.FAIL.code,"the lottery type is not support");
        }
        return  ResponseResult.success();
    }
}
