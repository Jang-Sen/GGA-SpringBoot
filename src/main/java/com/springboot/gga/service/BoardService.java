package com.springboot.gga.service;

import com.springboot.gga.dto.BoardCommentDto;
import com.springboot.gga.dto.BoardDto;
import com.springboot.gga.dto.PageDto;
import com.springboot.gga.repository.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardMapper boardMapper;

    /**
     * Board
     */
    public List<BoardDto> list(PageDto pageDto){
        return boardMapper.list(pageDto);
    }

    public BoardDto content(String bid){
        return boardMapper.content(bid);
    }

    public int insert(BoardDto boardDto){
        return boardMapper.insert(boardDto);
    }

    public int update(BoardDto boardDto){
        return  boardMapper.update(boardDto);
    }

    public int delete(String bid){
        return boardMapper.delete(bid);
    }

    /**
     * BoardComment
     */
    public String commentSelect(String bcid){
        return boardMapper.commentSelect(bcid);
    }

    public int commentInsert(BoardCommentDto boardCommentDto){
        return boardMapper.commentInsert(boardCommentDto);
    }

//    public List<BoardCommentDto> comment(PageDto pageDto, String bid){
    public List<BoardCommentDto> comment(PageDto pageDto){
        return boardMapper.comment(pageDto);
    }

    public int commentDelete(String bcid){
        return boardMapper.commentDelete(bcid);
    }

    public int commentUpdate(String bcid, String updateComment){
        return boardMapper.commentUpdate(bcid, updateComment);
    }

    /**
    * BoardMaster - 마이페이지 - 지웅
     */
    public List<BoardDto> boardCommentMaster(Map param){
        return boardMapper.boardCommentMaster(param);
    }


}
