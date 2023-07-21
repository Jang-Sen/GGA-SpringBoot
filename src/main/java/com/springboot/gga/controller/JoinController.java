package com.springboot.gga.controller;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.service.CouponService;
import com.springboot.gga.service.JoinService;
//import net.nurigo.sdk.NurigoApp;
//import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
//import net.nurigo.sdk.message.model.Message;
//import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Random;

@Controller
public class JoinController {

    @Autowired
    private JoinService joinService;
    @Autowired
    private CouponService couponService;


    // 회원가입 휴대폰 인증 - 토큰소진 - 시연일까지 사용금지 !!!
//    @GetMapping("joinMobileCheck/{userPhone}")
//    @ResponseBody
//    public String joinMobileCheck(@PathVariable String userPhone) {
//        Random accessKey = new Random();
//        int result = accessKey.nextInt(9999);
//
//        DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCSPCWEWOWJNKXFD", "CQGEBLEG5EEOQZZTII7KSLBOFHUR7JMT", "https://api.coolsms.co.kr");
//// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
//        Message message = new Message();
//        message.setFrom("01082524053");
//        message.setTo("01082524053");
//        message.setText("[GGA MOVIE] 회원가입 인증번호는 ["+result+"] 입니다. ");
//
//        try {
//// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
//            messageService.send(message);
//        } catch (
//                NurigoMessageNotReceivedException exception) {
//// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
//            System.out.println(exception.getFailedMessageList());
//            System.out.println(exception.getMessage());
//        } catch (Exception exception) {
//            System.out.println(exception.getMessage());
//        }
//
//        return String.valueOf(result);
//    }

    // 회원가입 완료 작업
    @PostMapping("join")
    public String join_proc(MemberDto memberDto, Model model, RedirectAttributes redirectAttributes){
        String viewName = "";
        int joinResult = joinService.join(memberDto);

        if(joinResult == 1) {
            model.addAttribute("joinResult","ok");
            if(memberDto.getId() == memberDto.getEmail()){
               viewName = "redirect:/mypage/"+memberDto.getId();
// 네이버 로그인 성공했을때 이미 회원인지아닌지 체크 마이페이지 표기 다름(해결)
            }else{
                redirectAttributes.addFlashAttribute("joinResult","ok");
                couponService.insertInit1(memberDto.getId());
                couponService.insertInit2(memberDto.getId());
                couponService.insertInit3(memberDto.getId());
                couponService.insertInit4(memberDto.getId());
                couponService.insertInit5(memberDto.getId());
                viewName = "redirect:/login";
             }
        }
        return viewName;
    }
}