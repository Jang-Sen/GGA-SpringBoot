package com.springboot.gga.service;

import com.springboot.gga.dto.IndexSearchDto;
import com.springboot.gga.repository.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SearchService {
    @Autowired
    private SearchMapper searchMapper;

    public List<IndexSearchDto> movieSearch(String searchContent) {
        return searchMapper.movieSearch(searchContent);
    }
    public ArrayList<IndexSearchDto> noticeSearch(String searchContent) {
        return searchMapper.noticeSearch(searchContent);
    }
    public ArrayList<IndexSearchDto> boardSearch(String searchContent) {
        return searchMapper.boardSearch(searchContent);
    }
    public ArrayList<IndexSearchDto> productSearch(String searchContent) {
        return searchMapper.productSearch(searchContent);
    }


}
