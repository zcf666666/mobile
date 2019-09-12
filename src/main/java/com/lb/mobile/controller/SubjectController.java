package com.lb.mobile.controller;

import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.service.SubjectService;
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
@RequestMapping("subject")
public class SubjectController {
    private static final Logger log = LoggerFactory.getLogger(SubjectController.class);
    @Autowired
    public SubjectService SubjectService;

    @RequestMapping(value = "/subjectinfos",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult subjectInfo(HttpServletRequest request , @RequestBody Map<String,Object> param) {
        return SubjectService.txSubjectInfo(param);
    }
}
