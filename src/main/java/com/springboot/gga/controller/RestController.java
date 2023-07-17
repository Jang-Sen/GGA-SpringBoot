package com.springboot.gga.controller;

import com.springboot.gga.dto.*;
import com.springboot.gga.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@org.springframework.web.bind.annotation.RestController
public class RestController {
    @Autowired
    BoardService boardService;
    @Autowired
    NoticeService noticeService;
    @Autowired
    PageService pageService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private CouponService couponService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductOrderService productOrderService;
    @Autowired
    private CartService cartService;

    @Autowired
    OrderService orderService;
    @GetMapping("orderconProc/{impuid}/{merchantuid}/{pgtype}/{oid}")
    public String orderconProc(@PathVariable String impuid, @PathVariable String merchantuid, @PathVariable String pgtype,@PathVariable String oid){
        OrderDto orderDto = orderService.select(oid);

        int result =  orderService.insertocon(impuid, merchantuid, pgtype,orderDto);
        return String.valueOf(result);
    }

    @GetMapping("seatProc/{seat}/{price}/{oid}")
    public String seatProc(@PathVariable String seat, @PathVariable String price, @PathVariable String oid) {
        int realresult = 0;
        int result = 1;
        SeatDto seatDto = new SeatDto();
        String[] seatList = seat.split(",");
        for (String seatNumber : seatList) {
            seatDto = orderService.searchSeat(seatNumber);
            if (!"seat".equals(seatDto.getStatus())) {
                result = 0;
                break;
            }
        }
        if (result == 1) {
            orderService.insertpriceseat(seat, price, oid);
            realresult = 1;
        } else {
            System.out.println("ordercontroller  좌석 불가능함");
            realresult = 0;
        }
        return String.valueOf(realresult);

    }

    @GetMapping("board_list/{page}")
    public Map board_list(@PathVariable String page){
        Map map = new HashMap();
        PageDto pageDto = pageService.getPaging(new PageDto(page, "board"));
        List<BoardDto> list = boardService.list(pageDto);

        map.put("list", list);
        map.put("page", pageDto);

        return map;
    }

    @GetMapping("notice_list/{page}")
    public Map notice_list(@PathVariable String page){
        Map map = new HashMap();
        PageDto pageDto = pageService.getPaging(new PageDto(page, "notice"));
        List<NoticeDto> list = noticeService.list(pageDto);

        map.put("list", list);
        map.put("page", pageDto);

        return map;
    }

    @GetMapping("admin_notice_list/{page}")
    public Map admin_notice_list(@PathVariable String page){
        Map map = new HashMap();
        PageDto pageDto = pageService.getPaging(new PageDto(page, "admin_notice"));
        List<NoticeDto> list = noticeService.list(pageDto);

        map.put("list", list);
        map.put("page", pageDto);

        return map;
    }

    @GetMapping("idCheckProc/{id}")
    public String idCheck(@PathVariable String id) {
        return String.valueOf(memberService.idCheck(id));
    }

    @GetMapping("productSearch/{searchType}/{searchInput}")
    public List<ProductDto> productSearch(@PathVariable String searchType,
                                          @PathVariable String searchInput
    ){
        Map param = new HashMap<>();
        param.put("searchType", searchType);
        param.put("searchInput", searchInput);
        List<ProductDto> list = productService.searchList(param);
        return list;
    }

    @GetMapping("coupon_update/{id}/{couponid}")
    public String coupon_update(@PathVariable String id,
                                @PathVariable String couponid) {
        Map param = new HashMap<>();
        param.put("id", id);
        param.put("couponid", couponid);
        return String.valueOf(couponService.updateAdd(param));
    }

    @GetMapping("coupon_updateCancel/{id}/{couponid}")
    public String coupon_updateCancel(@PathVariable String id,
                                      @PathVariable String couponid) {
        Map param = new HashMap<>();
        param.put("id", id);
        param.put("couponid", couponid);
        return String.valueOf(couponService.updateCancel(param));
    }

    @PostMapping("product_order")
    public String product_order(@RequestParam String pid,
                                @RequestParam String couponid,
                                @RequestParam String finalAmount,
                                @RequestParam String couponName,
                                HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");

        String orderNumber = generateOrderNumber();

        Map param = new HashMap<>();

        param.put("poid", orderNumber);
        param.put("pid", pid);
        param.put("couponid", couponid);
        param.put("couponname", couponName);
        param.put("finalAmount", finalAmount);
        param.put("id", svo.getId());
        productOrderService.insertOne(param);
        return orderNumber;
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


    @GetMapping("cart_insert/{pid}")
    public String cart_insert(@PathVariable String pid, HttpSession session) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        Map param = new HashMap<>();
        param.put("id", svo.getId());
        param.put("pid", pid);
        return String.valueOf(cartService.insert(param));
    }

}
