package com.springboot.gga.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.security.SecureRandom;

@Controller
public class MemberController {

    // 회원가입 매핑
    @GetMapping("join")
    public String join(){
        return "/join/join";
    }

    // 로그인 매핑
    @GetMapping("login")
    public String login(){

        return "/login/login";
    }

}//class
