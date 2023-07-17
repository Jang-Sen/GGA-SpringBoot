package com.springboot.gga.service;

import com.springboot.gga.dto.BoardDto;
import com.springboot.gga.dto.PageDto;
import com.springboot.gga.repository.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardMapper boardMapper;

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

    public String getOldFile(String bid){
        return boardMapper.getOldFile(bid);
    }

    public int delete(String bid){
        return boardMapper.delete(bid);
    }

}
