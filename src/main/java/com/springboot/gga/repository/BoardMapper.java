package com.springboot.gga.repository;

import com.springboot.gga.dto.BoardDto;
import com.springboot.gga.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardDto> list(PageDto pageDto);
    BoardDto content(String bid);
    int insert(BoardDto boardDto);
    int update(BoardDto boardDto);
    String getOldFile(String bid);
    int delete(String bid);
}
