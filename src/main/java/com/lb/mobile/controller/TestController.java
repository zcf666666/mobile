package com.lb.mobile.controller;

import com.lb.mobile.comm.aop.RequestLimit;
import com.lb.mobile.comm.base.ResponseResult;
import com.lb.mobile.comm.fastdfs.FastdfsClientUtil;
import com.lb.mobile.comm.redis.RedisService;
import com.lb.mobile.comm.util.JsonUtil;
import com.lb.mobile.entity.UserPo;
import com.lb.mobile.entity.lottery.dualcoloredball.DualColoredBallPd;
import com.lb.mobile.entity.lottery.lottery3d.Lottery3dPd;
import com.lb.mobile.entity.lottery.superlotto.SuperLottoPd;
import com.lb.mobile.service.UserService;
import com.lb.mobile.task.JobTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

@Controller
public class TestController {

    private static final Logger log = LoggerFactory.getLogger(TestController.class);
    @Autowired
    RedisService RedisService;
    @Autowired
    private UserService userService;
    @Resource
    com.lb.mobile.dao.UserPoMapper UserPoMapper;
    @Autowired
    private FastdfsClientUtil fastdfsClientUtil;
    @Autowired
    private JobTask task;
    @Value("${server.url}")
    String  url;
    @RequestLimit(count=3)
    @RequestMapping(value = "/test")
    @ResponseBody
    public ResponseResult test(HttpServletRequest request){
        userService.a();
        return ResponseResult.success();
    }
    @RequestLimit(count=3)
    @RequestMapping(value = "/find")
    @ResponseBody
    public ResponseResult find(HttpServletRequest request, @RequestParam String uid){
        boolean b  = RedisService.set("1",123);
        if(b) {return ResponseResult.success("redis is ok");
        }else{
            return ResponseResult.success(userService.selectByPrimaryKey(uid));
        }
    }

    @RequestLimit(count=3)
    @RequestMapping(value = "/upload")
    @ResponseBody
    public ResponseResult upload(HttpServletRequest request, @RequestParam String fileUrl,@RequestParam String ext){
        url+="/";
        url += fastdfsClientUtil.upload(fileUrl,ext);
        return ResponseResult.success(url);
    }
    @RequestLimit(count=3)
    @RequestMapping(value = "/uploadv2")
    @ResponseBody
    public ResponseResult uploadv2(HttpServletRequest request,@RequestParam MultipartFile file){
        url+="/";
        url += fastdfsClientUtil.upload(file);
        return ResponseResult.success(url);
    }
    @RequestMapping(value = "/demo",method = RequestMethod.POST)
    @ResponseBody
    public  ResponseResult  demo(HttpServletRequest request,  @RequestParam String id){
        System.out.printf(id);
        return ResponseResult.success(id);
    }
    @RequestMapping(value = "/demo1",method = RequestMethod.POST)
    @ResponseBody
    public  ResponseResult  demo1(HttpServletRequest request, @RequestBody Object id){
        return ResponseResult.success(id);
    }
    @RequestMapping(value = "/task",method = RequestMethod.POST)
    @ResponseBody
    public  ResponseResult  task(HttpServletRequest request){
        task.lotteryDraw();
        return ResponseResult.success("");
    }
    public static void main(String[] args) {
        String s = UUID.randomUUID().toString().replaceAll("-", "");
        System.err.println(s);
        DualColoredBallPd  DualColoredBallPd = new DualColoredBallPd();
        DualColoredBallPd.setSchemeRTf("01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24");
        DualColoredBallPd.setSchemeREty("01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18");
        DualColoredBallPd.setSchemeRTy("01-02-03-04-05-06-07-08-09-10-11-12");
        DualColoredBallPd.setSchemeREt("01-02-03-04-05-06-07-08");
        DualColoredBallPd.setSchemeBibcock("01");
        DualColoredBallPd.setSchemePnix("02");
        DualColoredBallPd.setRedGallbladder("26");
        DualColoredBallPd.setRedTwoGallbladder("03-06");
        DualColoredBallPd.setRedThreeGallbladder("03-06-01");
        DualColoredBallPd.setRedKtGallbladder("12-23-18");
        DualColoredBallPd.setRedKsGallbladder("14-25-31");
        DualColoredBallPd.setBlueGallbladder("09");
        DualColoredBallPd.setBlueTwoGallbladder("09-05");
        DualColoredBallPd.setBlueThreeGallbladder("09-05-03");
        DualColoredBallPd.setBlueSixGallbladder("09-05-03-01-12-15");
        DualColoredBallPd.setBlueKtGallbladder("01-02-03");
        DualColoredBallPd.setBlueKsGallbladder("01-02-03-05-08-07");
        System.out.println(JsonUtil.toJSONString(DualColoredBallPd));
        SuperLottoPd SuperLottoPd = new SuperLottoPd();
        SuperLottoPd.setSchemeTf("01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24");
        SuperLottoPd.setSchemeEty("01-02-03-04-05-06-07-08-09-10-11-12-13-14-15-16-17-18");
        SuperLottoPd.setSchemeTy("01-02-03-04-05-06-07-08-09-10-11-12");
        SuperLottoPd.setSchemeEt("01-02-03-04-05-06-07-08");
        SuperLottoPd.setSchemeBibcock("01");
        SuperLottoPd.setSchemePnix("26");
        SuperLottoPd.setSchemeBtgallbladder("06");
        SuperLottoPd.setSchemeTwogallbladder("06-08");
        SuperLottoPd.setSchemeThreegallbladder("06-12-33");
        SuperLottoPd.setSchemeKtgallbladder("18-15-11");
        SuperLottoPd.setSchemeKsgallbladder("18-15-11-21-25-28");
        SuperLottoPd.setSchemeBtwogallbladder("01-02");
        SuperLottoPd.setSchemeBfourgallbladder("01-03-05-07");
        SuperLottoPd.setSchemeBsixgallbladder("02-04-06-08-10-12");
        SuperLottoPd.setSchemeKbthreegallbladder("15-16-17");
        SuperLottoPd.setSchemeKbsixgallbladder("15-16-17-18-19-20");
        System.out.println(JsonUtil.toJSONString(SuperLottoPd));

        Lottery3dPd Lottery3dPd  = new Lottery3dPd();
        Lottery3dPd.setThreeGallbladder("1-2-3");//三胆
        Lottery3dPd.setDbGallbladder("3-6");//双胆
        Lottery3dPd.setGallbladder("9");//独胆
        Lottery3dPd.setKillGallbladder("1");//杀一码
        Lottery3dPd.setKillTwoGallbladder("1-6");//杀二码
        Lottery3dPd.setKillThreeGallbladder("1-6-3");//杀三码
        Lottery3dPd.setFiveGallbladder("2-4-5-8-9");//五码
        Lottery3dPd.setSixGallbladder("2-4-5-8--9-7");//六码
        Lottery3dPd.setBxPositionGb("-4-");//包星定位
        Lottery3dPd.setSumGallbladder("8-16");//和值
        Lottery3dPd.setSpanGallbladder("2-7");//跨度
        Lottery3dPd.setGroupHuntingGb("8-6-3&9-6-4&6-8-4&1-4-9&6-6-6");//组选
        System.out.println(JsonUtil.toJSONString(Lottery3dPd));
    }
}