package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;
import com.kh.project.cse.boot.mappers.AttendanceMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpotServiceImpl implements SpotService {
    private AttendanceMapper attendanceMapper;

    public SpotServiceImpl(AttendanceMapper attendanceMapper) {
        this.attendanceMapper = attendanceMapper;
    }

    @Override
    public List<Attendance> selectInfoList() {
        return attendanceMapper.selectInfoList();
    }



}
