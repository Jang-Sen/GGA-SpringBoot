package com.springboot.gga.dto;

import lombok.Data;

@Data
public class ProductOrderDto {

    String poid, pid, cid, couponid, podate, finalprice, pname, couponname, gsfile;
    int rno, qty;
}
