package com.lb.mobile.dao;

import com.lb.mobile.dto.requst.SchemeQueryDto;
import com.lb.mobile.dto.response.ProfessorSchemeDto;
import com.lb.mobile.dto.response.SchemeDetailDto;
import com.lb.mobile.entity.schemePo;
import com.lb.mobile.entity.schemePoWithBLOBs;

import java.util.List;
import java.util.Map;

public interface schemePoMapper {
    int deleteByPrimaryKey(String id);

    int insert(schemePoWithBLOBs record);

    int insertSelective(schemePoWithBLOBs record);

    schemePoWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(schemePoWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(schemePoWithBLOBs record);

    int updateByPrimaryKey(schemePo record);

    List<schemePoWithBLOBs> selectSchemeListByMap(Map map);

    int countSchemeByStatus(Map map);

    List<ProfessorSchemeDto> selectProfessorSchemesByDto(SchemeQueryDto SchemeQueryDto);

    List<SchemeDetailDto>selectSchemesDetailByDto(Map map);
}