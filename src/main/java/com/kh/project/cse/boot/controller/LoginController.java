package com.kh.project.cse.boot.controller;

import com.kh.project.cse.boot.service.MemberService;
import com.kh.project.cse.boot.domain.vo.Member;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @PostMapping("/login.me")
    public ModelAndView login(Member member, ModelAndView mv, HttpSession session) {
        Member loginMember = memberService.loginMember(member.getMemberId());

        if(loginMember == null){
            mv.addObject("errorMsg", "아이디를 찾을 수 없습니다.");
            mv.setViewName("login/loginForm");
        } else if (!bCryptPasswordEncoder.matches(member.getMemberPwd(),loginMember.getMemberPwd())) {
            // 평문/암호문
            mv.addObject("errorMsg", "비밀번호가 일치하지 않습니다.");
            mv.setViewName("login/loginForm");
        } else{
            session.setAttribute("loginUser", loginMember);
            mv.setViewName("spot/Dashboard");
        }
        return mv;
    }
    @PostMapping("/insert.me")
    public ModelAndView insertMember(Member member, ModelAndView mv, HttpSession session) {
        String pwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
        // 비번 암호화
        member.setMemberPwd(pwd);
        int result = memberService.insertMember(member);

        //메세지 구현해야됨!
        if(result > 0){
            mv.addObject("alertMsg","성공적으로 회원가입을 완료하였습니다.");
            mv.setViewName("login/loginForm");
        } else{
            mv.addObject("errorMsg","회원가입 실패");
            mv.setViewName("login/loginForm");
        }
        return mv;
    }
}
