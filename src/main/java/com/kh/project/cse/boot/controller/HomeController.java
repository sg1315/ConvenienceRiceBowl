package com.kh.project.cse.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {

        return "index";
    }

    //성진
    @RequestMapping("/head_order")
    public String home2() {
        return "spot/ordering";
    }
    //성진

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
}
