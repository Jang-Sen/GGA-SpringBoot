package com.springboot.gga.dto;

import lombok.Data;

@Data
public class MemberDto {
    String name, id, pass, cpass, gender, email1, email2, car1, car2, tel, birth;
    String[] genre;
    String email, phone, genreList, carnum, mdate;
    int rno ;

    public String getEmail() {
        if(email1 != null && email2 != "") {
            email = email1 + "@" + email2;
        }else if(email2 == ""){
            email = email1;
        }
        return email;
    }
    public String getGenreList() {
        if(genre != null) {
            genreList = String.join(", ", genre);
        }
        return genreList;
    }
    public String getCarnum() {
        if(car1 != null && car2 != "") {
            carnum = car1 + " " + car2;
        }else if(car2 == ""){
            carnum = car1;
        }
        return carnum;
    }







}
