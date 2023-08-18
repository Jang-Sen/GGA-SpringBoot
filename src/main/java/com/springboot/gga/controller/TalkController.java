package com.springboot.gga.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TalkController {

    @GetMapping("order.do")
    public String talkOrder(){
        return "/order/order";
    }

    @GetMapping("movie_menu.do")
    public String talkMovie_menu(){
        return "/movie/movie_menu";
    }


    @GetMapping("coronation.do")
    public String talkCoronation(){
        return "/coronation/coronation";
    }

    @GetMapping("index.do")
    public String talkIndex(){
        return "index";
    }

}
