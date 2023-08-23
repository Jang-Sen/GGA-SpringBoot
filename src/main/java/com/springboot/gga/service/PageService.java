package com.springboot.gga.service;

import com.springboot.gga.dto.PageDto;
import com.springboot.gga.repository.BoardMapper;
import com.springboot.gga.repository.PageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageService {
    @Autowired
    private PageMapper pageMapper;
    @Autowired
    private BoardMapper boardMapper;

    public PageDto getPaging(PageDto pageDto){
        // 페이징 처리 - startCount, endCount 구하기
        int startCount = 0;
        int endCount = 0;
        int pageSize = 0;	// 한페이지당 게시물 수
        int reqPage = 1;	// 요청페이지
        int pageCount = 1;	// 전체 페이지 수
        int dbCount = 0;	// DB에서 가져온 전체 행수

        if (pageDto.getServiceName().equals("boardComment")) {
            dbCount = boardMapper.commentCount(pageDto.getBid());
        } else {
            dbCount = pageMapper.totalPaging(pageDto);
        }

//        dbCount = pageMapper.totalPaging(pageDto);

//        System.out.println(pageDto.getBid());

        if (pageDto.getServiceName().equals("notice")) {
            pageSize = 10;
        } else if (pageDto.getServiceName().equals("notice_search")) {
            pageSize = 10;
        } else if (pageDto.getServiceName().equals("member")) {
            pageSize = 5;
        } else if (pageDto.getServiceName().equals("board")) {
            pageSize = 10;
        } else if (pageDto.getServiceName().equals("boardComment")) {
            pageSize = 5;
        } else if (pageDto.getServiceName().equals("boardSearch")) {
            pageSize = 10;
        } else if (pageDto.getServiceName().equals("myReview")) {
            pageSize = 3;
        } else if (pageDto.getServiceName().equals("product")){
            pageSize = 5;
        } else if (pageDto.getServiceName().equals("movie")){
            pageSize = 7;
        } else if (pageDto.getServiceName().equals("admin_notice")){
            pageSize = 10;
        } else if (pageDto.getServiceName().equals("boardMaster")) {
            pageSize = 5;
        }

        // 총 페이지 수 계산
        if(dbCount % pageSize == 0){
            pageCount = dbCount/pageSize;
        }else{
            pageCount = dbCount/pageSize+1;
        }

        // 요청 페이지 계산
        if(pageDto.getPage() != null){
            reqPage = Integer.parseInt(pageDto.getPage());
            startCount = (reqPage - 1) * pageSize + 1;
            endCount = reqPage * pageSize;
        }else{
            startCount = 1;
            endCount = pageSize;
        }

        // pageDto 객체에 데이터 put
        pageDto.setStartCount(startCount);
        pageDto.setEndCount(endCount);
        pageDto.setDbCount(dbCount);
        pageDto.setPageSize(pageSize);
        pageDto.setPageCount(pageCount);
        pageDto.setReqPage(reqPage);

        return pageDto;
    }
}
