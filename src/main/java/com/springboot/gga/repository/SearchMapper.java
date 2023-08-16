package com.springboot.gga.repository;

import com.springboot.gga.dto.IndexSearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface SearchMapper {
    List<IndexSearchDto> movieSearch(String searchContent);
    ArrayList<IndexSearchDto> noticeSearch(String searchContent);
    ArrayList<IndexSearchDto> boardSearch(String searchContent);
    ArrayList<IndexSearchDto> productSearch(String searchContent);
}
