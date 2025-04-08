package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Attendance;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;

import java.util.List;
import java.util.Map;

@Mapper
public interface AttendanceMapper {

    @ResultMap("AttendanceMap")
    List<Attendance> selectInfoList();


    int updateWorkTime(Attendance attendance);

    int updateWorkingBtnTime(Map<String, Object> paramMap);

    int updateWorkLeaveBtnTime(Map<String, Object> paramMap);
}
