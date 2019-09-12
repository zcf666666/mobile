package com.lb.mobile;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;
@EnableScheduling
@EnableCaching
@MapperScan("com.lb.mobile.dao")
@SpringBootApplication
public class MobileApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(MobileApplication.class, args);
    }
}
