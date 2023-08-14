package com.springboot.gga.service;

import com.springboot.gga.dto.NoticeDto;
import com.springboot.gga.dto.PageDto;
import com.springboot.gga.repository.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    public List<NoticeDto> list(PageDto pageDto){
        return noticeMapper.list(pageDto);
    }

    public NoticeDto content(String nid){
        if (noticeMapper.content(nid) != null){
            noticeMapper.updateHits(nid);
        }
        return noticeMapper.content(nid);
    }

    public int insert(NoticeDto noticeDto){
        return noticeMapper.insert(noticeDto);
    }

    public int update(NoticeDto noticeDto){
        return noticeMapper.update(noticeDto);
    }

    public int delete(String nid){
        return noticeMapper.delete(nid);
    }

    public List<NoticeDto> notice_search(PageDto pageDto){
        return noticeMapper.notice_search(pageDto);
    }
}
