package com.springboot.gga.dto;

import lombok.Data;

@Data
public class OrderDto {

    String movieid, movieordertitle, oid, seat, otime,
            odate, id, oname, ocarnum, oemail, ophone, orderdate, movieorderposter;

    int price;




  /*  public String getOemail() {
        if(email1 != null && email2 != "") {
            oemail = email1 + "@" + email2;
        }else if(email2 == ""){
            oemail = email1;
        }
        return oemail;
    }*/
}
