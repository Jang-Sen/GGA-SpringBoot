package com.springboot.gga.repository;

import com.springboot.gga.dto.BoardCommentDto;
import com.springboot.gga.dto.BoardDto;
import com.springboot.gga.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    /**
     *  board
     */
    List<BoardDto> list(PageDto pageDto);
    BoardDto content(String bid);
    int insert(BoardDto boardDto);
    int update(BoardDto boardDto);
    int delete(String bid);

    /**
     *  boardComment
     */
    String commentSelect(String bcid);
    int commentInsert(BoardCommentDto boardCommentDto);
//    List<BoardCommentDto> comment(PageDto pageDto, String bid);
    List<BoardCommentDto> comment(PageDto pageDto);
    int commentDelete(String bcid);
    int commentUpdate(String bcid, String updateComment);
}
