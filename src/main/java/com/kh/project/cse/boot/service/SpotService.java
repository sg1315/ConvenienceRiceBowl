package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;

import java.util.List;

public interface SpotService {
    List<Attendance> selectInfoList();
}
