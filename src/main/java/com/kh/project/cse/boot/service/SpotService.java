package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface SpotService {

    //근태관리 목록
    List<Attendance> selectInfoList();
    //근태시간 수정
    int updateWorkTime(Attendance attendance);
    //근태 출퇴근
    int updateWorkingTime(Map<String, Object> paramMap);
    int updateLeaveTime(Map<String, Object> paramMap);

    //상품 전체 목록 수
    int ProductListCount();

    //발주요청 카테고리 목록
    List<Category> orderRequestCategoryList();
    //발주요청 상품 목록
    ArrayList<Product> orderRequestProductList();
    //발주요청 상품 검색
    ArrayList<Product> orderRequestProductSearch(String category, String keyword);
    //발주요청 발주
    int insertOrder(List<Circulation> orderList, int storeNo, String setNo);

    //발주요청 목록
    //발주요청 분단위로 묶은 수
    int orderRequestListCount(int storeNo);
    //발주요청 분단위 묶음 목록
    ArrayList<Circulation> orderRequestList(PageInfo pi, int storeNo);
    //발주요청 목록 검색
    ArrayList<Circulation> orderSearch(int storeNo, String SetNo);
}
