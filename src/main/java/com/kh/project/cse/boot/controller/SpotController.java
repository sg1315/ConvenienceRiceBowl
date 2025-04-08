package com.kh.project.cse.boot.controller;

import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.domain.vo.Circulation;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.service.SpotService;
import com.kh.project.cse.boot.service.SpotServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.ResourceTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class SpotController {

    private final ResourceTransactionManager resourceTransactionManager;
    private final SpotService spotService;

    //대시보드
    @RequestMapping("/spot_dashboard")
    public String spot_dashboard() {
        return "spot/spotDashboard";
    }

    //상품목록
    @RequestMapping("/spot_product")
    public String spot_product() {
        return "spot/spotProduct";
    }

    //출고
    @RequestMapping("/spot_output")
    public String spot_output() {
        return "spot/spotOutput";
    }

    //년매출
    @RequestMapping("/spot_salesYear")
    public String spot_salesYear() {
        return "spot/spotSalesYear";
    }

    //멤버관리
    @RequestMapping("/spot_member")
    public String spot_member() {
        return "spot/spotMember";
    }

    //근태관리
    @RequestMapping("/spot_attendance")
    public String spot_attendance() {
        return "spot/spotAttendance";
    }

    //재고
    @RequestMapping("/spot_inventory")
    public String spot_inventory() {
        return "spot/spotInventory";
    }

    //공지사항
    @RequestMapping("/spot_notice")
    public String spot_notice() {
        return "spot/spotNotice";
    }

    //월매출
    @RequestMapping("/spot_sales")
    public String spot_sales() {
        return "spot/spotSales";
    }

    //유통기한
    @RequestMapping("/spot_expiration")
    public String spot_expiration() {
        return "spot/sporExpiration";
    }


    @RequestMapping("/inputmodal")
    public String inputmodal() {
        return "spotInputmodal";
    }

    @RequestMapping("/receiving")
    public String receiving() {
        return "receiving/receivingDetailsForm";
    }

    //발주
    @RequestMapping("/spot_order")
    public String spot_order(@RequestParam(defaultValue = "1") int cpage, Model model) {
        int storeNo = 2; //로그인으로 세션 저장 처리 된 후 session불러와서 가져올것.
        //circuration-mapper도 수정해야함

        int listCount = spotService.orderRequestListCount(storeNo);
        PageInfo pi = new PageInfo(listCount, cpage, 10,10);

        List<Category> clist = spotService.orderRequestCategoryList();
        ArrayList<Product> plist = spotService.orderRequestProductList();
        ArrayList<Circulation> olist = spotService.orderRequestList(pi, storeNo);

        model.addAttribute("clist", clist);
        model.addAttribute("plist", plist);
        model.addAttribute("olist", olist);
        return "spot/spotOrder";
    }
    @GetMapping("/spot_order/productSearch")
    @ResponseBody
    public ArrayList<Product> productSearch(@RequestParam("category") String category, @RequestParam("keyword") String keyword, Model model) {

        ArrayList<Product> slist = spotService.orderRequestProductSearch(category, keyword);

        model.addAttribute("slist", slist);
        return slist;
    }
    @PostMapping("/spot_order/requestOrder")
    public ResponseEntity<String> requestOrder(@RequestBody List<Circulation> orderList) {
        int storeNo = 2; //로그인으로 세션 저장 처리 된 후 session불러와서 가져올것.
        String setNo = storeNo + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));

        //circuration-mapper도 수정해야함
        int result = 0;

        result = spotService.insertOrder(orderList, storeNo, setNo);
        if (result > 0) {
            return ResponseEntity.ok("발주 요청 완료");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("발주 요청 실패");
        }
    }


    //입고
    @RequestMapping("/spot_input")
    public String spot_input() { return "spot/spotInput"; }

}
