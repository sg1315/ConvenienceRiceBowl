package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;
import com.kh.project.cse.boot.mappers.*;
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
    private final MemberMapper memberMapper;


    @Autowired
    public HeadServiceImpl(ProductMapper productMapper, AnnouncementMapper announcementMapper, StoreMapper storeMapper, CirculationMapper circulationMapper, MemberMapper memberMapper) {
        this.productMapper = productMapper;
        this.announcementMapper = announcementMapper;
        this.storeMapper = storeMapper;
        this.circulationMapper = circulationMapper;
        this.memberMapper = memberMapper;
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
    @Override
    public int insertAnnouncement(Announcement announcement){
        return announcementMapper.insertAnnouncement(announcement);
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
    public ArrayList<Store> selectStore(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return storeMapper.selectStore(rowBounds);
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
        int result = 0;
        for (int i = 0 ; i < storeNumbers.length; i++){
            result += storeMapper.updateStoreNo(storeNumbers[i]);
        }
        return result;
    }
    @Override
    public int deleteStoreStatus(String[] storeNumbers, String[] memberNumbers) {
        int result1 = 0;
        int result2 = 0;

        for(int i = 0 ; i < memberNumbers.length; i++){
            result1 += memberMapper.deleteMember(memberNumbers[i]);
            result2 += storeMapper.deleteStore(storeNumbers[i]);
        }

        int result = result1 * result2;

        return result;
    }


    @Override
    public Announcement selectDetailAnnouncement(int announcementNo) {
        System.out.println(announcementMapper.selectDetailAnnouncement(announcementNo));
        return announcementMapper.selectDetailAnnouncement(announcementNo);
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
