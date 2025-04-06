package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.mappers.ProductMapper;
import org.apache.ibatis.session.RowBounds;
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
    public int ProductListCount() {
        return productMapper.ProductListCount();
    }

    @Override
    public List<Category> orderRequestCategoryList() {
        return productMapper.selectAllCategories();
    }

    @Override
    public ArrayList<Product> orderRequestProductList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.orderRequestProductList(rowBounds);
    }

    @Override
    public ArrayList<Product> orderRequestProductSearch(String category, String keyword, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.orderRequestProductSearch(category, keyword, rowBounds);
    }


}
