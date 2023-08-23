package com.springboot.gga.service;

import com.springboot.gga.dto.OrderDto;
import com.springboot.gga.dto.OrderConDto;
import com.springboot.gga.dto.SeatDto;
import com.springboot.gga.repository.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class OrderService {

    @Autowired
    private OrderMapper orderMapper;

    public void getSeatPrice(String seat, String price, String oid) {

        orderMapper.getSeatPrice(seat, price, oid);
    }


   public OrderConDto selectOrderConList(String oconid) {
        return orderMapper.selectOrderConList(oconid);
    };

    public void deleteOrderCon(String oconid) {
        orderMapper.deleteOrderCon(oconid);
    }
    public int resetSeat(String seat) {
        return orderMapper.resetSeat(seat);

    }
    public int updateSeatStatus(String seatNumber) {

        return orderMapper.updateSeatStatus(seatNumber);
    }


    public int insertOrderDto(OrderDto orderDto) {
        return orderMapper.insertOrderDto(orderDto);
    }
    public String getOid() {
        return orderMapper.getOid();
    }
    public OrderDto select(String oid) {
        return orderMapper.select(oid);
    }
/*    public ArrayList<OrderConDto> selectOrderCon(){
        return orderMapper.selectOrderCon();
    };*/

    public ArrayList<OrderConDto> selectOrderConMyPage(String id){
        return (ArrayList<OrderConDto>) orderMapper.selectOrderConMyPage(id);
    };

    public OrderConDto selectOrderConUid(String merchantuid) {
        return orderMapper.selectOrderConUid(merchantuid);
    };

    public int insertOcon(String impuid, String merchantuid, String pgtype, OrderDto orderDto, String couponid, String finalAmount, String couponName) {

        OrderConDto orderConDto = new OrderConDto();
        orderConDto.setImpuid(impuid);
        orderConDto.setMovieid(orderDto.getMovieid());
        orderConDto.setOcarnum(orderDto.getOcarnum());
        orderConDto.setOdate(orderDto.getOdate());
        orderConDto.setMovieorderposter(orderDto.getMovieorderposter());
        orderConDto.setOphone(orderDto.getOphone());
        orderConDto.setMovieordertitle(orderDto.getMovieordertitle());
        orderConDto.setOname(orderDto.getOname());
        orderConDto.setPrice(orderDto.getPrice());
        orderConDto.setPgtype(pgtype);
        orderConDto.setSeat(orderDto.getSeat());
        orderConDto.setOtime(orderDto.getOtime());
        orderConDto.setOrderdate(orderDto.getOrderdate());
        orderConDto.setOemail(orderDto.getOemail());
        orderConDto.setMerchantuid(merchantuid);
        orderConDto.setId(orderDto.getId());
        orderConDto.setCouponid(couponid);
        orderConDto.setFinalAmount(finalAmount);
        orderConDto.setCouponName(couponName);

        return orderMapper.insertOcon(orderConDto);
    }
    public SeatDto searchSeat(String seat) {
        return orderMapper.searchSeat(seat);
    }
    public ArrayList<SeatDto> seatList(){
        return orderMapper.seatList();
    }

    public int insertPriceSeat(String seat, String price, String oid){
        OrderDto orderDto = new OrderDto();
        orderDto.setSeat(seat);
        orderDto.setPrice(Integer.parseInt(price));
        orderDto.setOid(oid);

        return orderMapper.insertPriceSeat(orderDto);
    }
}
