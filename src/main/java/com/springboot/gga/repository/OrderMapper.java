package com.springboot.gga.repository;

import com.springboot.gga.dto.OrderDto;
import com.springboot.gga.dto.OrderconDto;
import com.springboot.gga.dto.SeatDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface OrderMapper {

    ArrayList<SeatDto> seatlist();
    void getSeatPrice(String seat, String price, String oid);

    OrderconDto selectOrderconlist(String oconid);

    void deleteOrdercon(String oconid);

    int resetSeat(String seat);

    int updateseatstatus(String seat);

    int insertOrderDto(OrderDto orderDto);

    String getOid();

    int insertocon(OrderconDto orderconDto);

    OrderDto select(String oid);

    ArrayList<OrderconDto> selectOrdercon();

    OrderconDto selectOrderconuid(String merchantuid);

    void getimp(String impuid, String merchantuid, String pgtype, OrderDto orderDto);

    SeatDto searchSeat(String seat);

    int insertpriceseat(OrderDto orderDto);

    List<OrderconDto> selectOrderconMypage(String id);

}
