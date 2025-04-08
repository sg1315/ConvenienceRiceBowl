package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;
import com.kh.project.cse.boot.domain.vo.Expiry;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.mappers.AttendanceMapper;
import com.kh.project.cse.boot.mappers.ExpiryMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class SpotServiceImpl implements SpotService {
    private final AttendanceMapper attendanceMapper;
    private final ExpiryMapper expiryMapper;

    @Override
    public int selectExpiryCount() {
        return expiryMapper.selectExpiryCount();
    }

    @Override
    public ArrayList<Expiry> selectExpiryList(PageInfo pi) {

        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());

        return expiryMapper.selectExpiryList(rowBounds);
    }

    @Override
    public List<Attendance> selectInfoList() {
        return attendanceMapper.selectInfoList();
    }

    @Override
    public int updateWorkTime(Attendance attendance) {
        return attendanceMapper.updateWorkTime(attendance);
    }



}
