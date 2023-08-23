package com.springboot.gga.repository;

import com.springboot.gga.dto.OrderDto;
import com.springboot.gga.dto.OrderConDto;
import com.springboot.gga.dto.SeatDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface OrderMapper {

    ArrayList<SeatDto> seatList();
    void getSeatPrice(String seat, String price, String oid);

    OrderConDto selectOrderConList(String oconid);

    void deleteOrderCon(String oconid);

    int resetSeat(String seat);

    int updateSeatStatus(String seat);

    int insertOrderDto(OrderDto orderDto);

    String getOid();

    int insertOcon(OrderConDto orderconDto);

    OrderDto select(String oid);

    ArrayList<OrderConDto> selectOrderCon();

    OrderConDto selectOrderConUid(String merchantuid);

    void getImp(String impuid, String merchantuid, String pgtype, OrderDto orderDto);

    SeatDto searchSeat(String seat);

    int insertPriceSeat(OrderDto orderDto);

    List<OrderConDto> selectOrderConMyPage(String id);

}
