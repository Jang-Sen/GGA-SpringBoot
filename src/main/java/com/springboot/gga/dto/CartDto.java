package com.springboot.gga.dto;

import lombok.Data;

@Data
public class CartDto {

    int rno, qty;
    String pid, id, cid, pname, pprice, gfile, gsfile, pcategory;
}
