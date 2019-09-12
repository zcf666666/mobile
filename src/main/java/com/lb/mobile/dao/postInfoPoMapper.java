package com.lb.mobile.dao;

import com.lb.mobile.dto.response.PostInfoDto;
import com.lb.mobile.entity.postInfoPo;

import java.util.List;
import java.util.Map;

public interface postInfoPoMapper {
    int deleteByPrimaryKey(String id);

    int insert(postInfoPo record);

    int insertSelective(postInfoPo record);

    postInfoPo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(postInfoPo record);

    int updateByPrimaryKeyWithBLOBs(postInfoPo record);

    int updateByPrimaryKey(postInfoPo record);

    List<PostInfoDto> selectPostInfoByMap(Map dto);

    List<PostInfoDto> selectStickyPostInfoByMap(Map dto);
}