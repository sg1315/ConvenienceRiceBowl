package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;

import java.util.ArrayList;
import java.util.List;

public interface SpotService {
    //상품 전체 목록 수
    int ProductListCount();

    //발주요청 카테고리 목록
    List<Category> orderRequestCategoryList();
    //발주요청 상품 목록
    ArrayList<Product> orderRequestProductList(PageInfo pi);
    //발주요청 상품 검색
    ArrayList<Product> orderRequestProductSearch(String category, String keyword, PageInfo pi);
}
