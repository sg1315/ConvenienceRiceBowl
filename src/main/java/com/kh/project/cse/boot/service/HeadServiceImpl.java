package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.mappers.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeadServiceImpl implements HeadService {

    private final ProductMapper productMapper;

    @Autowired
    public HeadServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }


    @Override
    public int insertProduct(Product product) {
        return productMapper.insertProduct(product);
    }
}
