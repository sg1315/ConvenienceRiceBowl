package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;
import com.kh.project.cse.boot.domain.vo.Expiry;
import com.kh.project.cse.boot.domain.vo.PageInfo;

import java.util.ArrayList;
import java.util.List;

public interface SpotService {
    int selectExpiryCount(int storeNo);

    List<Attendance> selectInfoList();

    ArrayList<Expiry> selectExpiryList(int storeNo,PageInfo pi);


    int updateWorkTime(Attendance attendance);

    int Expiry(int storeNo, int productNo, int inventoryCount, String expirationDate);
}
