package com.kh.project.cse.boot.RESTController;

import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.domain.vo.Store;
import com.kh.project.cse.boot.mappers.StoreMapper;
import com.kh.project.cse.boot.service.HeadService;
import com.kh.project.cse.boot.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/store")
public class APIStoreController {
    private final MemberService memberService;
    private final HeadService headService;

    @GetMapping("/name")
    public String CheckStore(String checkStore,String position){
        System.out.println("checkStore:"+checkStore);
        int result =0;
        int storeNo =0;
        if(position.equals("2")){
            result = memberService.checkStoreName(checkStore);
            if(result > 0){
                return "NNNNN";
            } else {
                return "NNNNY";
            }
        } else {
            storeNo = memberService.checkStore(checkStore);
            if(storeNo > 0){
                return "NNNYY";
            } else {
                return "NNNYN";
            }
        }
    }
    @GetMapping("/selectStoreStatus")
    @ResponseBody
    public Map<String, Object> selectStoreStatus(@RequestParam(defaultValue = "1") int cpage) {
        int listCount = headService.storeListCount();
        PageInfo pi = new PageInfo(listCount, cpage, 10, 10); // pageLimit=10, boardLimit=2
        ArrayList<Store> list = headService.selectStoreStatus(pi);


        Map<String, Object> result = new HashMap<>();
        result.put("list", list);
        result.put("pi", pi); // PageInfo도 같이 전달

        return result;
    }
    @PostMapping("updateStoreStatus")
    public String updateStoreStatus(@RequestParam() String storeNo ){
        int result;
        String[] storeNumbers = storeNo.split("/");

        result = headService.updateStoreNo(storeNumbers);

        if(result>0){
           return "succes";
        }
        return "error";
    }


}
