package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;
import com.kh.project.cse.boot.domain.vo.Expiry;
import com.kh.project.cse.boot.domain.vo.PageInfo;

import java.util.ArrayList;
import java.util.List;

public interface SpotService {
    int selectExpiryCount();

    List<Attendance> selectInfoList();

    ArrayList<Expiry> selectExpiryList(PageInfo pi);


    int updateWorkTime(Attendance attendance);
}
