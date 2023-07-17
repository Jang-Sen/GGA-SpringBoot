package com.springboot.gga.controller;

import com.springboot.gga.dto.CouponDto;
import com.springboot.gga.dto.ProductDto;
import com.springboot.gga.dto.ProductOrderDto;
import com.springboot.gga.dto.SessionDto;
import com.springboot.gga.service.CouponService;
import com.springboot.gga.service.ProductOrderService;
import com.springboot.gga.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductOrderController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CouponService couponService;

    @Autowired
    private ProductOrderService productOrderService;

    @GetMapping("productordercon/{orderNumber}")
        public String productordercon(@PathVariable String orderNumber, Model model, HttpSession session) {
        ProductOrderDto productOrderDto = productOrderService.selectOne(orderNumber);
        model.addAttribute("productOrderDto", productOrderDto);




        SessionDto svo = (SessionDto) session.getAttribute("svo");
        List<ProductOrderDto> list = productOrderService.myList(svo.getId());

        model.addAttribute("list", list);

        return "productorder/productordercon";
    }

    @GetMapping("product_order/{pid}")
    public String product_order(@PathVariable String pid, Model model,
                                HttpSession session){
        SessionDto svo = (SessionDto) session.getAttribute("svo");

        String used = "0";
        Map param = new HashMap<>();
        param.put("used", used);
        param.put("id", svo.getId());
        List<CouponDto> couponList = couponService.list(param);

        ProductDto productDto = productService.content(pid);

        session.setAttribute("svo", svo);
        model.addAttribute("couponList", couponList);
        model.addAttribute("productDto", productDto);
        return "productorder/product_order";
    }

}
