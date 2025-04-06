package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Member;

public interface MemberService {
    int insertMember(Member member);

    Member loginMember(String memberId);

    int idCheck(String checkId);

    int insertStore(String storeName);

    int checkStoreName(String checkStore);

    int checkStoreStatus(int storeNo);

    int checkStore(String checkStore);
}
