package com.springboot.gga.repository;

import com.springboot.gga.dto.CartDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CartMapper {
    int insert(Map param);

    List<CartDto> list(String id);

    int update(Map param);

    List<CartDto> contentList();

    int deleteList(String[] cidArray);

    int searchCart(Map param);

    int deleteOne(Map param);

    int count(String id);
}
