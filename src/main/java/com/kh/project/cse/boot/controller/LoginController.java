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

    @PostMapping("/insert.me")
    public String insertMember(Member member, Model model, HttpSession session) {
        String pwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
        // 비번 암호화
        member.setMemberPwd(pwd);
        int result = memberService.insertMember(member);

        //메세지 구현해야됨!
        if(result > 0){
            session.setAttribute("alertMsg","성공적으로 회원가입을 완료하였습니다.");
            return "login/loginForm";
        } else{
            model.addAttribute("errorMsg","회원가입 실패");
            return "login/loginForm";
        }

    }
}
