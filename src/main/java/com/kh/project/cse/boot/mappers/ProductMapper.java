package com.kh.project.cse.boot.mappers;


import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface ProductMapper {
    int insertProduct(Product product);

    ArrayList<Product> searchProduct(String condition, String keyword, RowBounds rowBounds);

    ArrayList<Product> selectAllProduct(RowBounds rowBounds);

    List<Category> selectAllCategories();

    int ProductListCount();

    int updateProduct(Product product);


    //지점

    //발주요청 상품 목록
    ArrayList<Product> orderRequestProductList();
    //발주요청 상품 검색
    ArrayList<Product> orderRequestProductSearch(String category, String keyword);
}
