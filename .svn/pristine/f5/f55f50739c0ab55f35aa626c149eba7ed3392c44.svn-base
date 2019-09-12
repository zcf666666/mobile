package com.lb.mobile.dao;

import com.lb.mobile.dto.response.ChartDto;
import com.lb.mobile.entity.chartPo;

import java.util.List;
import java.util.Map;

public interface chartPoMapper {
    int deleteByPrimaryKey(String id);

    int insert(chartPo record);

    int insertSelective(chartPo record);

    chartPo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(chartPo record);

    int updateByPrimaryKeyWithBLOBs(chartPo record);

    int updateByPrimaryKey(chartPo record);

    List<ChartDto> selectLotteryChartList(Map dto);
}