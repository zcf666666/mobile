package com.lb.mobile.comm.exception;

import com.lb.mobile.comm.base.ResponseCode;
import com.lb.mobile.comm.base.ResponseResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class IocExceptionHandler {
    private static final Logger log = LoggerFactory.getLogger(IocExceptionHandler.class);
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Object errorHandler(Exception e) {
        log.error("Exception[]{}:",e);
        if(e instanceof  BizException ){
            BizException biz = (BizException) e;
            return ResponseResult.err(biz.getCode(),biz.getMsg());
        }else{
            return ResponseResult.err(ResponseCode.INTERNAL_SERVER_ERROR.code, "system error!");
        }
    }
}
