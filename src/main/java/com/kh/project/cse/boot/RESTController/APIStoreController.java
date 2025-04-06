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
    public String CheckStore(String checkStore){
        System.out.println("checkStore:"+checkStore);

        int result = memberService.checkStoreName(checkStore);

        if(result > 0){
            return "NNNNN";
        } else {
            return "NNNNY";
        }
    }
}
