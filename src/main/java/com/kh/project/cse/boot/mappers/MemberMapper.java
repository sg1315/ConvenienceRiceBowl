package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapper {
    int insertMember(Member member);
    int insertMembers(Member member);

    Member loginMember(@Param("memberId") String memberId);

    int idCheck(@Param("checkId") String checkId);
    //개인정보수정
    int updateMember(Member member);
    Member selectMemberById(@Param("memberId") String memberId);
    int updateMemberStatus(Member member);

    int memberListCount();

    ArrayList<Member> selectHeadMemberList(RowBounds rowBounds);

    ArrayList<Member> searchMember(String condition, String keyword, RowBounds rowBounds);


    int deleteMember(String memberNumber);

    int searchMemberListCount(String condition, String keyword);

    //페이징 처리 - 직원정보 시작
    int getSearchCountKeyWord(String keyword);
    List<Member> selectMemberByKeyword(Map<String, Object> param);
    int getSpotMemberCount();
    List<Member> getSpotMemberList(Map<String, Integer> param);
    //페이징 처리 - 직원정보 끝
}
