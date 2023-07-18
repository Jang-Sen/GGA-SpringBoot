package com.springboot.gga.dto;

import lombok.Data;

@Data
public class OrderconDto {
    String oconid, movieid, movieordertitle, seat, otime, odate, oname, ocarnum,  oemail ,ophone,
            orderdate ,	impuid ,merchantuid , pgtype, movieorderposter, id ;
    int price;

}
