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
    @Autowired
    SearchService searchService;

    // 로그인 계정 체크
    @GetMapping("loginCheck/{id}/{pass}")
    public String loginCheck(@PathVariable String id,@PathVariable String pass){
        Map<String,String> param = new HashMap<String,String>();
        param.put("id",id);
        param.put("pass",pass);
        return memberService.loginCheck(param);
    }

    // 비밀번호 찾기 진행
    @GetMapping("login_pwFind_proc/{id}/{name}/{birth}/{phone}")
    public String login_pwFind_proc(@PathVariable String id, @PathVariable String name,
                                    @PathVariable String birth, @PathVariable String phone, Model model){
        Map<String, String> param = new HashMap<String, String>();
        param.put("id", id);
        param.put("name", name);
        param.put("birth", birth);
        param.put("phone", phone);
        return memberService.findPw(param);
    }
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
//    @GetMapping("orderconProc/{impuid}/{merchantuid}/{pgtype}/{oid}")
//    public String orderconProc(@PathVariable String impuid, @PathVariable String merchantuid, @PathVariable String pgtype,@PathVariable String oid) {
        @PostMapping("orderconProc")
        public void orderconProc (@RequestParam String oid,
                @RequestParam String couponid,
                @RequestParam String finalAmount,
                @RequestParam String couponName,
                @RequestParam String impuid,
                @RequestParam String merchantuid,
                @RequestParam String paymethodcon){


            OrderDto orderDto = orderService.select(oid);

            orderService.insertocon(impuid, merchantuid, paymethodcon, orderDto, couponid, finalAmount, couponName);

        }
//    }
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
        param.put("ccategory","product");
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


    @GetMapping("cart_delete/{pid}")
    public String cart_delete(@PathVariable String pid, HttpSession session) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        Map param = new HashMap<>();
        param.put("id", svo.getId());
        param.put("pid", pid);
        return String.valueOf(cartService.deleteOne(param));
    }

    @GetMapping("search_cart/{pid}")
    public String search_cart(@PathVariable String pid, HttpSession session) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        Map param = new HashMap<>();
        param.put("id", svo.getId());
        param.put("pid", pid);
        return String.valueOf(cartService.searchCart(param));
    }

    @GetMapping("cart_update/{qty}/{pid}")
    public String cart_update(@PathVariable String qty,
                              @PathVariable String pid,
                              HttpSession session) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");

        Map param = new HashMap<>();
        param.put("qty", qty);
        param.put("pid", pid);
        param.put("id", svo.getId());

        return String.valueOf(cartService.update(param));
    }

    @PostMapping("/productorderlist")
    public String productorderlist(ProductOrderDto productOrderDto, HttpSession session) {
        String[] cidArray = productOrderDto.getCidArray().toArray(new String[0]);
        String[] couponidArray = productOrderDto.getCouponidArray().toArray(new String[0]);
        String[] qtyArray = productOrderDto.getQtyArray().toArray(new String[0]);
        String[] pidArray = productOrderDto.getPidArray().toArray(new String[0]);

        SessionDto svo = (SessionDto) session.getAttribute("svo");
        String orderNumber = generateOrderNumber();


        List<Map<String, Object>> paramList = new ArrayList<>();
        for (int i = 0; i < cidArray.length; i++) {
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("cid", cidArray[i]);
            paramMap.put("couponid", couponidArray[i]);
            paramMap.put("qty", qtyArray[i]);
            paramMap.put("pid", pidArray[i]);
            paramMap.put("id", svo.getId());
            paramMap.put("poid", orderNumber);
            paramList.add(paramMap);
        }

        int insertResult = productOrderService.insertList(paramList); //결제 완료

        if (!couponidAllElementsEmpty(couponidArray)) {
            int updateResult = couponService.updateListAdd(couponidArray); // 쿠폰 사용 업데이트
        } else {
        }
        int deleteResult = cartService.deleteList(cidArray); // 장바구니 삭제
        return orderNumber;
    }

    private boolean couponidAllElementsEmpty(String[] couponidArray) {
        for (String element : couponidArray) {
            if (!element.isEmpty()) {
                return false;
            }
        }
        return true;
    }

    @GetMapping("product_date_search/{startDate}/{endDate}")
    public List<ProductOrderDto> product_date_search(@PathVariable String startDate,
                                                     @PathVariable String endDate,
                                                     HttpSession session) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        Map param = new HashMap<>();
        param.put("id", svo.getId());
        param.put("startDate", startDate);
        param.put("endDate", endDate);
        List<ProductOrderDto> list = productOrderService.searchDateList(param);
        return list;
    }

    @GetMapping("indexSearch_json_data/{firstSearch}")
    public Map<String, List<IndexSearchDto>> indexSearch_json_data(@PathVariable String firstSearch, Model model){
//        model.addAttribute("firstSearch", firstSearch);
        Map<String, List<IndexSearchDto>> param = new HashMap<String, List<IndexSearchDto>>();
        param.put("mlist",searchService.movieSearch(firstSearch));
        param.put("nlist",searchService.noticeSearch(firstSearch));
        param.put("blist",searchService.boardSearch(firstSearch));
        param.put("plist",searchService.productSearch(firstSearch));
//        System.out.println(firstSearch);
//        System.out.println(param);
        return param;
//        return searchService.movieSearch(firstSearch);
    }

    /* 마이페이지 My리뷰 */
    @GetMapping("board_master_json_data/{id}/{page}")
    public Map board_master_json_data(@PathVariable String id, @PathVariable String page){
//        pageDto.setPage(page); 스타트 카운트 엔드카운트 해결해야함
        PageDto pageDto = pageService.getPaging(new PageDto(page, "boardMaster",id));
        Map param = new HashMap();
        param.put("id",id);
        param.put("startCount", pageDto.getStartCount());
        param.put("endCount", pageDto.getEndCount());
//        System.out.println(param);
        Map result = new HashMap();
        result.put("BoardDto",boardService.boardCommentMaster(param));
        result.put("page",pageDto);

        System.out.println(result);
        return result;
    }

}
