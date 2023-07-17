package com.springboot.gga.service;

import com.springboot.gga.dto.MovieDto;
import com.springboot.gga.dto.PageDto;
import com.springboot.gga.repository.MovieMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieService {
    @Autowired
    MovieMapper movieMapper;

    public List<MovieDto> list(PageDto pageDto){
        return movieMapper.list(pageDto);
    }

    public MovieDto getMovieSelect(String movieid){
        return movieMapper.mselect(movieid);
    }


}
