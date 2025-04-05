package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Member;
import com.kh.project.cse.boot.mappers.MemberMapper;
import com.kh.project.cse.boot.mappers.StoreMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
    public  final MemberMapper memberMapper;
    public  final StoreMapper storeMapper;

    @Override
    public int insertMember(Member member) {
        return memberMapper.insertMember(member);
    }

    @Override
    public Member loginMember(String memberId) {
        return memberMapper.loginMember(memberId);
    }

    @Override
    public int idCheck(String checkId) {
        return memberMapper.idCheck(checkId);
    }

    @Override
    public int insertStore(String storeName) {
        return storeMapper.insertStore(storeName);
    }

    @Override
    public int checkStoreName(String checkStore) {
        return storeMapper.checkStore(checkStore);
    }

    @Override
    public int updateMember(Member member) {
        return memberMapper.updateMember(member);
    }
    
    @Override
    public Member selectMemberById(String memberId) {
        return memberMapper.selectMemberById(memberId);
    }


}
