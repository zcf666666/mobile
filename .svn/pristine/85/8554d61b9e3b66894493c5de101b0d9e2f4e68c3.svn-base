package com.lb.mobile.service;

import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.dto.requst.AttentionProfessorDto;
import com.lb.mobile.dto.requst.SchemePublishDto;
import com.lb.mobile.dto.requst.SchemeQueryDto;
import com.lb.mobile.entity.commentPo;
import com.lb.mobile.entity.favoritePo;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface ProfessorService {
    ResponseResult selectHotProfessor(String uid,String limit);
    ResponseResult txAttentionProfessor(AttentionProfessorDto dto);
    ResponseResult txProfessorSchemes(SchemeQueryDto SchemeQueryDto);
    ResponseResult txProfessorInfo(Map<String,String> dto);
    ResponseResult txHistorySchemes(Map<String,Object> dto);
    ResponseResult txSchemesDetail(Map<String,Object> dto);
    ResponseResult txSchemesComment(commentPo dto);
    ResponseResult txIsAttention(Map<String,Object> dto);
    ResponseResult txIsEnshrine(favoritePo dto);
    ResponseResult txEnshrineDelete(favoritePo dto);
    ResponseResult txSchemePeriods(Map<String,Object> dto);
    ResponseResult txSchemePicUpload(MultipartFile file, String uid, String fileName, String fileExt, int fileType,  int picNo,String fileId,String fileUrl);
    ResponseResult txSchemePublish (SchemePublishDto dto) throws Exception;
}
