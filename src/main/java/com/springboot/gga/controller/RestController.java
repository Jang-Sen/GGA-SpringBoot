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

    // 아이디 찾기 진행

    @GetMapping("login_idFind_proc/{name}/{birth}/{phone}")
    public String login_idFind_proc(@PathVariable String name,@PathVariable String birth, @PathVariable String phone){
        Map<String,String> param = new HashMap<String,String>();
        param.put("name", name);
        param.put("birth", birth);
        param.put("phone", phone);
        return memberService.findId(param);
    }
    //마이페이지 정보수정 접근 전 본인 확인

    @GetMapping("mypage_passCheck/{modalPass}/{modalName}")
    public String mypage_passCheck(@PathVariable String modalPass,@PathVariable String modalName) {
        MemberDto memberDto = new MemberDto();
        memberDto.setName(modalName);
        memberDto.setPass(modalPass);
        String result = memberService.passCheck(memberDto);
        return result;
    }
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

    /**
     * Board
     */
    @GetMapping("board_list/{page}")
    public Map board_list(@PathVariable String page){
        Map map = new HashMap();
        PageDto pageDto = pageService.getPaging(new PageDto(page, "board"));
        List<BoardDto> list = boardService.list(pageDto);

        map.put("list", list);
        map.put("page", pageDto);

        return map;
    }

    @GetMapping("board_comment_delete/{bcid}")
    public String board_comment_delete(@PathVariable String bcid){
        String viewName = "";
        String bid = boardService.commentSelect(bcid);
        int result = boardService.commentDelete(bcid);

        if (result == 1){
            viewName = bid;
        }

        return viewName;
    }

    @GetMapping("board_comment_update/{bcid}/{updateComment}")
    public String board_comment_update(@PathVariable String bcid, @PathVariable String updateComment){
        Map map = new HashMap();
        String viewName = "";
        String bid = boardService.commentSelect(bcid);
        int result = boardService.commentUpdate(bcid, updateComment);

        if (result == 1){
            viewName = bid;
        }

        map.put("bcid", bcid);
        map.put("updateComment", updateComment);
        return viewName;
    }

    /**
     * Notice
     */
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
