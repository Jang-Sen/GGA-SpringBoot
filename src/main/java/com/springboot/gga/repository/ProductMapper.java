package com.springboot.gga.repository;

import com.springboot.gga.dto.PageDto;
import com.springboot.gga.dto.ProductDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {
    List<ProductDto> categoryList(String pcategory);

    List<ProductDto> list(PageDto pageDto);

    int insert(ProductDto productDto);

    ProductDto content(String pid);

    int update(ProductDto productDto);

    int delete(String pid);

    List<ProductDto> searchList(Map param);
}
