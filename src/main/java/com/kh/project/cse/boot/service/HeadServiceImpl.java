package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;
import com.kh.project.cse.boot.mappers.AnnouncementMapper;
import com.kh.project.cse.boot.mappers.CirculationMapper;
import com.kh.project.cse.boot.mappers.ProductMapper;
import com.kh.project.cse.boot.mappers.StoreMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HeadServiceImpl implements HeadService {

    private final ProductMapper productMapper;
    private final AnnouncementMapper announcementMapper;
    private final CirculationMapper circulationMapper;

    private final StoreMapper storeMapper;


    @Autowired
    public HeadServiceImpl(ProductMapper productMapper, AnnouncementMapper announcementMapper, StoreMapper storeMapper, CirculationMapper circulationMapper) {
        this.productMapper = productMapper;
        this.announcementMapper = announcementMapper;
        this.storeMapper = storeMapper;
        this.circulationMapper = circulationMapper;
    }


    //공지사항 총수
    @Override
    public int selectAnnouncementCount(){return announcementMapper.selectAnnouncementCount();}

    //공지사항 리스트
    public ArrayList<Announcement> selectAnnouncementlist(PageInfo pi){
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return announcementMapper.selectAnnouncementlist(rowBounds);
    }
    //공지사항추가
    @Override
    public int insertAnnouncement(Announcement announcement){
        return announcementMapper.insertAnnouncement(announcement);
    }


    //공지사항세부사항 불러오기
    @Override
    public Announcement selectDetailAnnouncement(int announcementNo) {
        return announcementMapper.selectDetailAnnouncement(announcementNo);
    }
    //공지사항수정하기
    @Override
    public int updateAnnouncementDetail(Announcement announcement){
        return announcementMapper.updateAnnouncementDetail(announcement);
    }
    //공지사항검색
    @Override
    public ArrayList<Announcement> searchAnnouncement(String condition, String keyword, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return announcementMapper.searchAnnouncement(condition,keyword,rowBounds);
    }

    //공지사항삭제
    @Override
    public int deleteAnnouncement(int announcementNo) {
        return announcementMapper.deleteAnnouncement(announcementNo);
    }

    //상품추가
    @Override
    public int insertProduct(Product product) { return productMapper.insertProduct(product);}
    //상품검색
    @Override
    public ArrayList<Product> searchProduct(String condition, String keyword, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.searchProduct(condition,keyword,rowBounds);}
    //상품페이징_목록갯수
    @Override
    public int ProductListCount() { return productMapper.ProductListCount();}
    //상품전체목록
    @Override
    public ArrayList<Product> selectAllProduct(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.selectAllProduct(rowBounds);
    }
    //카테고리전체목록
    @Override
    public List<Category> selectAllCategories() { return productMapper.selectAllCategories();}
    //상품수정
    @Override
    public int updateProduct(Product product) { return productMapper.updateProduct(product);}

    //지점목록 수
    @Override
    public int storeListCount() {
        return storeMapper.storeListCount();
    }

    @Override
    public ArrayList<Store> selectAllStore(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return storeMapper.selectAllStore(rowBounds);
    }

    @Override
    public ArrayList<Store> searchStore(String condition, String keyword, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return storeMapper.searchStore(condition,keyword,rowBounds);
    }

    @Override
    public ArrayList<Store> selectStoreStatus(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return storeMapper.selectStoreStatus(rowBounds);
    }

    @Override
    public int updateStoreNo(String[] storeNumbers) {
        int res = 0;
        for (int i = 0 ; i < storeNumbers.length; i++){
            res += storeMapper.updateStoreNo(storeNumbers[i]);
        }

        return res;
    }


    @Override
    public int selectcirculation(){return circulationMapper.selectcirculation();}

    @Override
    public ArrayList<Circulation> selectCirculationlist(PageInfo pi){
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return circulationMapper.selectCirculationlist(rowBounds);
    }

}
