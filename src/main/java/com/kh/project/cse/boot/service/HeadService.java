package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;

import java.util.ArrayList;
import java.util.List;

public interface HeadService {
    //공지사항추가
    int insertAnnouncement(Announcement announcement);

    //공지사항총수
    int selectAnnouncementCount();

    //공지사항불러오기
    ArrayList<Announcement> selectAnnouncementlist(PageInfo pi);



    //상품추가
    int insertProduct(Product product);
    //상품검색
    ArrayList<Product> searchProduct(String condition, String keyword,PageInfo pi);
    //상품전체목록 수
    int ProductListCount();
    //전체상품목록
    ArrayList<Product> selectAllProduct(PageInfo pi);
    //카테고리목록
    List<Category> selectAllCategories();
    //상품수정
    int updateProduct(Product product);


    //지점전체목록수
    int storeListCount();
    //지점전체목록
    ArrayList<Store> selectAllStore(PageInfo pi);

    ArrayList<Store> searchStore(String condition, String keyword, PageInfo pi);

    ArrayList<Store> selectStoreStatus(PageInfo pi);

    int updateStoreNo(String[] storeNumbers);

    ArrayList<Product> searchMember(String condition, String keyword, PageInfo pi);
}
