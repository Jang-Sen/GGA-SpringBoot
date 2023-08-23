package com.springboot.gga.controller;

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
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class MovieController {
    @Autowired
    MovieService movieService;
    @Autowired
    PageService pageService;

    @Autowired
    FileService fileService;


    @PostMapping("movie_delete")
    public String movie_delete_proc(MovieDto movieDto) throws Exception {
        ArrayList<String> gsfiles = movieDto.getGsfiles();
        String smainposter = movieDto.getSmainposter();
        String sstillcut1 = movieDto.getSstillcut1();
        String sstillcut2 = movieDto.getSstillcut2();
        String sstillcut3 = movieDto.getSstillcut3();
        String sstillcut4 = movieDto.getSstillcut4();


        if(movieService.getMovieDelete(movieDto.getMovieid()) == 1) {
            if(!gsfiles.equals("")){
                fileService.multiFileDelete(gsfiles);
                fileService.fileDelete(smainposter);
                fileService.fileDelete(sstillcut1);
                fileService.fileDelete(sstillcut2);
                fileService.fileDelete(sstillcut3);
                fileService.fileDelete(sstillcut4);
            }
        }
        return "redirect:/admin_movie_list/1";
    }
    @PostMapping("movie_update")
    public String movie_update_proc(MovieDto movieDto) throws Exception {
        String smainposter = movieDto.getSmainposter();
        String sstillcut1 = movieDto.getSstillcut1();
        String sstillcut2 = movieDto.getSstillcut2();
        String sstillcut3 = movieDto.getSstillcut3();
        String sstillcut4 = movieDto.getSstillcut4();

        movieDto = fileService.multiFileCheck(movieDto);

        if(movieService.getMovieUpdate(movieDto) == 1) {
                fileService.multiFileSave(movieDto);
                fileService.fileDelete(smainposter);
                fileService.fileDelete(sstillcut1);
                fileService.fileDelete(sstillcut2);
                fileService.fileDelete(sstillcut3);
                fileService.fileDelete(sstillcut4);
        }
        return "redirect:/admin_movie_content/"+movieDto.getMovieid();
    }

    @GetMapping("admin_movie_update/{movieid}")
    public String movie_update(@PathVariable String movieid, Model model){
        MovieDto movieDto = movieService.getMovieSelect(movieid);
        model.addAttribute("movieDto", movieDto);
        return "/admin/moviemanager/admin_movie_update";
    }
    @PostMapping("movie_register")
    public String movie_register_proc(MovieDto movieDto) throws Exception{
        movieDto = fileService.multiFileCheck(movieDto);
        if(movieService.getMovieInsert(movieDto) == 1){
            fileService.multiFileSave(movieDto);
        }

        return "redirect:/admin_movie_list/1";
    }


    @GetMapping("admin_movie_register")
    public String movie_register(){

        return "/admin/moviemanager/admin_movie_register";
    }

    @GetMapping("admin_movie_content/{movieid}")
    public String movie_content(@PathVariable String movieid, Model model){
        MovieDto movieDto = movieService.getMovieSelect(movieid);
        model.addAttribute("movie", movieDto);
        return "/admin/moviemanager/admin_movie_content";
    }
    @GetMapping("admin_movie_list/{page}")
    public String movie_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPaging(new PageDto(page, "movie"));
        model.addAttribute("movieList", movieService.list(pageDto));
        model.addAttribute("page", pageDto);
        return "/admin/moviemanager/admin_movie_list";
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
