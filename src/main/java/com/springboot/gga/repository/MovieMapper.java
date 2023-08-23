package com.springboot.gga.repository;

import com.springboot.gga.dto.MovieDto;
import com.springboot.gga.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MovieMapper {

    int delete(String movieid);
    int update(MovieDto movieDto);
    int insert(MovieDto movieDto);
    MovieDto mselect(String movieid);
    List<MovieDto> list(PageDto pageDto);

}
