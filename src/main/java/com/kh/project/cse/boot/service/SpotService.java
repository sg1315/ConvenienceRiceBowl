package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface SpotService {
    List<Attendance> selectInfoList();


    int updateWorkTime(Attendance attendance);


    int updateWorkingTime(Map<String, Object> paramMap);

    int updateLeaveTime(Map<String, Object> paramMap);
}
