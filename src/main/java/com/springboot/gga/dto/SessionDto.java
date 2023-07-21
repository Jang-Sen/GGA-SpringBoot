package com.springboot.gga.dto;

import lombok.Data;

@Data
public class SessionDto {
    int loginResult;
    int naverLoginResult = 1;
    String id, name, pass;
    String navGender, navBirthday;
}
