package com.springboot.gga.controller;

import com.springboot.gga.service.NoticeService;
import com.springboot.gga.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private PageService pageService;

    @GetMapping("notice_list")
    public String notice_list(){
        return "/notice/notice_list";
    }

    @GetMapping("notice_content")
    public String notice_content(){
        return "/notice/notice_content";
    }

    @GetMapping("admin_notice_list")
    public String admin_notice_list(){
        return "/admin/notice/admin_notice_list";
    }
}
