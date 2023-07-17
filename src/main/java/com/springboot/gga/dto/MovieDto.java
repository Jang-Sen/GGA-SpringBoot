package com.springboot.gga.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

@Data
public class MovieDto {
    String movieid, movietitle, genre, moviedday, runtime, audience, movieinfo,
            director, actor, mainposter, stillcut1, stillcut2, stillcut3, stillcut4, youtube
            , smainposter, sstillcut1, sstillcut2, sstillcut3, sstillcut4;
    int rno;
    MultipartFile[] files;
    ArrayList<String> gfiles = new ArrayList<String>();
    ArrayList<String> gsfiles = new ArrayList<String>();
}
