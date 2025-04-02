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
        return "spot/ordering";
    }
    //택봉

    //성진 본사-발주 관리
    @RequestMapping("/head_order1")
    public String home3() {
        return "head_office/order";
    }
    //성진

    //성진 본사-공지사항
    @RequestMapping("/head_announcement")
    public String head_announcement() { return "head_office/announcement";}
    //성진

    //성진 본사-상품관리
    @RequestMapping("/head_product")
    public String head_product() { return "head_office/product";}
    //

    //성진 본사-상품관리
    @RequestMapping("/head_store")
    public String head_store() { return "head_office/store";}
    //
    //성진 본사-상품관리
    @RequestMapping("/head_member")
    public String head_member() { return "head_office/member";}
    //

    //승기 지점-대시보드
    @RequestMapping("/dashboard")
    public String dashboard() {
        return "spot/dashboard";
    }
    //승기

    //승기 지점-상품목록
    @RequestMapping("/spotProduct")
    public String spotProduct() {
        return "spot/product";
    }
    //승기

    @RequestMapping("/spotOutput")
    public String spotOutput() {
        return "spot/output";
    }

    //택봉-직원관리
    @RequestMapping("/spot_member")
    public String spot_member() {
        return "spot/member";
    }
    //택봉

    //인혜
    @RequestMapping("/spot-attendance")
    public String attendance() {
        return "spot/attendance";
    }


    //인혜
    @RequestMapping("/spot-inventory")
    public String inventory() {
        return "spot/inventory";
    }

    @RequestMapping("/spot-notice")
    public String announcement() {
        return "spot/notice";
    }
    @RequestMapping("/spot-sales")
    public String sales() {
        return "spot/sales";
    }




    //유하
    @RequestMapping("/loginForm")
    public String loginForm() {
        return "login/loginForm";
    }

    //성진-유통기한관리
    @RequestMapping("/spot_expiration")
    public String spot_expiration() {
        return "spot/expiration";
    }
    //성진

}
