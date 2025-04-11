package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Circulation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.time.LocalDate;
import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Date;

@Mapper
public interface CirculationMapper {

    //본사
    int selectcirculation();


    ArrayList<Circulation> selectCirculationlist(RowBounds rowBounds);

    ArrayList<Circulation> getOderDetail(@Param("setNo") String setNo);
    //발주승인 미승인
    int updateheadorder(@Param("setNo") String setNo, @Param("status") int status);

    //지난달 발주내역
    List<Circulation> head_lastorder(@Param("start")LocalDate start,@Param("end") LocalDate end);

    //발주목록검색
    int circulationSearchListCount(String setNo,  Date startDate, Date endDate);
    ArrayList<Circulation> circulationSearchList(RowBounds rowBounds, @Param("setNo") String setNo, @Param("startDate") Date startDate, @Param("endDate") Date endDate);


    //지점
    //발주 요청
    int insertOrder(@Param("circulation") Circulation circulation, int storeNo, String setNo);

    //발주 요청 목록
    //발주 요청 분단위로 묶은 수
    int orderRequestListCount(@Param("storeNo") int storeNo);
    ArrayList<Circulation> orderRequestList(RowBounds rowBounds, int storeNo);

    //발주 요청 서치 목록
    //검색한 발주 요청 분단위로 묶은 수
    int orderSearchListCount(@Param("storeNo") int storeNo, String setNo, Integer status, Date startDate, Date endDate);
    ArrayList<Circulation> orderSearchList(RowBounds rowBounds, @Param("storeNo") int storeNo, @Param("setNo") String setNo, @Param("status") Integer status, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
    //발주 요청 상세
    ArrayList<Circulation> spotOrderDetail(@Param("setNo") String setNo);
    //발주 요청 취소
    int cancelOrder(@Param("setNo") String setNo, int storeNo);

    //입고 목록
    //입고 setNo으로 묶은 수
    int inputListCount(@Param("storeNo") int storeNo);
    ArrayList<Circulation> inputList(RowBounds rowBounds, int storeNo);

    //입고 서치 목록
    //검색한 입고 setNo으로 묶은 수
    int inputSearchListCount(@Param("storeNo") int storeNo, String setNo, Integer status, Date startDate, Date endDate);
    ArrayList<Circulation> inputSearchList(RowBounds rowBounds, @Param("storeNo") int storeNo, @Param("setNo") String setNo, @Param("status") Integer status, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

    //입고 상세
    ArrayList<Circulation> inputDetail(@Param("setNo") String setNo);
    //입고 완료
    int insertInput(@Param("circulation") Circulation circulation, int storeNo);

    //매출집계 - 페이징
    int countSalesByMonth(@Param("storeNo") int storeNo,
                          @Param("startDate") LocalDate startDate,
                          @Param("endDate") LocalDate endDate);

    List<Circulation> selectSalesMonthWithPaging(@Param("storeNo") int storeNo,
                                                 @Param("startDate") LocalDate startDate,
                                                 @Param("endDate") LocalDate endDate,
                                                 @Param("offset") int offset,
                                                 @Param("limit") int limit);

    //매출집계 - 검색
    List<Circulation> selectSalesMonth(@Param("storeNo") int storeNo,
                                       @Param("startDate") LocalDate startDate,
                                       @Param("endDate") LocalDate endDate);
    //매출집계 - 모달
    List<Circulation> getDetailsByDate(@Param("date") String date, int storeNo);
    //매출집계 - 년도 초기 및 검색
    List<Circulation> getDetailsByYear(@Param("year") String year, int storeNo);

    //유통기한폐기
    int insertExpiry(@Param("storeNo") int storeNo, @Param("productNo") int productNo, @Param("inventoryCount") int inventoryCount);

    int posCirculationInsert(Circulation circulation);



    int selectOutputCount(@Param("storeNo") int storeNo);

    ArrayList<Circulation> selectOutputList(@Param("storeNo") int storeNo, RowBounds rowBounds);

    int searchOutputCount(@Param("storeNo")int storeNo,@Param("since") String since,@Param("until") String until,
                          @Param("status") int status,@Param("searchOutput") String searchOutput,@Param("keyword") String keyword);

    ArrayList<Circulation> searchOutputList(@Param("storeNo")int storeNo,@Param("since") String since,@Param("until") String until,
                                            @Param("status") int status,@Param("searchOutput") String searchOutput,@Param("keyword") String keyword, RowBounds rowBounds);


    ArrayList<Circulation> spotSalesBestList(@Param("storeNo") int storeNo, LocalDate startDate, LocalDate endDate);
    ArrayList<Circulation> spotSalesWorstList(@Param("storeNo") int storeNo, LocalDate startDate, LocalDate endDate);

    ArrayList<Circulation> selectdashCirculationDispose(int storeNo);
}
