package com.springboot.gga.interceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class SessionConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry){
        InterceptorRegistration sessionCheckInterceptor = registry.addInterceptor(new SessionAuthInterceptor());
        sessionCheckInterceptor.addPathPatterns("/mypage**/**", "/admin**/**");
    }

    @Bean
    public SessionAuthInterceptor sessionAuthInterceptor() {
        return new SessionAuthInterceptor();
    }
}
