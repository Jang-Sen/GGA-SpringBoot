package com.springboot.gga.controller;

import com.springboot.gga.dto.BoardDto;
import com.springboot.gga.dto.FileDto;
import com.springboot.gga.service.BoardService;
import com.springboot.gga.service.FileService;
import com.springboot.gga.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private PageService pageService;
    @Autowired
    private FileService fileService;

    @GetMapping("board_list")
    public String board_list(){
        return "board/board_list";
    }

    @GetMapping("board_content/{page}/{bid}")
    public String board_content(@PathVariable String page, @PathVariable String bid, Model model){
        model.addAttribute("page", page);
        model.addAttribute("board", boardService.content(bid));

        return "board/board_content";
    }

    @GetMapping("board_write")
    public String board_write(){
        return "board/board_write";
    }

    @PostMapping("board_write")
    public String board_write_proc(BoardDto boardDto){
        int result = boardService.insert(boardDto);

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
//        boardDto = (BoardDto) fileService.fileCheck(boardDto);
        int result = boardService.update(boardDto);

        if (result == 1){
//            if (!boardDto.getFile1().isEmpty()){
//                fileService.fileSave(boardDto); // 새로운 파일 저장
//                fileService.fileDelete(oldFile); // 기존 파일 삭제
//            }
        }

        return "redirect:/board_content";  // boardDto.getPage() + "/" + boardDto.getBid();
    }

    @PostMapping("board_delete")
    public String board_delete_proc(BoardDto boardDto) throws Exception{
        // 파일 포함 0
        String oldFile = boardService.getOldFile(boardDto.getBid());
        int result = boardService.delete(boardDto.getBid());

        if (result == 1){
            if (!oldFile.equals("")){
                fileService.fileDelete(oldFile);
            }
        }

        return "redirect:/board_list";
    }
}
