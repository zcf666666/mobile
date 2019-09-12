package com.lb.mobile.dao;

import com.lb.mobile.entity.noticePo;

import java.util.List;
import java.util.Map;

public interface noticePoMapper {
    int deleteByPrimaryKey(String id);

    int insert(noticePo record);

    int insertSelective(noticePo record);

    noticePo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(noticePo record);

    int updateByPrimaryKeyWithBLOBs(noticePo record);

    int updateByPrimaryKey(noticePo record);

    List<noticePo> selectNoticeByMap(Map dto);

}