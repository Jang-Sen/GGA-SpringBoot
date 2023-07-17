package com.springboot.gga.service;

import com.springboot.gga.dto.ProductOrderDto;
import com.springboot.gga.repository.ProductOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductOrderService {

    @Autowired
    private ProductOrderMapper productOrderMapper;

    public int insertOne(Map param) {
        return productOrderMapper.insertOne(param);
    }

    public ProductOrderDto selectOne(String orderNumber) {
        return productOrderMapper.selectOne(orderNumber);
    }

    public List<ProductOrderDto> myList(String id) {
        return productOrderMapper.myList(id);
    }
}
