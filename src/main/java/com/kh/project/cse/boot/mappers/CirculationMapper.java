package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Announcement;
import com.kh.project.cse.boot.domain.vo.Circulation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.time.LocalDate;
import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface CirculationMapper {


    int selectcirculation();


    ArrayList<Circulation> selectCirculationlist(RowBounds rowBounds);

    ArrayList<Circulation> getOderDetail(@Param("setNo") String setNo);

    //지점
    //발주 요청
    int insertOrder(@Param("circulation") Circulation circulation, int storeNo, String setNo);

    //발주 요청 목록
    //발주 요청 분단위로 묶은 수
    int orderRequestListCount(@Param("storeNo") int storeNo);
    ArrayList<Circulation> orderRequestList(RowBounds rowBounds, int storeNo);

    //매출집계 - 검색
    List<Circulation> selectSalesMonth(@Param("storeNo") int storeNo,
                                       @Param("startDate") LocalDate startDate,
                                       @Param("endDate") LocalDate endDate);

}
