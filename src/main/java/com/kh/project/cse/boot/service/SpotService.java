package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface SpotService {
    //근태정보 조회 - 초기화면
    List<Attendance> selectInfoList();
    //근태정보 - 모달 수정버튼
    int updateWorkTime(Attendance attendance);

    //근태관리 - 출퇴근시간 업데이트
    int updateWorkingTime(Map<String, Object> paramMap); //출근
    int updateLeaveTime(Map<String, Object> paramMap); //퇴근
}
