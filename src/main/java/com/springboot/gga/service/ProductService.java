package com.springboot.gga.service;

import com.springboot.gga.dto.PageDto;
import com.springboot.gga.dto.ProductDto;
import com.springboot.gga.repository.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;
    public List<ProductDto> categoryList(String pcategory) {
        return productMapper.categoryList(pcategory);
    }

    public List<ProductDto> list(PageDto pageDto) {
        return productMapper.list(pageDto);
    }

    public int insert(ProductDto productDto) {
        return productMapper.insert(productDto);
    }

    public ProductDto content(String pid) {
        return productMapper.content(pid);
    }

    public int update(ProductDto productDto) {
        return productMapper.update(productDto);
    }

    public int delete(String pid) {
        return productMapper.delete(pid);
    }

    public List<ProductDto> searchList(Map param) {
        return productMapper.searchList(param);
    }
}
