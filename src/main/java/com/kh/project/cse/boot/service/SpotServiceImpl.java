package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.mappers.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SpotServiceImpl implements SpotService {

    private final ProductMapper productMapper;

    @Autowired
    public SpotServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public List<Product> orderReqeustProductList() {
        return productMapper.orderReqeustProductList();
    }
}
