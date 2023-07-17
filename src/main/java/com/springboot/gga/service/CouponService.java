package com.springboot.gga.service;

import com.springboot.gga.dto.CouponDto;
import com.springboot.gga.repository.CouponMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CouponService {

    @Autowired
    private CouponMapper couponMapper;

    public int insertInit1(String id) {
        return couponMapper.insertInit1(id);
    }
    public int insertInit2(String id) {
        return couponMapper.insertInit2(id);
    }
    public int insertInit3(String id) {
        return couponMapper.insertInit3(id);
    }

    public List<CouponDto> list(Map param) {
        return couponMapper.list(param);
    }

    public int updateAdd(Map param) {
        return couponMapper.updateAdd(param);
    }

    public int updateCancel(Map param) {
        return couponMapper.updateCancel(param);
    }
}
