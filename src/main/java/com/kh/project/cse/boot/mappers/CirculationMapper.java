package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Announcement;
import com.kh.project.cse.boot.domain.vo.Circulation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.Date;

@Mapper
public interface CirculationMapper {

    int selectcirculation();

    ArrayList<Circulation> selectCirculationlist(RowBounds rowBounds);


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
}
