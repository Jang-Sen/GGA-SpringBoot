package com.springboot.gga.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ProductDto extends FileDto {

    int rno;
    String pid, pname, pprice, gfile, gsfile, pcategory, page;
}
