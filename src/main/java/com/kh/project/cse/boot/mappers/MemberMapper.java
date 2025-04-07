package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface MemberMapper {
    int insertMember(Member member);
    int insertMembers(Member member);

    Member loginMember(@Param("memberId") String memberId);

    int idCheck(@Param("checkId") String checkId);

    int updateMember(Member member);

    Member selectMemberById(@Param("memberId") String memberId);

    int updateMemberStatus(Member member);

    List<Member> selectMemberList();

    int memberListCount();

    ArrayList<Member> selectHeadMemberList(RowBounds rowBounds);

    ArrayList<Member> searchMember(String condition, String keyword, RowBounds rowBounds);

    int updateHeadMember(Member member);
}
