package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;
import com.kh.project.cse.boot.mappers.*;
import org.apache.ibatis.session.RowBounds;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.*;

@Transactional
@RequiredArgsConstructor
@Service
public class SpotServiceImpl implements SpotService {
    private final AttendanceMapper attendanceMapper;
    private final ExpiryMapper expiryMapper;
    private final CirculationMapper circulationMapper;
    private final ProductMapper productMapper;
    private final InventoryMapper inventoryMapper;
    private final AnnouncementMapper announcementMapper;

    @Override
    public int selectExpiryCount(int storeNo) {
        return expiryMapper.selectExpiryCount(storeNo);
    }

    @Override
    public ArrayList<Expiry> selectExpiryList(int storeNo,PageInfo pi) {

        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());

        return expiryMapper.selectExpiryList(storeNo, rowBounds);
    }
    @Override
    public ArrayList<Expiry> searchExpiryList(String searchExpiry, String keyword, int storeNo, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());

        return expiryMapper.searchExpiryList(searchExpiry,keyword,storeNo, rowBounds);
    }

    //근태정보 - 모달 수정버튼
    @Override
    public int updateWorkTime(Attendance attendance) {
        return attendanceMapper.updateWorkTime(attendance);
    }
    //근태관리 - 출퇴근시간 업데이트 //출근
    @Override
    public int insertWorkingTime(Map<String, Object> paramMap) {
        return attendanceMapper.insertWorkingTime(paramMap);
    }
    //근태관리 - 출퇴근시간 업데이트 //퇴근
    @Override
    public int updateLeaveTime(Map<String, Object> paramMap) {
        return attendanceMapper.updateWorkLeaveBtnTime(paramMap);
    }
    //근태관리 - 출퇴근 상태 가져오기
    @Override
    public int getAttendanceStatus(String memberId) {
        return attendanceMapper.getAttendanceStatus(memberId);
    }

    //발주 - 상품 수 카운트
    @Override
    public int ProductListCount() {
        return productMapper.ProductListCount();
    }
    //발주 - 발주 요청 상품 카테고리 목록
    @Override
    public List<Category> orderRequestCategoryList() {
        return productMapper.selectAllCategories();
    }
    //발주 - 발주 요청 상품 목록
    @Override
    public ArrayList<Product> orderRequestProductList() {
//        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.orderRequestProductList();
    }
    //발주 - 발주 요청 상품 검색
    @Override
    public ArrayList<Product> orderRequestProductSearch(String category, String keyword) {
//        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.orderRequestProductSearch(category, keyword);
    }

    @Override
    public int Expiry(int storeNo, int productNo, int inventoryCount, String expirationDate) {
        System.out.println(storeNo +" "+ productNo +" "+ inventoryCount +" "+ expirationDate);
        int result = 0;
        result = circulationMapper.insertExpiry(storeNo,productNo,inventoryCount);
        System.out.println("result:"+ result);
        if(result>0){
            return expiryMapper.deleteExpiry(storeNo,productNo,expirationDate);
        }
        return 0;
    }

    //발주 - 발주 요청
    @Override
    public int insertOrder(List<Circulation> orderList, int storeNo, String setNo) {

        int result = 1;

        for (Circulation circulation : orderList) {
            int insertResult = circulationMapper.insertOrder(circulation, storeNo, setNo);
            if (insertResult == 0) {
                result = 0;
                break;
            }
        }
        return result;
    }
    //발주 - 발주 요청 목록 카운트
    @Override
    public int orderRequestListCount(int storeNo) {
        return circulationMapper.orderRequestListCount(storeNo);
    }
    //발주 - 발주 요청 목록
    @Override
    public ArrayList<Circulation> orderRequestList(PageInfo pi, int storeNo) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return circulationMapper.orderRequestList(rowBounds, storeNo);
    }
    //발주 - 검색한 발주 요청 목록 카운트
    @Override
    public int orderSearchListCount(int storeNo, String setNo, Integer status, Date startDate, Date endDate) {
        return circulationMapper.orderSearchListCount(storeNo, setNo, status, startDate, endDate);
    }
    //발주 - 검색한 발주 요청 목록
    @Override
    public ArrayList<Circulation> orderSearchList(PageInfo pi, int storeNo, String setNo, Integer status, Date startDate, Date endDate) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return circulationMapper.orderSearchList(rowBounds, storeNo, setNo, status, startDate, endDate);
    }

    @Override
    public ArrayList<Circulation> spotOrderDetail(String setNo) {
        return circulationMapper.spotOrderDetail(setNo);
    }

    @Override
    public int cancelOrder(String setNo, int storeNo) {
        int result = 0;
        result = circulationMapper.cancelOrder(setNo, storeNo);

        if(result>0){
            return result;
        }else{
            return 0;
        }
    }

    //입고 - setNo으로 묶은 수
    @Override
    public int inputListCount(int storeNo) {
        return circulationMapper.inputListCount(storeNo);
    }
    //입고 - setNo 묶음 목록
    @Override
    public ArrayList<Circulation> inputList(PageInfo pi, int storeNo) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return circulationMapper.inputList(rowBounds, storeNo);
    }
    //입고 - 검색한 입고 setNo으로 묶은 수
    @Override
    public int inputSearchListCount(int storeNo, String setNo, Integer status, Date startDate, Date endDate) {
        return circulationMapper.inputSearchListCount(storeNo, setNo, status, startDate, endDate);
    }
    //검색한 - 입고 목록
    @Override
    public ArrayList<Circulation> inputSearchList(PageInfo pi, int storeNo, String setNo, Integer status, Date startDate, Date endDate) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return circulationMapper.inputSearchList(rowBounds, storeNo, setNo, status, startDate, endDate);
    }

    @Override
    public ArrayList<Circulation> inputDetail(String setNo) {
        return circulationMapper.inputDetail(setNo);
    }

    @Override
    public int insertInput(List<Circulation> inputList, int storeNo) {

        int result = 1;

        for (Circulation circulation : inputList) {
            int insertResult = circulationMapper.insertInput(circulation, storeNo);
            if (insertResult == 0) {
                result = 0;
                break;
            }
        }
        return result;
    }

    //매출집계 - 검색
    @Override
    public List<Circulation> getSalesByMonth(int storeNo, LocalDate startDate, LocalDate endDate) {
        return circulationMapper.selectSalesMonth(storeNo,startDate,endDate);
    }

    //매출집계 - 초기
    @Override
    public List<Circulation> getDetailsByDate(String date, int storeNo) {
        if (date.length() == 4) {
            return circulationMapper.getDetailsByYear(date, storeNo);
        } else if (date.length() == 10) {
            return circulationMapper.getDetailsByDate(date, storeNo);
        } else {
            throw new IllegalArgumentException("올바르지 않은 날짜 형식입니다: " + date);
        }
    }


    @Override
    public int searchExpiryListCount(String searchExpiry, String keyword,int storeNo) {
        return expiryMapper.searchExpiryListCount(searchExpiry, keyword, storeNo);
    }


    @Override
    public ArrayList<Product> spotSelectAllProduct(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.selectAllProduct(rowBounds);
    }
    @Override
    public ArrayList<Product> spotSearchProduct(String inputcheck, String condition, String keyword, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.spotSearchProduct(inputcheck, condition, keyword, rowBounds );
    }

    @Override
    public int spotSearchProductCount(String inputcheck, String condition, String keyword) {
        int result =  productMapper.spotSearchProductCount(inputcheck,condition,keyword);
        return result;
    }
    @Override
    public int selectAnnouncementCount() {
        return announcementMapper.selectAnnouncementCount();
    }

    @Override
    public ArrayList<Announcement> selectAnnouncementlist(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return announcementMapper.selectAnnouncementlist(rowBounds);
    }


    @Override
    public int selectOutputCount(int storeNo) {
        return circulationMapper.selectOutputCount(storeNo);
    }

    @Override
    public ArrayList<Circulation> selectOutputList(int storeNo, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
        return circulationMapper.selectOutputList(storeNo,rowBounds);
    }

    @Override
    public int searchOutputCount(int storeNo, String since, String until, int status, String searchOutput, String keyword) {
        return circulationMapper.searchOutputCount(storeNo,since,until,status,searchOutput,keyword);
    }

    @Override
    public ArrayList<Circulation> searchOutputList(int storeNo, String since, String until, int status, String searchOutput, String keyword, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
        return circulationMapper.searchOutputList(storeNo,since,until,status,searchOutput,keyword,rowBounds);
    }


    @Override
    public int inventoryCount(int storeNo) {
        return inventoryMapper.inventoryCount(storeNo);
    }

    @Override
    public ArrayList<Inventory> selectInventory(PageInfo pi, int storeNo) {

        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return inventoryMapper.selectInventory(rowBounds,storeNo);
    }

    @Override
    public int searchInventoryCount(int storeNo, String condition, String keyword, int check) {
        return inventoryMapper.searchInventoryCount(storeNo,condition,keyword,check);
    }

    @Override
    public ArrayList<Inventory> searchInventory(PageInfo pi, int storeNo, String condition, String keyword, int check) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return inventoryMapper.searchInventory(rowBounds,storeNo,condition,keyword,check);
    }

    //페이징 처리 - 근퇴관리
    @Override
    public int getSpotAttendanceCount(int storeNo) {
        return attendanceMapper.getSpotAttendanceCount(storeNo);
    }
    @Override
    public List<Attendance> getSpotAttendanceList(int storeNo, int cpage, int limit) {
        int startRow = (cpage - 1) * limit + 1;
        int endRow = cpage * limit;

        Map<String, Object> param = new HashMap<>();
        param.put("storeNo", storeNo);
        param.put("startRow", startRow);
        param.put("endRow", endRow);

        return attendanceMapper.getSpotAttendanceList(param);
    }

    //페이징 처리 - 매출집계
    @Override
    public int countSalesByMonth(int storeNo, LocalDate startDate, LocalDate endDate) {
        return circulationMapper.countSalesByMonth(storeNo, startDate, endDate);
    }
    @Override
    public List<Circulation> selectSalesMonthWithPaging(int storeNo, LocalDate startDate, LocalDate endDate, int offset, int limit) {
        return circulationMapper.selectSalesMonthWithPaging(storeNo, startDate, endDate, offset, limit);
    }




    //대시보드 - Best3
    @Override
    public ArrayList<Circulation> spotSalesBestList(int storeNo) {

        LocalDate now = LocalDate.now();
        LocalDate startDate = now.withDayOfMonth(1);
        LocalDate endDate = now.withDayOfMonth(now.lengthOfMonth());

        return circulationMapper.spotSalesBestList(storeNo, startDate, endDate);
    }
    //대시보드 - Worst3
    @Override
    public ArrayList<Circulation> spotSalesWorstList(int storeNo) {

        LocalDate now = LocalDate.now();
        LocalDate startDate = now.withDayOfMonth(1);
        LocalDate endDate = now.withDayOfMonth(now.lengthOfMonth());

        return circulationMapper.spotSalesWorstList(storeNo, startDate, endDate);
    }

    @Override
    public int selectdashInventoryCount(int storeNo) {
        return inventoryMapper.selectdashInventoryCount(storeNo);
    }

    @Override
    public ArrayList<Announcement> selectdashAnnouncementlist() {
        return announcementMapper.selectdashAnnouncementlist();
    }

    @Override
    public ArrayList<Circulation> selectdashCirculationDispose(int storeNo) {
        return circulationMapper.selectdashCirculationDispose(storeNo);
    }

}
