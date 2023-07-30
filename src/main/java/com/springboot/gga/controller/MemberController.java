package com.springboot.gga.controller;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.security.SecureRandom;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

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
