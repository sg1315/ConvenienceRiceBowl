package com.kh.project.cse.boot.mappers;


import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface ProductMapper {
    int insertProduct(Product product);

    ArrayList<Product> searchProduct(String condition, String keyword);

    ArrayList<Product> selectAllProduct(RowBounds rowBounds);

    List<Category> selectAllCategories();

    int ProductListCount();

    int updateProduct(Product product);


    //지점
    List<Product> orderReqeustProductList();
}
