package com.springboot.gga.dto;

import lombok.Data;

@Data
public class CouponDto {

    String couponid, couponname, startdate, enddate, discount, used;
}
