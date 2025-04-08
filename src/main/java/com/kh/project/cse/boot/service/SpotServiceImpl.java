package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;
import com.kh.project.cse.boot.mappers.AttendanceMapper;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class SpotServiceImpl implements SpotService {
    private final AttendanceMapper attendanceMapper;

    public SpotServiceImpl(AttendanceMapper attendanceMapper) {
        this.attendanceMapper = attendanceMapper;
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


}
