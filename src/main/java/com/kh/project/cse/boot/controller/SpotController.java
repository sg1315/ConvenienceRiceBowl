package com.kh.project.cse.boot.controller;

import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.domain.vo.Circulation;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.service.SpotService;
import com.kh.project.cse.boot.service.SpotServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.ResourceTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String spot_order(@RequestParam(defaultValue = "1") int cpage,Model model) {

        int listCount = spotService.ProductListCount();
        PageInfo pi = new PageInfo(listCount, cpage, 5, 10);

        List<Category> clist = spotService.orderRequestCategoryList();
        ArrayList<Product> plist = spotService.orderRequestProductList(pi);

        model.addAttribute("pi", pi);

        model.addAttribute("clist", clist);
        model.addAttribute("plist", plist);
        return "spot/spotOrder";
    }
    @GetMapping("/spot_order/productSearch")
    @ResponseBody
    public ArrayList<Product> productSearch(@RequestParam(defaultValue = "1") int cpage, @RequestParam("category") String category, @RequestParam("keyword") String keyword, Model model) {
        int listCount = spotService.ProductListCount();
        PageInfo pi = new PageInfo(listCount, cpage, 5, 10);

        ArrayList<Product> slist = spotService.orderRequestProductSearch(category, keyword, pi);

        model.addAttribute("slist", slist);
        model.addAttribute("pi", pi);
        return slist;
    }
    @PostMapping("/spot_order/requestOrder")
    public ResponseEntity<String> requestOrder(@RequestBody List<Circulation> orderList) {
        for (Circulation c : orderList) {
            System.out.println("상품번호: " + c.getProductNo());
            System.out.println("수량: " + c.getCirculateionAmount());
            System.out.println("입고가: " + c.getInputPrice());
            System.out.println("판매가: " + c.getSalePrice());
            System.out.println("--------------------");
        }
        return ResponseEntity.ok("발주 요청 완료");
    }


    //입고
    @RequestMapping("/spot_input")
    public String spot_input() { return "spot/spotInput"; }

}
