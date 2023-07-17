package com.springboot.gga.dto;

import lombok.Data;

@Data
public class SessionDto {
    int loginResult;
    String id, name, pass;
}
