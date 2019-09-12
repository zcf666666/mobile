package com.lb.mobile.controller;

import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.service.HeadLineService;
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
@RequestMapping("headline")
public class HeadLineController {
    private static final Logger log = LoggerFactory.getLogger(HeadLineController.class);
    @Autowired
    public HeadLineService HeadLineService;
    @RequestMapping(value = "/banners",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult banners(HttpServletRequest request , @RequestBody Map<String,Object> param){
        return HeadLineService.txBanners(param);
    }
    @RequestMapping(value = "/notices",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult notices(HttpServletRequest request , @RequestBody Map<String,Object> param){
        return HeadLineService.txNotice(param);
    }
    @RequestMapping(value = "/lotterys",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult lotterys(HttpServletRequest request , @RequestBody Map<String,Object> param) throws Exception {
        return HeadLineService.txLotterys(param);
    }
    @RequestMapping(value = "/stick-postinfos",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult stickPostinfos(HttpServletRequest request , @RequestBody Map<String,Object> param) {
        return HeadLineService.txStickPostinfos(param);
    }
    @RequestMapping(value = "/newest-postinfos",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult newestPostinfos(HttpServletRequest request , @RequestBody Map<String,Object> param) {
        return HeadLineService.txNewestPostinfos(param);
    }
}
