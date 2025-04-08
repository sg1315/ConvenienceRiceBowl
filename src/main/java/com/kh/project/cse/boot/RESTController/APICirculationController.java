package com.kh.project.cse.boot.RESTController;

import com.kh.project.cse.boot.service.SpotService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/circulation")
public class APICirculationController {
    private final SpotService spotService;

    @GetMapping("/expiry")
    public String checkMemberId(int storeNo ,int productNo, int inventoryCount, String expirationDate){
        int result = spotService.Expiry(storeNo,productNo,inventoryCount,expirationDate);
        if(result > 0){
            return "NNNNY";
        } else {
            return "NNNNN";
        }
    }

}
