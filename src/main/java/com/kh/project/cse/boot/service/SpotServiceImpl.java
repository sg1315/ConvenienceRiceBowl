package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.*;
import com.kh.project.cse.boot.mappers.CirculationMapper;
import com.kh.project.cse.boot.mappers.ProductMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import com.kh.project.cse.boot.mappers.AttendanceMapper;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class SpotServiceImpl implements SpotService {
    private final AttendanceMapper attendanceMapper;
    private final ProductMapper productMapper;
    private final CirculationMapper circulationMapper;

    @Autowired
    public SpotServiceImpl(AttendanceMapper attendanceMapper, ProductMapper productMapper, CirculationMapper circulationMapper) {
        this.attendanceMapper = attendanceMapper;
        this.productMapper = productMapper;
        this.circulationMapper = circulationMapper;
    }
    //근태정보 조회 - 초기화면
    @Override
    public List<Attendance> selectInfoList() {
        return attendanceMapper.selectInfoList();
    }
    //근태정보 - 모달 수정버튼
    @Override
    public int updateWorkTime(Attendance attendance) {
        return attendanceMapper.updateWorkTime(attendance);
    }
    //근태관리 - 출퇴근시간 업데이트 //출근
    @Override
    public int updateWorkingTime(Map<String, Object> paramMap) {
        return attendanceMapper.updateWorkingBtnTime(paramMap);
    }
    //근태관리 - 출퇴근시간 업데이트 //퇴근
    @Override
    public int updateLeaveTime(Map<String, Object> paramMap) {
        return attendanceMapper.updateWorkLeaveBtnTime(paramMap);
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
    //발주 - 발주 요청
    @Override
    public int insertOrder(List<Circulation> orderList, int storeNo, String setNo) {

        int result = 1;

        for (Circulation circulation : orderList) {
            System.out.println();
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

    //매출집계 - 검색
    @Override
    public List<Circulation> getSalesByMonth(int storeNo, LocalDate startDate, LocalDate endDate) {
        return circulationMapper.selectSalesMonth(storeNo,startDate,endDate);
    }

    //매출집계 - 모달
    @Override
    public List<Circulation> getDetailsByDate(String date, int storeNo) {
        return circulationMapper.getDetailsByDate(date,storeNo);
    }

}
