package com.lb.mobile.controller;

import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.entity.commentPo;
import com.lb.mobile.entity.favoritePo;
import com.lb.mobile.service.HotInformationService;
import com.lb.mobile.service.ProfessorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("information")
public class HotInformationController {
    private static final Logger log = LoggerFactory.getLogger(HotInformationController.class);
    @Autowired
    public HotInformationService HotInformationService;
    @Autowired
    public ProfessorService professorService;

    @RequestMapping(value = "/hot-postinfos",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult hotPostinfos(HttpServletRequest request , @RequestBody Map<String,Object> param) {
        return HotInformationService.txHotPostinfos(param);
    }
    @RequestMapping(value = "/postinfo-detail",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult postinfoDetail(HttpServletRequest request , @RequestBody Map<String,Object> param) {
        return HotInformationService.txPostinfoDetail(param);
    }
    @RequestMapping(value = "/postinfo-comment",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult postinfoComment(HttpServletRequest request , @RequestBody commentPo dto) {
        return professorService.txSchemesComment(dto);
    }
    @RequestMapping(value = "/postinfo-enshrine",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult isEnshrine(HttpServletRequest request, @RequestBody favoritePo dto){
        return professorService.txIsEnshrine(dto);
    }
    @RequestMapping(value = "/postinfo-delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult enshrineDelete(HttpServletRequest request, @RequestBody favoritePo dto){
        return professorService.txEnshrineDelete(dto);
    }
}
