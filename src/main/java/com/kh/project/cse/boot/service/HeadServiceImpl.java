package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;
import com.kh.project.cse.boot.mappers.*;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class HeadServiceImpl implements HeadService {

    private final ProductMapper productMapper;
    private final AnnouncementMapper announcementMapper;
    private final CirculationMapper circulationMapper;
    private final StoreMapper storeMapper;
    private final MemberMapper memberMapper;
    private final ReplyMapper replyMapper;
    private final HeadService self; // 여기 추가됨


    @Autowired
    public HeadServiceImpl(ProductMapper productMapper, AnnouncementMapper announcementMapper, StoreMapper storeMapper, CirculationMapper circulationMapper, MemberMapper memberMapper, FilesMapper filesMapper, ReplyMapper replyMapper, @Lazy HeadService self) {
        this.productMapper = productMapper;
        this.announcementMapper = announcementMapper;
        this.storeMapper = storeMapper;
        this.circulationMapper = circulationMapper;
        this.memberMapper = memberMapper;
        this.replyMapper = replyMapper;
        this.self = self;
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
    //공지사항검색수
    @Override
    public int searchAnnouncementCount(String condition, String keyword){return announcementMapper.searchAnnouncementCount(condition, keyword);}

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

    //댓글추가
    @Override
    public int insertReply(Reply reply) {return replyMapper.insertReply(reply);}

    //댓글총수
    @Override
    public ArrayList<Reply> selectReply(int announcementNo) {return replyMapper.selectReply(announcementNo);}



    //상품추가
    @Override
    public int insertProduct(Product product) {
        return productMapper.insertProduct(product);
    }


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
    public int updateProduct(Product product) {
            return  productMapper.updateProduct(product);
    }

    @Override
    public int searchProductCount(String condition, String keyword) {
        return productMapper.searchProductCount(condition, keyword);
    }
    @Override
    public Product OneProductSelect(int productNo) {
        return productMapper.OneProductSelect(productNo);
    }

    @Override
    public int updateOnlyProduct(Product product) {
        return productMapper.updateOnlyProduct(product);
    }

    @Override
    public int deleteUpdateProduct(Product product) {
        return productMapper.deleteUpdateProduct(product);
    }

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
    public ArrayList<Circulation> selectCirculationlist(PageInfo pi){
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return circulationMapper.selectCirculationlist(rowBounds);
    }

    //발주세부사항 불러오기
    @Override
    public ArrayList<Circulation> getOderDetail(String setNo) {
        return circulationMapper.getOderDetail(setNo);
    }

    @Override
    public int selectcirculation(){return circulationMapper.selectcirculation();}

    @Override
    public int updateheadorder(String setNo, int status) {
        int result = circulationMapper.updateheadorder(setNo, status);

        // 상태가 5번일 경우 20초 후 자동으로 7번으로 변경
        if (result > 0 && status == 5) {
            self.updateLaterToStatus7(setNo); // 프록시를 통해 호출해야 @Async가 동작함
        }
        return result;
    }

    @Async
    public void updateLaterToStatus7(String setNo) {
        try {
            Thread.sleep(10000); // 10초 대기
            circulationMapper.updateheadorder(setNo, 7);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            e.printStackTrace();
        }
    }

    @Override
    public List<Circulation> head_lastorder(LocalDate start, LocalDate end) {
        return circulationMapper.head_lastorder(start, end);
    }

    @Override
    public int circulationSearchListCount(String setNo, Date startDate, Date endDate) {
        return circulationMapper.circulationSearchListCount(setNo,startDate,endDate);
    }

    @Override
    public ArrayList<Circulation> circulationSearchList(PageInfo pi, String setNo, Date startDate, Date endDate) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return circulationMapper.circulationSearchList(rowBounds,  setNo,  startDate, endDate);
    }



    @Override
    public int searchstoreListCount(String condition, String keyword) {
        return storeMapper.searchStoreListCount(condition,keyword);
    }


}
