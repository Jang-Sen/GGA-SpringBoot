package com.springboot.gga.dto;

import lombok.Data;

@Data
public class MemberDto {
    String name, id, pass, cpass, gender, email1, email2, car1, car2, tel, birth;
    // String[] genre; //마이페이지 정보 업데이트 할때 수정했음 장르 배열타입으로 안받아도 알아서 들어감 <- 어차피 로직도 안썼었음
    String genre;
    String email, phone, genreList, carnum, mdate;
    int naverLoginResult;
    int rno ;

    public String getEmail() {
        if(email1 != null && email2 != "") {
// System.out.println("이메일 1폼");
            email = email1 + "@" + email2;
        }else if(email1 == null && email2 == null){
// System.out.println("이메일 폼 진입");
            email = id;
        }else if(email2 == ""){
// System.out.println("이메일2 폼");
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
