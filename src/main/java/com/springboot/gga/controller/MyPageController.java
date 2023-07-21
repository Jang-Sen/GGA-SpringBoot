package com.springboot.gga.controller;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.dto.OrderconDto;
import com.springboot.gga.dto.ProductOrderDto;
import com.springboot.gga.dto.SessionDto;
import com.springboot.gga.service.CouponService;
import com.springboot.gga.service.MemberService;
import com.springboot.gga.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MyPageController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CouponService couponService;

    //마이페이지 정보수정 접근 전 본인 확인
//    @GetMapping("mypage_passCheck/{modalPass}/{modalName}")
//    @ResponseBody
//    public String mypage_passCheck(@PathVariable String modalPass,@PathVariable String modalName) {
//        MemberDto memberDto = new MemberDto();
//        memberDto.setName(modalName);
//        memberDto.setPass(modalPass);
//        String result = memberService.passCheck(memberDto);
//        return result;
//    }

    //네이버 로그인 마이페이지 접근
    @GetMapping("naverMypage/{naverEmail}/{naverName}/{naverGender}/{naverBirthday}/{naverMobile}")
    public String naverMypage(@PathVariable String naverEmail, @PathVariable String naverName, @PathVariable String naverGender
            , @PathVariable String naverBirthday, Model model, HttpSession session){
//나중에 통합 회원으로 전환 후에는 일반 마이페이지 처럼 매핑 한다 . 예매할때는 희정님이랑 상의
// ArrayList<OrderconDto> list = orderService.selectOrderconMypage(naverEmail);
// ArrayList<ProductOrderDto> polist = orderService.selectProductOrderMypage(naverEmail); 통합 회원으로 전환해야 가능한 서비스

        SessionDto sessionDto = new SessionDto();
        sessionDto.setId(naverEmail);
        sessionDto.setName(naverName);
        if(naverGender != "undefined") {
// sessionDto.setNavGender(naverGender);
            if(naverGender.equals("M")) {
                sessionDto.setNavGender("m");
            }else{
                sessionDto.setNavGender("f");
            }
        }else{
            sessionDto.setNavGender("");
        }
        if(naverBirthday != "undefined"){
            sessionDto.setNavBirthday(naverBirthday);
        }else{
            sessionDto.setNavBirthday("");
        }
        int memberCheck = memberService.idCheck(sessionDto.getId());
        if(memberCheck == 1) {
            sessionDto.setNaverLoginResult(0);
        }
// if(naverMobile != "undefined"){
// sessionDto.setNavMobile(naverMobile);
// }else{
// sessionDto.setNavMobile("");
// }
// sessionDto.setNaverLoginResult(1);
// model.addAttribute("naverLoginResult","ok");
        session.setAttribute("svo",sessionDto);
// model.addAttribute("ticketlist",list);
// model.addAttribute("polist",polist);

        return "/mypage/mypage";
    }

    // 네이버 로그아웃
    @GetMapping("naverLogout")
    public String naverLogout(HttpSession session, Model model){
        session.invalidate();
        model.addAttribute("logoutResult","ok");
// sessionDto.setId("###");
// sessionDto.setNaverLoginResult(0);
// session.setAttribute("svo",sessionDto);

        return "/index";
    }

    // 내 정보 수정 완료
    @PostMapping("mypage_update")
    public String mypage_update(MemberDto memberDto){

        System.out.println("진입");
        System.out.println(memberDto.getTel());
        System.out.println(memberDto.getEmail());
        System.out.println(memberDto.getEmail1());
        System.out.println(memberDto.getEmail2());
        System.out.println(memberDto.getCarnum());
        System.out.println(memberDto.getCar1());
        System.out.println(memberDto.getCar2());
        int result = memberService.updateMypage(memberDto);
        // if 문 조건 viewName
        return "redirect:/mypage/"+memberDto.getId();
    }

    // 내정보 수정탭 진입
    @GetMapping("mypage_update/{id}")
    public String mypage_update(@PathVariable String id, Model model){
        MemberDto memberDto = memberService.selectMypage(id);
        model.addAttribute("memberInfo", memberDto);
        return "/mypage/mypage_update";
    }


    // 마이페이지 조회
    @GetMapping("mypage/{id}")
    public String mypage(@PathVariable String id, Model model){
        MemberDto memberDto  = memberService.selectMypage(id);
        ArrayList<OrderconDto> list = orderService.selectOrderconMypage(id);
       // ArrayList<ProductOrderDto> polist = orderService.selectProductOrderMypage(id);

        model.addAttribute("svo",memberDto);
        model.addAttribute("ticketlist",list);
        //model.addAttribute("polist",polist);

        return "/mypage/mypage";

    }

    @GetMapping("mypage_ticket/{oconid}")
    public String mypage_ticket(@PathVariable String oconid,Model model) {
        OrderconDto orderconDto = orderService.selectOrderconlist(oconid);
        model.addAttribute("orderconDto", orderconDto);

        return "/mypage/mypage_ticket";
    }

    @GetMapping("mypage_ticket2/{oconid}")
    public String mypage_ticket2(@PathVariable String oconid,Model model) {
        OrderconDto orderconDto = orderService.selectOrderconlist(oconid);
        model.addAttribute("orderconDto", orderconDto);

        return "/mypage/mypage_ticket2";
    }

    @GetMapping("mypage_ticket_refund/{oconid}")
    public String mypage_ticket_refund(@PathVariable String oconid) {
        OrderconDto orderconDto = orderService.selectOrderconlist(oconid);
        String seat = orderconDto.getSeat();
        String[] seatList = seat.split(",");
        Map param = new HashMap();


        for(String seatNumber : seatList) {
            orderService.resetSeat(seatNumber);
        }
        orderService.deleteOrdercon(oconid);
        param.put("couponid", orderconDto.getCouponid());
        param.put("id",orderconDto.getId());

        couponService.updateCancel(param);

        return "/mypage/mypage";

    }

}
