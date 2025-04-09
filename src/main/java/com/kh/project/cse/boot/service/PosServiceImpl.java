package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Circulation;
import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.mappers.CirculationMapper;
import com.kh.project.cse.boot.mappers.ProductMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PosServiceImpl implements PosService {

    private final ProductMapper productMapper;
    private final CirculationMapper circulationMapper;

    public PosServiceImpl(ProductMapper productMapper, CirculationMapper circulationMapper) {
        this.productMapper = productMapper;
        this.circulationMapper = circulationMapper;
    }

    @Override
    public ArrayList<Product> posProductSearch(String keyword) {


        if (keyword == null || keyword.trim().isEmpty()) {
            return posAllProductSelect(); // 전체 상품 리스트 반환

        }return productMapper.posProductSearch(keyword);
    }

    @Override
    public ArrayList<Product> posAllProductSelect() {
        return productMapper.posAllProductSelect();
    }

    @Override
    public int posCirculationInsert(List<Circulation> list) {
        int result =0;
        System.out.println("list확인:"+ list.get(1).getProductNo());
        Product prodoct1 = productMapper.posOneProductSelect(list.get(1).getProductNo());
        System.out.println("select확인: "+prodoct1);

        for (int i =0 ;i <list.size();i++) {
            Product product = productMapper.posOneProductSelect(list.get(i).getProductNo());
            list.get(i).setInputPrice(product.getInputPrice());
            result = circulationMapper.posCirculationInsert(list.get(i));
        }
        return result;
    }
}
