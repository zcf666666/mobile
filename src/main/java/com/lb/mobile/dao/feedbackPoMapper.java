package com.lb.mobile.dao;

import com.lb.mobile.entity.feedbackPo;

public interface feedbackPoMapper {
    int deleteByPrimaryKey(String id);

    int insert(feedbackPo record);

    int insertSelective(feedbackPo record);

    feedbackPo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(feedbackPo record);

    int updateByPrimaryKey(feedbackPo record);
}