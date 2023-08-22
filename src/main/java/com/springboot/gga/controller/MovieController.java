package com.springboot.gga.controller;

import com.springboot.gga.dto.BoardDto;
import com.springboot.gga.dto.MovieDto;
import com.springboot.gga.dto.PageDto;
import com.springboot.gga.dto.SessionDto;
import com.springboot.gga.service.FileService;
import com.springboot.gga.service.MovieService;
import com.springboot.gga.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MovieController {
    @Autowired
    MovieService movieService;

    @Autowired
    PageService pageService;

    @Autowired
    FileService fileService;


    @GetMapping("movie_delete")
    public String movie_delete_proc(@PathVariable String movieid){
        int result = movieService.getMovieDelete(movieid);
        if(result == 1) {

        }
         return "redirect:/movie_list";
    }
    @GetMapping("movie_update")
    public String movie_update_proc(MovieDto movieDto){
        int result = movieService.getMovieUpdate(movieDto);
        if(result == 1) {

        }
        return "redirect:/movie_list";
    }

    /***
     *영화 정보 등록
     */
//    @GetMapping("movie_register")
//    public String movie_register_proc(MovieDto movieDto, HttpServletRequest request) throws Exception{
//        int result = movieService.getMovieInsert(fileService.multiFileCheck(movieDto));
//
//        if(result == 1) {
//            if(!movieDto.getFiles()[0].getOriginalFilename().equals("")) {
//                fileService.multiFileCheck(movieDto, request);
//            }
//        }
//        return "redirect:/movie_list";
//    }


    @GetMapping("movie_register")
    public String movie_register(){

        return "/admin/moviemanager/movie_register";
    }

    @GetMapping("movie_content/{movieid}")
    public String movie_content(@PathVariable String movieid, Model model){
        MovieDto movieDto = movieService.getMovieSelect(movieid);
        model.addAttribute("movie", movieDto);

        return "/admin/moviemanager/movie_content";
    }

    @GetMapping("movie_list/{page}")
    public String movie_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPaging(new PageDto(page, "movie"));
        model.addAttribute("movieList", movieService.list(pageDto));
        model.addAttribute("page", pageDto);

        return "/admin/moviemanager/movie_list";
    }

    @GetMapping("movie_menu")
    public String movie_menu(){

        return "/movie/movie_menu";
    }

    @GetMapping("commingsoon")
    public String commingsoon(){
        return "/movie/commingsoon";
    }

    @GetMapping("movieinfo/{movieid}")
    public String movieinfo(@PathVariable String movieid, Model model){
        MovieDto movieDto = movieService.getMovieSelect(movieid);
        model.addAttribute("movie", movieDto);

        return "/movie/movieinfo";
    }

    @GetMapping("movie_menu/{id}")
    public String moive_menu(@PathVariable String id, HttpSession session) {
        SessionDto svo = new SessionDto();
        svo.setId(id);
        session.setAttribute("svo",svo);
        return "/movie/movie_menu";
    }


}
