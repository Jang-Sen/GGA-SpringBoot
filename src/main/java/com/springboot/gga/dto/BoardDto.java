package com.springboot.gga.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class BoardDto extends FileDto {
    String page;
    String bid, btitle, bcontent, bdate, mid, movieName;
    int rno, bhits, score;

}
