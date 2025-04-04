package com.kh.project.cse.boot.RESTController;

import com.kh.project.cse.boot.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/store")
public class APIStoreController {
    private final MemberService memberService;

    @GetMapping("/name")
    public String checkMemberId(String checkStore){
        int result = memberService.checkStoreName(checkStore);
    }
}
