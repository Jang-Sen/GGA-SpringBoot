package com.springboot.gga.repository;

import com.springboot.gga.dto.NoticeDto;
import com.springboot.gga.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<NoticeDto> list(PageDto pageDto);
    NoticeDto content(String nid);
    int insert(NoticeDto noticeDto);
    int update(NoticeDto noticeDto);
    int delete(String nid);
    List<NoticeDto> notice_search(PageDto pageDto);
    void updateHits(String nid);
}
