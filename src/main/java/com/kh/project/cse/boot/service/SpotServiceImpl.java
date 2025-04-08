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

    @Override
    public List<Attendance> selectInfoList() {
        return attendanceMapper.selectInfoList();
    }

    @Override
    public int updateWorkTime(Attendance attendance) {
        return attendanceMapper.updateWorkTime(attendance);
    }

    @Override
    public int updateWorkingTime(Map<String, Object> paramMap) {
        return attendanceMapper.updateWorkingBtnTime(paramMap);
    }

    @Override
    public int updateLeaveTime(Map<String, Object> paramMap) {
        return attendanceMapper.updateWorkLeaveBtnTime(paramMap);
    }


}
