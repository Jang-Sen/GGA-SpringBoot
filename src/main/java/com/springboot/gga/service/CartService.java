package com.springboot.gga.service;

import com.springboot.gga.dto.CartDto;
import com.springboot.gga.repository.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CartService {

    @Autowired
    private CartMapper cartMapper;

    public int insert(Map param) {
        return cartMapper.insert(param);
    }

    public List<CartDto> list(String id) {
        return cartMapper.list(id);
    }
}
