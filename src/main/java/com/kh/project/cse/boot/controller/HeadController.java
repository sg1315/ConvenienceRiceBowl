package com.kh.project.cse.boot.controller;


import com.kh.project.cse.boot.domain.vo.*;
import com.kh.project.cse.boot.service.HeadService;
import com.kh.project.cse.boot.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class HeadController {
    private final HeadService headService;
    private final MemberService memberService;


    //
    //본사 발주
    @RequestMapping("/head_order")
    public String home3(@RequestParam(defaultValue = "1") int cpage, Model model) {

        int circulation = headService.selectcirculation();

        PageInfo pi = new PageInfo(circulation, cpage, 10 , 10);
        ArrayList<Circulation> list = headService.selectCirculationlist(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "head_office/headOrder";
    }
    //본사 발주 세부 사항
    @ResponseBody
    @GetMapping("/getOderDetail")
    public ArrayList<Circulation> getOderDetail(@RequestParam("sno") int sno) {
        ArrayList<Circulation> list = headService.getOderDetail(sno);
        return list;
    }

    //공지사항추가
    @PostMapping("/insertAnnouncement.he")
    public String insertAnnouncement(Announcement announcement, HttpSession session) {

        int result = headService.insertAnnouncement(announcement);

        return "redirect:/head_announcement";
    }

    //공지사항불러오기
    @GetMapping("/head_announcement")
    public String head_announcement(@RequestParam(defaultValue = "1") int cpage, Model model) {

        int announcementCount = headService.selectAnnouncementCount();

        PageInfo pi = new PageInfo(announcementCount, cpage, 10 , 12);
        ArrayList<Announcement> list = headService.selectAnnouncementlist(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "head_office/headAnnouncement";
    }

    //공지사항세부사항
    @ResponseBody
    @GetMapping("/getAnnouncementDetail")
    public Announcement getAnnouncementDetail(@RequestParam("ano") int ano) {
        Announcement announcement = headService.selectDetailAnnouncement(ano);
        return announcement;
    }



    //공지사항수정
    @PostMapping("updateAnnouncementDetail.he")
    public String updateAnnouncementDetail(@ModelAttribute Announcement announcement, HttpSession session) {
        int result = headService.updateAnnouncementDetail(announcement);
        return "redirect:/head_announcement";
    }
    //공지사항 검색
    @PostMapping("/searchAnnouncement")
    public String searchAnnouncement(@RequestParam(defaultValue = "1") int cpage, @RequestParam String condition, @RequestParam String keyword, Model model) {
        int listCount = headService.selectAnnouncementCount();
        PageInfo pi = new PageInfo(listCount,cpage, 10,12);

        ArrayList<Announcement> list = headService.searchAnnouncement(condition, keyword, pi);

        model.addAttribute("list",list);
        model.addAttribute("pi", pi);
        return "head_office/headAnnouncement";
    }
    //공지사항 삭제
    @PostMapping("deleteAnnouncement")
    public String deleteAnnouncement(@RequestParam("ano") int ano, HttpSession session){
        headService.deleteAnnouncement(ano);

        return "redirect:/head_announcement";

    }

    //댓글추가
    @PostMapping("insertReply")
    public String insertReply(Reply reply, HttpSession session) {
        headService.insertReply(reply);

        return "redirect:/head_announcement";
    }
    //댓글불러오기
    @GetMapping("replylist")
    @ResponseBody
    public List<Reply> replylist(@RequestParam("ano") int ano) {
        List<Reply> list = headService.selectReply(ano);
        return list;
    }

    //상품관리
    @RequestMapping("/head_product")
    public String head_product(@RequestParam(defaultValue = "1") int cpage,Model model) {
        int listCount = headService.ProductListCount();

        PageInfo pi = new PageInfo(listCount,cpage, 10,10);

        ArrayList<Product> list = headService.selectAllProduct(pi);
        model.addAttribute("list",list);
        model.addAttribute("pi", pi);
        return "head_office/headProduct";
    }

    //상품추가
    @PostMapping("/insertProduct.he")
    public String insertProduct(Product product, HttpSession session, Model model) {

        System.out.println(product);
        int result = headService.insertProduct(product);
        int cpage = 1;

        if (result >= 1){
            return head_product(cpage, model);
        }

        return "head_office/headProduct";
    }

    @PostMapping("/searchProduct")
    public String searchProduct(@RequestParam(defaultValue = "1") int cpage,@RequestParam String condition, @RequestParam String keyword, Model model) {
        int listCount = headService.ProductListCount();
        PageInfo pi = new PageInfo(listCount,cpage, 10,10);

        ArrayList<Product> list = headService.searchProduct(condition, keyword, pi);


        model.addAttribute("list",list);
        model.addAttribute("pi", pi);
        return "head_office/headProduct";
    }


    @PostMapping("/updateProduct")
    public String updateProduct(Product product, HttpSession session, Model model) {
        System.out.println(product);
        int result = headService.updateProduct(product);
        int cpage = 1;

        if (result >= 1){
            return head_product(1, model);
        }

        return "head_office/headProduct";
    }

    @RequestMapping("/head_store")
    public String head_store(@RequestParam(defaultValue = "1") int cpage,Model model) {
        int listCount = headService.storeListCount();

        PageInfo pi = new PageInfo(listCount,cpage, 10,10);

        ArrayList<Store> list = headService.selectStore(pi);
        model.addAttribute("list",list);
        model.addAttribute("pi", pi);

        return "head_office/headStore";}


    @PostMapping("/searchStore")
    public String searchStore(@RequestParam(defaultValue = "1") int cpage,@RequestParam String condition, @RequestParam String keyword, HttpSession session, Model model){

        int listCount = headService.storeListCount();
        PageInfo pi = new PageInfo(listCount,cpage, 10,10);

        ArrayList<Store> list = headService.searchStore(condition, keyword, pi);
        model.addAttribute("list",list);
        model.addAttribute("pi", pi);

        if(list == null){
            session.setAttribute("alertMsg", "실패");
            return null;
        }
        return "head_office/headStore";

    }


    //직원관리 - 전체목록
    @RequestMapping("/head_member")
    public String head_member(@RequestParam(defaultValue = "1") int cpage,HttpSession session, Model model) {

        int listCount = memberService.memberListCount();
        PageInfo pi = new PageInfo(listCount,cpage, 10,10);

        ArrayList<Member> list = memberService.selectHeadMemberList(pi);
        model.addAttribute("list",list);
        model.addAttribute("pi", pi);

        if(list == null){
            session.setAttribute("alertMsg", "실패");
            return null;
        }

        return "head_office/headMember";
    }
    //직원관리 - 검색
    @PostMapping("/searchMember")
    public String searchMember(@RequestParam(defaultValue = "1") int cpage,@RequestParam String condition, @RequestParam String keyword, HttpSession session, Model model) {
        int listCount = memberService.memberListCount();

        PageInfo pi = new PageInfo(listCount,cpage, 10,10);
        if(condition.equals("position")){
            keyword = newKeyword(keyword);
        }
        ArrayList<Member> list = memberService.searchMember(condition,keyword,pi);
        model.addAttribute("list",list);
        model.addAttribute("pi", pi);

        if(list == null){
            session.setAttribute("alertMsg", "실패");
            return null;
        }
        return "head_office/headMember";
    }
    private String newKeyword(String positionName) {
        switch (positionName.trim()) {
            case "본사":
                return "1";
            case "지점장":
                return "2";
            case "매니저":
                return "3";
            case "알바":
                return "4";
            default:
                return "";
        }
    }
    //직원관리 - 직원수정
    @PostMapping("/updateHeadMember")
    public String updateHeadMember(Member member, HttpSession session, Model model){
        String position =  member.getPosition();
        member.setPosition(newKeyword(position));
        int result = memberService.updateMemberStatus(member);

        if(result > 0){
            session.setAttribute("alertMsg", "수정 성공");
            return head_member(1, session, model);
        } else {
            session.setAttribute("alertMsg", "수정 실패");
            return null;
        }

    }

    //개인정보수정
    @PostMapping("/updateMemberInfo")
    @ResponseBody //테스트용(리턴 문자열 그대로 출력)
    public String updateMember(@RequestParam("currentPwd") String currentPwd, @RequestParam("newPwd") String newPwd,
                               Member member, HttpSession session, Model model) {

        Member loginMember = (Member) session.getAttribute("loginUser");

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        String encodedPwd = passwordEncoder.encode(newPwd);
//        member.setMemberPwd(encodedPwd);

        if (loginMember == null) return "로그인 정보 없음";

        member.setMemberPwd(member.getMemberPwd());

        if (newPwd != null && !newPwd.trim().isEmpty()) {
            member.setMemberPwd(passwordEncoder.encode(newPwd));
        } else {
            member.setMemberPwd(null); // 비밀번호 변경 안 함
        }

        member.setMemberId(loginMember.getMemberId());
        member.setMemberNo(loginMember.getMemberNo());

        int result = memberService.updateMember(member);
        System.out.println("result = " + result);

        if (result > 0) {
            Member updatedMember = memberService.selectMemberById(member.getMemberId());
            session.setAttribute("loginUser", updatedMember);
            return "업데이트 성공";
        } else {
            return "업데이트 실패";
        }
    }


}
