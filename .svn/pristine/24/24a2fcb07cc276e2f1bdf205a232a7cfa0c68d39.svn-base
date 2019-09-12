package com.lb.mobile.service.impl;

import com.lb.mobile.dao.UserPoMapper;
import com.lb.mobile.entity.UserPo;
import com.lb.mobile.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class UserServiceIpml implements UserService {

    //这里的单引号不能少，否则会报错，被识别是一个对象
    private static final String CACHE_KEY = "'user'";
    private static final String USER_CACHE_NAME = "users";

    @Autowired
    UserPoMapper userPoMapper;
    @Override
    @CacheEvict(value=USER_CACHE_NAME,key=CACHE_KEY)//保存
    public int insert(UserPo record) {
        return userPoMapper.insert(record);
    }
    @Override
    @Cacheable(value=USER_CACHE_NAME,key="'user_'+#uid")//查询
    public UserPo selectByPrimaryKey(String uid) {
        System.out.printf("unuse cache");
        return userPoMapper.selectByPrimaryKey(uid);
    }

    @Override
    @CacheEvict(value = USER_CACHE_NAME,key = "'user_'+#uid")//这是清除缓存
    public int deleteByPrimaryKey(String uid) {
        return userPoMapper.deleteByPrimaryKey(uid);
    }

    @Override
    @CacheEvict(value=USER_CACHE_NAME,key=CACHE_KEY)//保存
    public int insertSelective(UserPo record) {
        return userPoMapper.insertSelective(record);
    }

    @Override
    @CachePut(value = USER_CACHE_NAME,key = "'user_'+#record.getUid()")//更新
    public int updateByPrimaryKeySelective(UserPo record) {
        return userPoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    @CachePut(value = USER_CACHE_NAME,key = "'user_'+#record.getUid()")//更新
    public int updateByPrimaryKey(UserPo record) {
        return userPoMapper.updateByPrimaryKey(record);
    }

    @Override
    public void a() {
        UserPo userPo = userPoMapper.selectByPrimaryKey("4347605730a24a96872299a980d340bc");
        userPo.setNickName("dsadsa");
        userPoMapper.updateByPrimaryKeySelective(userPo);
        UserPo user = new UserPo();
        user.setUid("4347605730a24a96872299a980d340bc");
        userPoMapper.insertSelective(user);
    }
}
