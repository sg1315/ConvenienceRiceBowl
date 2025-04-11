package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Attendance;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;

import java.util.List;
import java.util.Map;

@Mapper
public interface AttendanceMapper {
    //근태정보 - 모달 수정버튼
    int updateWorkTime(Attendance attendance);
    //근태관리 - 출퇴근시간 업데이트
    int insertWorkingTime(Map<String, Object> paramMap); //출근
    int updateWorkLeaveBtnTime(Map<String, Object> paramMap); //퇴근
    //근태관리 - 출퇴근 상태 가져오기
    int getAttendanceStatus(@Param("memberId")String memberId);


    //페이징 처리 - 근퇴관리
    @ResultMap("AttendanceMap")
    int getSpotAttendanceCount(int storeNo);
    List<Attendance> getSpotAttendanceList(Map<String, Object> param);

}
