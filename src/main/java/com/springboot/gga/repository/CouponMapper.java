package com.springboot.gga.repository;

import com.springboot.gga.dto.CouponDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CouponMapper {

    int insertInit1(String id);
    int insertInit2(String id);
    int insertInit3(String id);
    int insertInit4(String id);
    int insertInit5(String id);

    List<CouponDto> list(Map param);

    int updateAdd(Map param);
    int updateCancel(Map param);
}
