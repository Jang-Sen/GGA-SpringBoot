package com.springboot.gga.repository;

import com.springboot.gga.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PageMapper {
    int totalPaging(PageDto pageDto);
}
