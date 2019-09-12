package com.lb.mobile.comm.aop;

import com.lb.mobile.comm.base.ResponseCode;
import com.lb.mobile.comm.exception.BizException;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

/**
 * 限制单个Ip重复提交
 */
@Aspect
@Component
public class RequestLimitContract {
    private static final Logger log = LoggerFactory.getLogger(RequestLimitContract.class);
    private Map<String , Integer> redisTemplate = new HashMap<>();
    @Before("within(@org.springframework.stereotype.Controller *) && @annotation(limit)")
    public void requestLimit(final JoinPoint joinPoint , RequestLimit limit) throws Exception {
        try {
            Object[] args = joinPoint.getArgs();
            HttpServletRequest request = null;
            for (int i = 0; i < args.length; i++) {
                if (args[i] instanceof HttpServletRequest) {
                    request = (HttpServletRequest) args[i];
                    break;
                }
            }
            if (request == null) {
                throw new BizException(ResponseCode.INTERNAL_SERVER_ERROR.code,"方法中缺失HttpServletRequest参数");
            }
            String ip = request.getLocalAddr();
            String url = request.getRequestURL().toString();
            String key = "req_limit_".concat(url).concat(ip);
            if (redisTemplate.get(key) == null || redisTemplate.get(key) == 0) {
                redisTemplate.put(key, 1);
            } else {
                redisTemplate.put(key, redisTemplate.get(key) + 1);
            }
            int count = redisTemplate.get(key);
            if (count > 0) {
                //创建一个定时器
                Timer timer = new Timer();
                TimerTask timerTask = new TimerTask() {
                    @Override
                    public void run() {
                        redisTemplate.remove(key);
                    }
                };
                //这个定时器设定在time规定的时间之后会执行上面的remove方法，也就是说在这个时间后它可以重新访问
                timer.schedule(timerTask, limit.time());
            }
            if (count > limit.count()) {
                log.info("用户IP[" + ip + "]访问地址[" + url + "]超过了限定的次数[" + limit.count() + "]");
                throw new BizException(ResponseCode.INTERNAL_SERVER_ERROR.code,"访问过于频繁,稍后再试!");
            }
        }
        catch (RuntimeException e){
            throw new BizException(ResponseCode.INTERNAL_SERVER_ERROR.code,"访问过于频繁,稍后再试!");
        }catch (Exception e){
            throw new BizException(ResponseCode.INTERNAL_SERVER_ERROR.code,"访问过于频繁,稍后再试!");
        }
    }
}
