package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Circulation;
import com.kh.project.cse.boot.domain.vo.Inventory;
import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.mappers.CirculationMapper;
import com.kh.project.cse.boot.mappers.InventoryMapper;
import com.kh.project.cse.boot.mappers.ProductMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PosServiceImpl implements PosService {

    private final ProductMapper productMapper;
    private final CirculationMapper circulationMapper;

    private final InventoryMapper inventoryMapper;

    public PosServiceImpl(ProductMapper productMapper, CirculationMapper circulationMapper, InventoryMapper inventoryMapper) {
        this.productMapper = productMapper;
        this.circulationMapper = circulationMapper;
        this.inventoryMapper = inventoryMapper;
    }




    @Override
    public int posCirculationInsert(List<Circulation> list) {
        int result =0;
//        System.out.println("list확인:"+ list.get(1).getProductNo());
//        Product prodoct1 = productMapper.posOneProductSelect(list.get(1).getProductNo());
//        System.out.println("select확인: "+prodoct1);

        for (int i =0 ;i <list.size();i++) {
            Product product = productMapper.posOneProductSelect(list.get(i).getProductNo());
            list.get(i).setInputPrice(product.getInputPrice());
            System.out.println( "input값 가져오기 " + list.get(i));
            result = circulationMapper.posCirculationInsert(list.get(i));
        }
        return result;
    }

    @Override
    public ArrayList<Inventory> posAllInventroySelect(int storeNo) {
        return inventoryMapper.posAllInventroySelect(storeNo);
    }

    @Override
    public ArrayList<Inventory> posInventroySearch(String keyword, int storeNo) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return posAllInventroySelect(storeNo); // 전체 상품 리스트 반환
        }
        return inventoryMapper.posInventroySearch(keyword, storeNo);
    }
}
