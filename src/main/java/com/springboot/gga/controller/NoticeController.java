package com.springboot.gga.controller;

import com.springboot.gga.dto.NoticeDto;
import com.springboot.gga.service.FileService;
import com.springboot.gga.service.NoticeService;
import com.springboot.gga.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private PageService pageService;
    @Autowired
    private FileService fileService;

    @GetMapping("notice_list")
    public String notice_list(){
        return "/notice/notice_list";
    }

    @GetMapping("notice_content/{page}/{nid}")
    public String notice_content(@PathVariable String page, @PathVariable String nid, Model model) {
        model.addAttribute("page", page);
        model.addAttribute("notice", noticeService.content(nid));

        return "/notice/notice_content";
    }

    @GetMapping("admin_notice_list")
    public String admin_notice_list(){
        return "/admin/notice/admin_notice_list";
    }

    @GetMapping("admin_notice_content/{page}/{nid}")
    public String admin_notice_content(@PathVariable String page, @PathVariable String nid, Model model){
        model.addAttribute("page", page);
        model.addAttribute("notice", noticeService.content(nid));

        return "/admin/notice/admin_notice_content";
    }

    @GetMapping("admin_notice_write")
    public String admin_notice_write(){
        return "/admin/notice/admin_notice_write";
    }

    @PostMapping("admin_notice_write")
    public String admin_notice_write_proc(NoticeDto noticeDto) throws Exception{
        noticeDto = (NoticeDto) fileService.fileCheck(noticeDto);
        int result = noticeService.insert(noticeDto);

        if (result ==1){
            fileService.fileSave(noticeDto);
        }
        return "redirect:/admin_notice_list";
    }

    @GetMapping("admin_notice_update/{page}/{nid}")
    public String admin_notice_update(@PathVariable String page, @PathVariable String nid, Model model){
        model.addAttribute("page", page);
        model.addAttribute("notice", noticeService.content(nid));

        return "admin/notice/admin_notice_update";
    }

    @PostMapping("admin_notice_update")
    public String admin_notice_update_proc(NoticeDto noticeDto) throws Exception{
        System.out.println("noticeDto = " + noticeDto);
        String oldFile = noticeDto.getGsfile();
        noticeDto = (NoticeDto) fileService.fileCheck(noticeDto);
        int result = noticeService.update(noticeDto);

        if (result == 1){
            if (!noticeDto.getFile1().isEmpty()){
                fileService.fileSave(noticeDto);
                fileService.fileDelete(oldFile);
            }
        }

        return "redirect:/admin_notice_content/" + noticeDto.getPage() + "/" + noticeDto.getNid();
    }

    @GetMapping("admin_notice_delete/{page}/{nid}")
    public String admin_notice_delete(@PathVariable String page, @PathVariable String nid, Model model){
        model.addAttribute("page", page);
        model.addAttribute("notice", noticeService.content(nid));

        return "/admin/notice/admin_notice_delete";
    }

    @PostMapping("admin_notice_delete")
    public String admin_notice_delete(NoticeDto noticeDto) throws Exception{
        String oldFile = noticeDto.getGsfile();

        if (noticeService.delete(noticeDto.getNid()) == 1){
            if (!oldFile.equals("")){
                fileService.fileDelete(oldFile);
            }
        }

        return "redirect:/admin_notice_list";
    }
}
