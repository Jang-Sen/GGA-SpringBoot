package com.springboot.gga.dto;

import lombok.Data;

import java.util.List;

@Data
public class ProductOrderDto {

    String poid, pid, cid, couponid, podate, finalprice, pname, couponname, gsfile;
    int rno, qty, discount, pprice;
    List<String> cidArray, couponidArray, qtyArray, pidArray;
}
