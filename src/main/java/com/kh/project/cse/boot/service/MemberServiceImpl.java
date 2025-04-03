package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Member;
import com.kh.project.cse.boot.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
    public  final MemberMapper memberMapper;
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
}
