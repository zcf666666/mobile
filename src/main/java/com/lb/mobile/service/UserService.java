package com.lb.mobile.service;

import com.lb.mobile.entity.UserPo;

public interface UserService {
    int insert(UserPo record);
    UserPo selectByPrimaryKey(String uid);
    int deleteByPrimaryKey(String uid);
    int insertSelective(UserPo record);
    int updateByPrimaryKeySelective(UserPo record);
    int updateByPrimaryKey(UserPo record);

    void a();
}
