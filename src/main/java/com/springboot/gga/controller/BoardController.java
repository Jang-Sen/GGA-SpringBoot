package com.springboot.gga.controller;

import com.springboot.gga.dto.*;
import com.springboot.gga.service.BoardService;
import com.springboot.gga.service.FileService;
import com.springboot.gga.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private PageService pageService;
    @Autowired
    private FileService fileService;

    /**
     * Board
     */
    @GetMapping("board_list")
    public String board_list(){
        return "board/board_list";
    }

    @GetMapping("board_content/{page}/{bid}")
    public String board_content(@PathVariable String page, @PathVariable String bid, HttpSession session, Model model){
        BoardDto boardDto = boardService.content(bid);
        PageDto pageDto = new PageDto(page, "boardComment", bid);
        pageDto = pageService.getPaging(pageDto);

        List<BoardCommentDto> comment = boardService.comment(pageDto);

        int authCheck = 0;

        SessionDto sessionDto = (SessionDto) session.getAttribute("svo");

        if (sessionDto != null){
            if (boardDto.getMid().equals(sessionDto.getId())){
                authCheck = 1;
            } else if (sessionDto.getId().equals("admin")){
                authCheck = 1;
            }
        }

        model.addAttribute("page", pageDto);
        model.addAttribute("board", boardService.content(bid));
        model.addAttribute("comment", comment);
        model.addAttribute("authCheck", authCheck);

        return "board/board_content";
    }

    @GetMapping("board_write")
    public String board_write(){
        return "board/board_write";
    }

    @PostMapping("board_write")
    public String board_write_proc(BoardDto boardDto) throws Exception{
        boardDto = (BoardDto) fileService.fileCheck(boardDto);
        int result = boardService.insert(boardDto);

        if (result == 1){
            fileService.fileSave(boardDto);
        }

        return "redirect:/board_list";
    }

    @GetMapping("board_update/{page}/{bid}")
    public String board_update(@PathVariable String page, @PathVariable String bid, Model model){
        model.addAttribute("board", boardService.content(bid));
        model.addAttribute("page", page);

        return "board/board_update";
    }

    @PostMapping("board_update")
    public String board_update_proc(BoardDto boardDto) throws Exception{
        // 새로운 파일 선택 시 기존 파일(oldFile:gsfile) 삭제
        String oldFile = boardDto.getGsfile();
        boardDto = (BoardDto) fileService.fileCheck(boardDto);
        int result = boardService.update(boardDto);

        if (result == 1){
            if (!boardDto.getFile1().isEmpty()){
                fileService.fileSave(boardDto); // 새로운 파일 저장
                fileService.fileDelete(oldFile); // 기존 파일 삭제
            }
        }

        return "redirect:/board_content/" + boardDto.getPage() + "/" + boardDto.getBid();
    }

    @PostMapping("board_delete")
    public String board_delete_proc(BoardDto boardDto) throws Exception{
        String oldFile = boardDto.getGsfile();
        int result = boardService.delete(boardDto.getBid());

        if (result == 1){
            if (!oldFile.equals("")){
                fileService.fileDelete(oldFile);
            }
        }

        return "redirect:/board_list";
    }

    @GetMapping("admin_board_list")
    public String admin_board_list(){
        return "admin/board/admin_board_list";
    }

    /**
     * BoardComment
     */
    @PostMapping("board_comment")
    public String board_comment(BoardCommentDto boardCommentDto){
        int result = boardService.commentInsert(boardCommentDto);

        if (result == 1){
            return "redirect:/board_content/" + boardCommentDto.getPage() + "/" + boardCommentDto.getBid();
        } else {
            return "redirect:/errorpage";
        }
    }

    /**
     * FAQ
     */
    @GetMapping("faq")
    public String faq(){
        return "/board/faq";
    }

    /**
     *  Coronation
     */
    @GetMapping("coronation")
    public String coronation(){
        return "/coronation/coronation";
    }
}
