package com.springboot.gga.controller;

import com.springboot.gga.dto.*;
import com.springboot.gga.service.CartService;
import com.springboot.gga.service.CouponService;
import com.springboot.gga.service.ProductOrderService;
import com.springboot.gga.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ProductOrderController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CouponService couponService;

    @Autowired
    private ProductOrderService productOrderService;
    @Autowired
    private CartService cartService;

    @GetMapping("productorderlist/{cidArray}")
    public String productorderlist(@PathVariable String[] cidArray,
                                   CartDto cartDto, HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        String used = "0";
        Map param = new HashMap<>();
        param.put("used", used);
        param.put("id", svo.getId());
        param.put("ccategory", "product");
        List<CouponDto> couponList = couponService.list(param);

//        List<CartDto> list = cartService.contentList();
        List<CartDto> list = cartService.list(svo.getId());
        model.addAttribute("cidArray", cidArray);
        model.addAttribute("couponList", couponList);
        model.addAttribute("list", list);
        return "productorder/productorderlist";
    }

    private static String generateOrderNumber() {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String dateStr = dateFormat.format(currentDate);

        // 6자리 랜덤 숫자 생성
        Random random = new Random();
        int randomNumber = random.nextInt(900000) + 100000;
        String randomStr = String.valueOf(randomNumber);

        // 주문 번호 생성
        String orderNumber = dateStr + randomStr;

        return orderNumber;
    }

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
        param.put("ccategory", "product");
        List<CouponDto> couponList = couponService.list(param);

        ProductDto productDto = productService.content(pid);

        session.setAttribute("svo", svo);
        model.addAttribute("couponList", couponList);
        model.addAttribute("productDto", productDto);
        return "productorder/product_order";
    }

    //@PostMapping("productorderconlist")
    public String productorderconlist(ProductOrderDto productOrderDto){
        for (String s : productOrderDto.getCidArray()) {
            System.out.println("s = " + s);
        }
        for (String c : productOrderDto.getCouponidArray()) {
            System.out.println("c = " + c);
        }
        return "index";
    }

    @GetMapping("productorderconlist/{orderNumber}")
    public String productorderconlist(@PathVariable("orderNumber") String poid,
                                      Model model, HttpSession session) {
        List<ProductOrderDto> productOrderDto = productOrderService.selectList(poid);

        SessionDto svo = (SessionDto) session.getAttribute("svo");
        List<ProductOrderDto> list = productOrderService.myList(svo.getId());

        model.addAttribute("productOrderDto", productOrderDto);
        model.addAttribute("list", list);

        return "productorder/productorderconlist";
    }

}
