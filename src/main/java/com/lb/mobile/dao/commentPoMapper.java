package com.lb.mobile.dao;

import com.lb.mobile.dto.response.CommentDto;
import com.lb.mobile.entity.commentPo;

import java.util.List;
import java.util.Map;

public interface commentPoMapper {
    int deleteByPrimaryKey(String id);

    int insert(commentPo record);

    int insertSelective(commentPo record);

    commentPo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(commentPo record);

    int updateByPrimaryKeyWithBLOBs(commentPo record);

    int updateByPrimaryKey(commentPo record);

    List<CommentDto> selectCommentInfosByMap(Map dto);
}