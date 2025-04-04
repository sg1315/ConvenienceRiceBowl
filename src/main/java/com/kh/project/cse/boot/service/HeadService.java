package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.domain.vo.Announcement;
import com.kh.project.cse.boot.domain.vo.Product;

import java.util.ArrayList;
import java.util.List;

public interface HeadService {
    //상품추가
    int insertProduct(Product product);

    ArrayList<Product> searchProduct(String condition, String keyword);

    ArrayList<Product> selectAllProduct();


    List<Category> selectAllCategories();

    //공지사항추가
    int insertAnnouncement(Announcement announcement);
}
