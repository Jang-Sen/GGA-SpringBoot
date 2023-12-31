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
    public int insertInit4(String id) { return couponMapper.insertInit4(id);}
    public int insertInit5(String id) { return couponMapper.insertInit5(id);}

    public List<CouponDto> list(Map param) {
        return couponMapper.list(param);
    }

    public int updateAdd(Map param) {
        return couponMapper.updateAdd(param);
    }

    public int updateCancel(Map param) {
        return couponMapper.updateCancel(param);
    }

    public int updateListAdd(String[] couponidArray) {
        return couponMapper.updateListAdd(couponidArray);
    }

    public List<CouponDto> myList(String id) {
        return couponMapper.myList(id);
    }
}
