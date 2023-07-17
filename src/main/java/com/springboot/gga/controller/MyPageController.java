package com.springboot.gga.controller;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.service.MemberService;
import com.springboot.gga.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyPageController {
    @Autowired
    private MemberService memberService;

    @Autowired
    private OrderService orderService;


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
   /* @GetMapping("mypage/{id}")
    public String mypage(@PathVariable String id, Model model){
        MemberDto memberDto  = memberService.selectMypage(id);
        ArrayList<OrderconDto> list = orderService.selectOrderconMypage(id);
        ArrayList<ProductOrderDto> polist = orderService.selectProductOrderMypage(id);

        model.addAttribute("svo",memberDto);
        model.addAttribute("ticketlist",list);
        model.addAttribute("polist",polist);

        return "/mypage/mypage";

    }*/

}
