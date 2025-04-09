package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;
import com.kh.project.cse.boot.mappers.*;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
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
    private final FilesMapper filesMapper;
    private final ReplyMapper replyMapper;


    @Autowired
    public HeadServiceImpl(ProductMapper productMapper, AnnouncementMapper announcementMapper, StoreMapper storeMapper, CirculationMapper circulationMapper, MemberMapper memberMapper, FilesMapper filesMapper, ReplyMapper replyMapper) {
        this.productMapper = productMapper;
        this.announcementMapper = announcementMapper;
        this.storeMapper = storeMapper;
        this.circulationMapper = circulationMapper;
        this.memberMapper = memberMapper;
        this.filesMapper = filesMapper;
        this.replyMapper = replyMapper;
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

    //댓글추가
    @Override
    public int insertReply(Reply reply) {return replyMapper.insertReply(reply);}

    //댓글총수
    @Override
    public ArrayList<Reply> selectReply(int announcementNo) {return replyMapper.selectReply(announcementNo);}



    //상품추가
    @Override
    public int insertProduct(Product product, Files files) {
        int result = 0;
        if(files.getOriginName() != null){
            result = productMapper.insertProduct(product);
            System.out.println("새로운 상품번호 : " + product.getProductNo() );
            if (result >= 1) {
                files.setProductNo(product.getProductNo());
                int result2 = filesMapper.insertFiles(files);
                result *= result2;
            }
        }else{
            result = productMapper.insertProduct(product);
        }

        return result;
    }
    //첨부파일 추가
    @Override
    public int insertFile(int productNo, Files files) {
        files.setProductNo(productNo);
        return filesMapper.insertFiles(files);
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
    public int updateProduct(Product product, Files files) {
        int result =0;
        int result1 = filesMapper.updateFiles(files);

        if(result1 > 0){
            product.setFilePath(files.getFilePath());
            int result2 = productMapper.updateProduct(product);
            result = result1 * result2;
        }

        return result;
    }



    @Override
    public int deleteProduct(int productNo) {
        int result = 0;
        Product p = productMapper.OneProductSelect(productNo);

        if(p.getFilePath() != null){
           int result1 = filesMapper.deleteFile(productNo);
           result += result1;
        }
        int result2 = productMapper.deleteProduct(productNo);
        result +=result2;

        return result;
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
        return circulationMapper.updateheadorder(setNo,status);
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
}
