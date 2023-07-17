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

    public int insertocon(String impuid, String merchantuid, String pgtype, OrderDto orderDto) {

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

       /* Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("movieid", orderDto.getMovieid());
        paramMap.put("movieordertitle", orderDto.getMovieordertitle());
        paramMap.put("price", orderDto.getPrice());
        paramMap.put("seat", orderDto.getSeat());
        paramMap.put("otime", orderDto.getOtime());
        paramMap.put("odate", orderDto.getOdate());
        paramMap.put("oname", orderDto.getOname());
        paramMap.put("ocarnum", orderDto.getOcarnum());
        paramMap.put("oemail", orderDto.getOemail());
        paramMap.put("ophone", orderDto.getOphone());
        paramMap.put("orderdate", orderDto.getOrderdate());
        paramMap.put("impuid", impuid);
        paramMap.put("merchantuid", merchantuid);
        paramMap.put("pgtype", pgtype);
        paramMap.put("movieorderposter", orderDto.getMovieorderposter());*/
        //paramMap.put("id", orderDto.getId());

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
