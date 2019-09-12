package com.lb.mobile.dao;

import com.lb.mobile.dto.response.HotProfessorDto;
import com.lb.mobile.dto.response.ProfessorDto;
import com.lb.mobile.entity.professorPo;

import java.util.List;
import java.util.Map;

public interface professorPoMapper {
    int deleteByPrimaryKey(String id);

    int insert(professorPo record);

    int insertSelective(professorPo record);

    professorPo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(professorPo record);

    int updateByPrimaryKeyWithBLOBs(professorPo record);

    int updateByPrimaryKey(professorPo record);

    professorPo selectByMap(Map map);

    List<HotProfessorDto> selectHotProfessor(Map map);

    ProfessorDto selectProfessorInfo(Map map);

}