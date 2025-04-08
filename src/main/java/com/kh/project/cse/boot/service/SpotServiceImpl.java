package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Attendance;
import com.kh.project.cse.boot.domain.vo.Expiry;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.mappers.AttendanceMapper;
import com.kh.project.cse.boot.mappers.ExpiryMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Transactional
@RequiredArgsConstructor
@Service
public class SpotServiceImpl implements SpotService {
    private final AttendanceMapper attendanceMapper;
    private final ExpiryMapper expiryMapper;

    @Override
    public int selectExpiryCount(int storeNo) {
        return expiryMapper.selectExpiryCount(storeNo);
    }

    @Override
    public ArrayList<Expiry> selectExpiryList(int storeNo,PageInfo pi) {

        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());

        return expiryMapper.selectExpiryList(storeNo, rowBounds);
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
    public int Expiry(int storeNo, int productNo, int inventoryCount, String expirationDate) {
        System.out.println(storeNo +" "+ productNo +" "+ inventoryCount +" "+ expirationDate);
        int result = 0;
        result = expiryMapper.insertExpiry(storeNo,productNo,inventoryCount);
        System.out.println("result:"+ result);
        if(result>0){
            return expiryMapper.deleteExpiry(storeNo,productNo,expirationDate);
        }
        return 0;
    }


}
