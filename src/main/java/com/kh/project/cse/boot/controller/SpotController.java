package com.kh.project.cse.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SpotController {

    //승기 지점-대시보드
    @RequestMapping("/spot_dashboard")
    public String spot_dashboard() {
        return "spot/spotDashboard";
    }
    //승기

    //승기 지점-상품목록
    @RequestMapping("/spot_product")
    public String spot_product() {
        return "spot/spotProduct";
    }
    //승기

    //승기 지점-출고
    @RequestMapping("/spot_output")
    public String spot_output() {
        return "spot/spotOutput";
    }
    //승기

    //승기 지점-매출 연단위
    @RequestMapping("/spot_salesYear")
    public String spot_salesYear() {
        return "spot/spotSalesYear";
    }

    //택봉-직원관리
    @RequestMapping("/spot_member")
    public String spot_member() {
        return "spot/spotMember";
    }
    //택봉

    //인혜
    @RequestMapping("/spot_attendance")
    public String spot_attendance() {
        return "spot/spotAttendance";
    }


    //인혜
    @RequestMapping("/spot_inventory")
    public String spot_inventory() {
        return "spot/spotInventory";
    }

    @RequestMapping("/spot_notice")
    public String spot_notice() {
        return "spot/spotNotice";
    }
    @RequestMapping("/spot_sales")
    public String spot_sales() {
        return "spot/spotSales";
    }

    //성진-유통기한관리
    @RequestMapping("/spot_expiration")
    public String spot_expiration() {
        return "spot/sporExpiration";
    }
    //성진



    @RequestMapping("/inputmodal")
    public String inputmodal() {
        return "spotInputmodal";
    }

    @RequestMapping("/receiving")
    public String receiving() {
        return "receiving/receivingDetailsForm";
    }

    //택봉-발주
    @RequestMapping("/spot_order")
    public String spot_order() {
        return "spot/spotOrder";
    }
    //택봉

}
