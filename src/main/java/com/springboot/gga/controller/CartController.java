package com.springboot.gga.controller;

import com.springboot.gga.dto.CartDto;
import com.springboot.gga.dto.SessionDto;
import com.springboot.gga.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;


    @GetMapping("/cartModal")
    public String cartModal(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        List<CartDto> list = cartService.list(svo.getId());
        model.addAttribute("list", list);
        return "store/cartModal";
    }
}
