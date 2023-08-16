package com.springboot.gga.controller;

import com.springboot.gga.dto.IndexSearchDto;
import com.springboot.gga.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;

@Controller
public class SearchController {
    @Autowired
    SearchService searchService;

    @GetMapping("indexSearch/{firstSearch}")
    public String indexSearch(@PathVariable String firstSearch,Model model){
        model.addAttribute("firstSearch",firstSearch);
        return "indexSearch";
    }


}
