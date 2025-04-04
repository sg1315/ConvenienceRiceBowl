package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Member;
import org.apache.ibatis.annotations.Param;

public interface MemberService {
    int insertMember(Member member);

    Member loginMember(@Param("memberId") String memberId);

    int idCheck(@Param("checkId") String checkId);

    int insertStore(@Param("storeName") String storeName);
}
