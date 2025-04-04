package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Announcement;
import com.kh.project.cse.boot.domain.vo.Product;

public interface HeadService {
    //상품추가
    int insertProduct(Product product);

    //공지사항추가
    int insertAnnouncement(Announcement announcement);
}
