package com.springboot.gga;

import com.springboot.gga.common.AopConfig;
import com.springboot.gga.common.log.logtrace.LogTrace;
import com.springboot.gga.common.log.logtrace.ThreadLocalLogTrace;
import com.springboot.gga.interceptor.SessionConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;

import javax.servlet.http.HttpSession;

@Import({AopConfig.class, SessionConfig.class})
@SpringBootApplication(scanBasePackages = "com.springboot.gga")
public class GgaApplication {

    public static void main(String[] args) {
        SpringApplication.run(GgaApplication.class, args);
    }

    @Bean
    public LogTrace logTrace(HttpSession session){
        return new ThreadLocalLogTrace(session);
    }
}
