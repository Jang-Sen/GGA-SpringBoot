package com.springboot.gga.service;

import com.springboot.gga.dto.OrderDto;
import com.springboot.gga.dto.OrderconDto;
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


   public OrderconDto selectOrderconlist(String oconid) {
        return orderMapper.selectOrderconlist(oconid);
    };

    public void deleteOrdercon(String oconid) {
        orderMapper.deleteOrdercon(oconid);
    }
    public int resetSeat(String seat) {
        return orderMapper.resetSeat(seat);

    }
    public int updateseatstatus(String seatNumber) {

        return orderMapper.updateseatstatus(seatNumber);
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
/*    public ArrayList<OrderconDto> selectOrdercon(){
        return orderMapper.selectOrdercon();
    };*/

    public ArrayList<OrderconDto> selectOrderconMypage(String id){
        return (ArrayList<OrderconDto>) orderMapper.selectOrderconMypage(id);
    };

    public OrderconDto selectOrderconuid(String merchantuid) {
        return orderMapper.selectOrderconuid(merchantuid);
    };

    public int insertocon(String impuid, String merchantuid, String pgtype, OrderDto orderDto, String couponid, String finalAmount, String couponName) {

        OrderconDto orderconDto = new OrderconDto();
        orderconDto.setImpuid(impuid);
        orderconDto.setMovieid(orderDto.getMovieid());
        orderconDto.setOcarnum(orderDto.getOcarnum());
        orderconDto.setOdate(orderDto.getOdate());
        orderconDto.setMovieorderposter(orderDto.getMovieorderposter());
        orderconDto.setOphone(orderDto.getOphone());
        orderconDto.setMovieordertitle(orderDto.getMovieordertitle());
        orderconDto.setOname(orderDto.getOname());
        orderconDto.setPrice(orderDto.getPrice());
        orderconDto.setPgtype(pgtype);
        orderconDto.setSeat(orderDto.getSeat());
        orderconDto.setOtime(orderDto.getOtime());
        orderconDto.setOrderdate(orderDto.getOrderdate());
        orderconDto.setOemail(orderDto.getOemail());
        orderconDto.setMerchantuid(merchantuid);
        orderconDto.setId(orderDto.getId());
        orderconDto.setCouponid(couponid);
        orderconDto.setFinalAmount(finalAmount);
        orderconDto.setCouponName(couponName);

        return orderMapper.insertocon(orderconDto);
    }
    public SeatDto searchSeat(String seat) {
        return orderMapper.searchSeat(seat);
    }
    public ArrayList<SeatDto> seatlist(){
        return orderMapper.seatlist();
    }

    public int insertpriceseat(String seat, String price, String oid){
        OrderDto orderDto = new OrderDto();
        orderDto.setSeat(seat);
        orderDto.setPrice(Integer.parseInt(price));
        orderDto.setOid(oid);

        return orderMapper.insertpriceseat(orderDto);
    }
}
