package com.springboot.gga.repository;

import com.springboot.gga.dto.ProductOrderDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductOrderMapper {
    int insertOne(Map param);

    ProductOrderDto selectOne(String orderNumber);

    List<ProductOrderDto> myList(String id);
}
