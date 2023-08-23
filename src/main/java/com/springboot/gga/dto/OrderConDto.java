package com.springboot.gga.dto;

import lombok.Data;

@Data
public class OrderConDto {
    String oconid, movieid, movieordertitle, seat, otime, odate, oname, ocarnum,  oemail ,ophone,
            orderdate ,	impuid ,merchantuid , pgtype, movieorderposter, id,couponid,couponName,finalAmount ;
    int price;

}
