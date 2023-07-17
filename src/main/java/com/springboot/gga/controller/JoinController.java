package com.springboot.gga.controller;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.service.CouponService;
import com.springboot.gga.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class JoinController {

    @Autowired
    private JoinService joinService;
    @Autowired
    private CouponService couponService;


    // 회원가입 완료 작업
    @PostMapping("join")
    public String join_proc(MemberDto memberDto, RedirectAttributes redirectAttributes){
        int joinResult = joinService.join(memberDto);
        if(joinResult == 1) {
            redirectAttributes.addFlashAttribute("joinResult","ok");
            couponService.insertInit1(memberDto.getId());
            couponService.insertInit2(memberDto.getId());
            couponService.insertInit3(memberDto.getId());
        }
        return "redirect:/login";
    }

    @GetMapping("join")
    public String join(){
        return "join/join";
    }






}
