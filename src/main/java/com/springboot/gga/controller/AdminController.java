package com.springboot.gga.controller;

import com.springboot.gga.dto.PageDto;
import com.springboot.gga.service.BoardService;
import com.springboot.gga.service.MemberService;
import com.springboot.gga.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AdminController {

    @Autowired
    MemberService memberService;
    @Autowired
    PageService pageService;

    @GetMapping("admin_index")
    public String admin_index(){
        return "/admin/admin_index";
    }

    @GetMapping("admin_member_list/{page}")
    public String admin_member_list(@PathVariable String page,Model model){
        PageDto pageDto = new PageDto(page, "member");
        pageDto = pageService.getPaging(pageDto);
        model.addAttribute("list",memberService.select(pageDto));


        return "/admin/member/admin_member_list";
    }




}
