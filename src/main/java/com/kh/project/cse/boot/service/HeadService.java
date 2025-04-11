package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public interface HeadService {

    //상품추가
    int insertProduct(Product product);
    //상품검색
    ArrayList<Product> searchProduct(String condition, String keyword,PageInfo pi);
    //상품리스트 검색 목록 수
    int searchProductCount(String condition, String keyword);
    //상품전체목록 수
    int ProductListCount();
    //전체상품목록
    ArrayList<Product> selectAllProduct(PageInfo pi);


    //카테고리목록
    List<Category> selectAllCategories();
    //상품수정
    int updateProduct(Product product);
    //상품삭제

    int deleteUpdateProduct(Product product);


    //공지사항추가
    int insertAnnouncement(Announcement announcement);

    //공지사항총수
    int selectAnnouncementCount();

    //공지사항불러오기
    ArrayList<Announcement> selectAnnouncementlist(PageInfo pi);

    //공지사항 세부
    Announcement selectDetailAnnouncement(int announcementNo);

    //공지사항수정
    int updateAnnouncementDetail(Announcement announcement);

    //공지사항검색 수
    int searchAnnouncementCount(String condition,String keyword);

    //공지사항검색
    ArrayList<Announcement> searchAnnouncement(String condition, String keyword,PageInfo pi);

    //공지사항 삭제
    int deleteAnnouncement(int announcementNo);

    //댓글추가
    int insertReply(Reply reply);

    //댓글불러오기
    ArrayList<Reply> selectReply(int announcementNo);



    //지점전체목록수
    int storeListCount();
    //지점전체목록
    ArrayList<Store> selectStore(PageInfo pi);
    //검색
    ArrayList<Store> searchStore(String condition, String keyword, PageInfo pi);
    //지점 검색목록 수
    int searchstoreListCount(String condition, String keyword);
    //지점상태목록
    ArrayList<Store> selectStoreStatus(PageInfo pi);
    //지점수정
    int updateStoreNo(String[] storeNumbers);
    //지점삭제
    int deleteStoreStatus(String[] storeNumbers, String[] memberNumbers);





    //발주관리사항 불러오기
    ArrayList<Circulation> selectCirculationlist(PageInfo pi);


    //발주관리 세부사항
    ArrayList<Circulation> getOderDetail(String setNo);
    //발주관리사항 총수
    int selectcirculation();

    //발주 승인 미승인
    int updateheadorder(String setNo, int status);
    void updateLaterToStatus7(String setNo);

    //발주 지난달
    List<Circulation> head_lastorder(LocalDate start, LocalDate end);


    //발부목록 검생
    int circulationSearchListCount( String setNo, Date startDate, Date endDate);
    //검색한 발주 요청 목록
    ArrayList<Circulation> circulationSearchList(PageInfo pi, String setNo, Date startDate, Date endDate);


    Product OneProductSelect(int productNo);

    int updateOnlyProduct(Product product);
}
