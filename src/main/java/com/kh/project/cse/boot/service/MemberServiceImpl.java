package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Member;
import com.kh.project.cse.boot.mapper.MemberMapper;
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
}
