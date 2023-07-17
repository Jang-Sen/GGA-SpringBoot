package com.springboot.gga.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.security.SecureRandom;

@Controller
public class MemberController {

    // 로그인 매핑
    @GetMapping("login")
    public String login(HttpSession session){
        String state = generateState();
        session.setAttribute("state", state);

        return "/login/login";
    }

    // CSRF 방지를 위한 상태 토큰 생성 코드
    // 상태 토큰은 추후 검증을 위해 세션에 저장되어야 한다.


    public String generateState() {
        SecureRandom random = new SecureRandom();
        return new BigInteger(130, random).toString(32);
    }

}//class
