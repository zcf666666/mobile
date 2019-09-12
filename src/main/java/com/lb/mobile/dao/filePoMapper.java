package com.lb.mobile.dao;

import com.lb.mobile.entity.filePo;

import java.util.List;
import java.util.Map;

public interface filePoMapper {
    int deleteByPrimaryKey(String id);

    int insert(filePo record);

    int insertSelective(filePo record);

    filePo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(filePo record);

    int updateByPrimaryKey(filePo record);

    List<filePo> selectFileListByMap(Map dto);
}