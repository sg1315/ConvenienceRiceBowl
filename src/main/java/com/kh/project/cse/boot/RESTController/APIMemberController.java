package com.kh.project.cse.boot.RESTController;



import com.kh.project.cse.boot.domain.vo.Store;
import com.kh.project.cse.boot.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

//RestController = Controller +  ResponseBody
// 모든 요청에 대한 응답을 뷰가 아닌 데이터로 직접 http객체에 하겠다.

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/member")
public class APIMemberController {

    private final MemberService memberService;

    @GetMapping("/id")
    public String checkMemberId(String checkId){
        int result = memberService.idCheck(checkId);
        if(result > 0){
            return "NNNNN";
        } else {
            return "NNNNY";
        }
    }
    @PostMapping("/selectStoreName")
    public ArrayList<Store> selectStoreName(){
        ArrayList<Store> storeNameList = memberService.selectStoreName();

        if(storeNameList != null){
            return storeNameList;
        } else {
            return null;
        }
    }
}
