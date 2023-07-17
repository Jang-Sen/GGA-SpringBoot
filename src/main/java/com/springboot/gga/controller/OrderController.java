package com.springboot.gga.controller;

import com.springboot.gga.dto.OrderDto;
import com.springboot.gga.dto.OrderconDto;
import com.springboot.gga.dto.SeatDto;
import com.springboot.gga.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;




    @GetMapping("/ordercon/{merchantuid}")
    public String ordercon(@PathVariable String merchantuid, Model model){
        OrderconDto orderconDto = new OrderconDto();
        orderconDto = orderService.selectOrderconuid(merchantuid);
        //System.out.println("merchantuid 중간확인"+orderconDto.getMerchantuid());
        //System.out.println("merchantuid 중간확인"+orderconDto.getSeat());

        String seat = orderconDto.getSeat();
        //System.out.println("seat중간확인"+seat);

        String[] seatList = seat.split(",");
        //System.out.println("seatList[0]"+seatList[0]);

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
