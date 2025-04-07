package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;

import java.time.LocalDateTime;
import java.util.List;

public interface SpotService {
    List<Attendance> selectInfoList();


    int updateWorkTime(Attendance attendance);
}
