package com.springboot.gga.controller;

import com.springboot.gga.dto.*;
import com.springboot.gga.service.CouponService;
import com.springboot.gga.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private CouponService couponService;




    @GetMapping("/ordercon/{merchantuid}")
    public String ordercon(@PathVariable String merchantuid, Model model){
        OrderconDto orderconDto = new OrderconDto();
        orderconDto = orderService.selectOrderconuid(merchantuid);

        String seat = orderconDto.getSeat();
        String[] seatList = seat.split(",");

        int result = 1;
        for(String seatNumber : seatList) {
           result = orderService.updateseatstatus(seatNumber);
            if (result == 0) {
                break;
            }
        }
        if(result == 0){
            System.out.println("오류가 발생했습니다.");
        }else if(result==1){
            System.out.println("정상적으로 업데이트 됐습니다.");
        }
        model.addAttribute("orderconDto",orderconDto);
        return "/order/ordercon";
    }

    @GetMapping("seat")
    public String seat(){
        return "/order/seat";
    }

    @GetMapping("order_pay/{oid}")
    public String order_pay(@PathVariable String oid, Model model, HttpSession session){
        OrderDto orderDto = new OrderDto();
        orderDto = orderService.select(oid);
        String id = orderDto.getId();
        model.addAttribute("orderDto",orderDto);

        SessionDto svo = (SessionDto) session.getAttribute("svo");

        String used = "0";
        Map param = new HashMap<>();
        param.put("used", used);
        param.put("id", svo.getId());
        param.put("ccategory","movie");
        List<CouponDto> couponList = couponService.list(param);

        ArrayList<OrderconDto> orderconDto = orderService.selectOrderconMypage(id);
        if (orderconDto.isEmpty()){
            Map param2 = new HashMap<>();
            param2.put("used", used);
            param2.put("id", svo.getId());
            param2.put("ccategory","moviefirst");
            List<CouponDto> couponList2 = couponService.list(param2);

            couponList.addAll(couponList2);
        }

        session.setAttribute("svo", svo);
        model.addAttribute("couponList", couponList);
        model.addAttribute("userid", svo.getId());

        return "/order/order_pay";
    }


    @PostMapping("orderProc")
    public String orderProc(OrderDto orderDto, Model model){
        int result = orderService.insertOrderDto(orderDto);
        ArrayList<SeatDto> list = new ArrayList<SeatDto>();
        list = orderService.seatlist();
        String oid = orderDto.getOid();
        if( result == 1){
            model.addAttribute("list",list);
            model.addAttribute("oid",oid);

        }
        return "/order/seat";
    }
 /*   @GetMapping("order/{oid}/")
    public String order(@PathVariable String oid, Model model){

        return "/order/order";
    }*/

    @GetMapping("order")
    public String order(Model model){
       String oid = orderService.getOid();
        model.addAttribute("oid",oid);
        return "/order/order";
    }

   /* @GetMapping("oidProc")
    public String oidProc(){
        return  orderService.getOid();
    }*/




}
