package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Member;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.domain.vo.Store;
import com.kh.project.cse.boot.mappers.MemberMapper;
import com.kh.project.cse.boot.mappers.StoreMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
    public  final MemberMapper memberMapper;
    public  final StoreMapper storeMapper;

    @Override
    public int insertMember(Member member) {
        int StoreNo = member.getStoreNo();
        System.out.println(StoreNo);
        if(StoreNo > 0){
            return memberMapper.insertMembers(member);
        }else{
            return memberMapper.insertMember(member);
        }
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
        return storeMapper.checkStoreName(checkStore);
    }

    @Override
    public int checkStoreStatus(int storeNo) {
        return storeMapper.checkStoreStatus(storeNo);
    }

    @Override
    public Store checkStore(Store Store) {return storeMapper.checkStore(Store);}
    //개인정보수정
    @Override
    public int updateMember(Member member) {
        return memberMapper.updateMember(member);
    }
    @Override
    public Member selectMemberById(String memberId) {
        return memberMapper.selectMemberById(memberId);
    }
    @Override
    public int updateMemberStatus(Member member) {
        return memberMapper.updateMemberStatus(member);
    }

    @Override
    public int memberListCount() {
        return memberMapper.memberListCount();
    }

    @Override
    public ArrayList<Member> selectHeadMemberList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return memberMapper.selectHeadMemberList(rowBounds);
    }

    @Override
    public ArrayList<Member> searchMember(String condition, String keyword, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return memberMapper.searchMember(condition,keyword,rowBounds);
    }

    @Override
    public ArrayList<Store> selectStoreName() {
        return storeMapper.selectStoreName();
    }
    @Override
    public int searchMemberListCount(String condition, String keyword) {

        return memberMapper.searchMemberListCount(condition,keyword);
    }

    // 페이징 처리 - 직원정보 시작
    @Override
    public int getSearchCount(String keyword) {
        return memberMapper.getSearchCountKeyWord(keyword);
    }

    @Override
    public List<Member> selectMemberByKeyword(String keyword, int cpage, int limit) {
        int startRow = (cpage - 1) * limit + 1;
        int endRow = cpage * limit;

        Map<String, Object> param = new HashMap<>();
        param.put("keyword", keyword);
        param.put("startRow", startRow);
        param.put("endRow", endRow);

        return memberMapper.selectMemberByKeyword(param);
    }

    @Override
    public int getSpotMemberCount() {
        return memberMapper.getSpotMemberCount();
    }

    @Override
    public List<Member> getSpotMemberList(int cpage, int limit) {
        int startRow = (cpage - 1) * limit + 1;
        int endRow = cpage * limit;

        Map<String, Integer> param = new HashMap<>();
        param.put("startRow", startRow);
        param.put("endRow", endRow);

        return memberMapper.getSpotMemberList(param);
    }
    // 페이징 처리 - 직원정보 끝


}
