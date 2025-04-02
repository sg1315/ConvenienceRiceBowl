package com.kh.project.cse.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {

        return "index";
    }

    //택봉-발주
    @RequestMapping("/spot_order")
    public String spot_order() {
        return "order";
    }
    //택봉

    //성진 본사-발주 관리
    @RequestMapping("/head_order1")
    public String home3() {
        return "headOrder";
    }
    //성진

    //성진 본사-공지사항
    @RequestMapping("/head_announcement")
    public String head_announcement() { return "headAnnouncement";}
    //성진

    //성진 본사-상품관리
    @RequestMapping("/head_product")
    public String head_product() { return "headProduct";}
    //

    //성진 본사-상품관리
    @RequestMapping("/head_store")
    public String head_store() { return "headStore";}
    //
    //성진 본사-상품관리
    @RequestMapping("/head_member")
    public String head_member() { return "headMember";}
    //

    //승기 지점-대시보드
    @RequestMapping("/spot_dashboard")
    public String spot_dashboard() {
        return "spotDashboard";
    }
    //승기

    //승기 지점-상품목록
    @RequestMapping("/spot_product")
    public String spot_product() {
        return "spotProduct";
    }
    //승기

    //승기 지점-출고
    @RequestMapping("/spot_output")
    public String spot_output() {
        return "spotOutput";
    }
    //승기

    //승기 지점-매출 연단위
    @RequestMapping("/spot_salesYear")
    public String spot_salesYear() {
        return "spotSalesYear";
    }

    //택봉-직원관리
    @RequestMapping("/spot_member")
    public String spot_member() {
        return "spotMember";
    }
    //택봉

    //인혜
    @RequestMapping("/spot_attendance")
    public String spot_attendance() {
        return "spotAttendance";
    }


    //인혜
    @RequestMapping("/spot_inventory")
    public String spot_inventory() {
        return "spotInventory";
    }

    @RequestMapping("/spot_notice")
    public String spot_notice() {
        return "spotNotice";
    }
    @RequestMapping("/spot_sales")
    public String spot_sales() {
        return "spotSales";
    }




    //유하
    @RequestMapping("/loginForm")
    public String loginForm() {
        return "login/loginForm";
    }
    

    //성진-유통기한관리
    @RequestMapping("/spot_expiration")
    public String spot_expiration() {
        return "sporExpiration";
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
}
