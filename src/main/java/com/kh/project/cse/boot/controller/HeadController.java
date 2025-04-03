package com.kh.project.cse.boot.controller;


import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.service.HeadService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class HeadController {

    private final HeadService headService;

    //성진 본사-로그인
    @RequestMapping("/head_member")
    public String head_member() { return "head_office/headMember";}
    //
    //본사 주문
    @RequestMapping("/head_order")
    public String home3() {
        return "head_office/headOrder";
    }
    //성진

    //성진 본사-공지사항
    @RequestMapping("/head_announcement")
    public String head_announcement() { return "head_office/headAnnouncement";}
    //성진

    //성진 본사-상품관리
    @RequestMapping("/head_product")
    public String head_product() { return "head_office/headProduct";}



    //성진 본사-상품관리
    @RequestMapping("/head_store")
    public String head_store() { return "head_office/headStore";}
    //

}
