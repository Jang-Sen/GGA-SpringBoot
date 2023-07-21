package com.springboot.gga.dto;

import lombok.Data;

@Data
public class BoardCommentDto {
    String bcid, bid, sid, bccontent, bcdate, page;
    int rno;
}
