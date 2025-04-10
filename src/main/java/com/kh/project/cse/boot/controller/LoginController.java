package com.kh.project.cse.boot.controller;

import com.kh.project.cse.boot.service.MemberService;
import com.kh.project.cse.boot.domain.vo.Member;
import com.kh.project.cse.boot.domain.vo.Store;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequiredArgsConstructor
@Controller
public class LoginController {
    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    //유하
    @RequestMapping("/loginForm")
    public String loginForm() {
        return "login/loginForm";
    }
    @GetMapping("/logout.me")
    public String logout(HttpSession session) {
        session.setAttribute("alertMsg", "로그아웃 완료");
        session.removeAttribute("loginMember");
        return "redirect:/loginForm";
    }

    @PostMapping("/login.me")
    public ModelAndView login(Member member, ModelAndView mv, HttpSession session) {
        Member loginMember = memberService.loginMember(member.getMemberId());
        System.out.println(loginMember);

        if(loginMember == null){
            mv.addObject("alertMsg", "계정을 찾을 수 없습니다.");
            mv.setViewName("login/loginForm");
        } else if (!bCryptPasswordEncoder.matches(member.getMemberPwd(),loginMember.getMemberPwd())) {
            // 평문/암호문
            mv.addObject("alertMsg", "비밀번호가 일치하지 않습니다.");
            mv.setViewName("login/loginForm");
        } else{
            String position = loginMember.getPosition();
            System.out.println("position:"+loginMember.getPosition());
            if(position.equals("1")){
                session.setAttribute("loginMember", loginMember);
                mv.setViewName("redirect:/head_order");
            } else if(position.equals("2")){
                int storeNo = loginMember.getStoreNo();
                int result = 0;
                result = memberService.checkStoreStatus(storeNo);
                if(result > 0){
                    session.setAttribute("loginMember", loginMember);
                    mv.setViewName("redirect:/spot_dashboard");
                } else {
                    session.setAttribute("alertMsg", "아직 지점이 승인되지않은 상태입니다.");
                    mv.setViewName("redirect:/loginForm");
                }
            } else {
                session.setAttribute("loginMember", loginMember);
                mv.setViewName("redirect:/spot_dashboard");
            }
        }
        return mv;
    }
    @PostMapping("/insert.me")
    public ModelAndView insertMember(Member member, ModelAndView mv, HttpSession session) {
        System.out.println("멤버:"+member);
        String pwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
        // 비번 암호화
        member.setMemberPwd(pwd);

        //주민번호 '-'넣기
        String ssn = member.getResidentNo();
        String residentNo = ssn.substring(0, 6) + "-" + ssn.substring(6);
        member.setResidentNo(residentNo);
        //휴대폰 '-' 넣기
        String pNo = member.getPhone();
        if(pNo != null){
            String formatted;
            if (pNo.length() == 11) {
                formatted = pNo.substring(0, 3) + "-" +
                        pNo.substring(3, 7) + "-" +
                        pNo.substring(7);
            } else { //pNo.length() == 10
                formatted = pNo.substring(0, 3) + "-" +
                        pNo.substring(3, 6) + "-" +
                        pNo.substring(6);
            }
            member.setPhone(formatted);
        } else {
            mv.addObject("alertMsg","폰번호를 올바르게 입력해주세요.");
            mv.setViewName("login/loginForm");
        }

        String position = member.getPosition();
        String storeName = member.getStoreName();
        int result = 0;

        if(position.equals("2")){
            result = memberService.insertStore(storeName);
            if(result > 0){
                result = memberService.insertMember(member);
            } else {
                mv.addObject("alertMsg","지점 생성 오류가 발생하였습니다.");
                mv.setViewName("login/loginForm");
            }
        } else {
                result = memberService.insertMember(member);
        }
        
        //메세지 구현해야됨!
        if(result > 0){
            session.setAttribute("alertMsg","성공적으로 회원가입을 완료하였습니다.");
            mv.setViewName("redirect:/loginForm");
        } else{
            mv.addObject("alertMsg","회원가입 실패");
            mv.setViewName("login/loginForm");
        }
        return mv;
    }
}
