package com.kh.project.cse.boot.mapper;

import com.kh.project.cse.boot.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
    int insertMember(Member member);

    Member loginMember(@Param("memberId") String memberId);

    int idCheck(@Param("checkId") String checkId);
}
