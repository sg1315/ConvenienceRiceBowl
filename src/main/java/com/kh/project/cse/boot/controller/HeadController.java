package com.kh.project.cse.boot.controller;


import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.service.HeadService;
import com.kh.project.cse.boot.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class HeadController {
    private final HeadService headService;
    private final MemberService memberService;

    //성진 본사-로그인
    @RequestMapping("/head_member")
    public String head_member() {
        return "head_office/headMember";
    }
    //
    //본사 주문
    @RequestMapping("/head_order")
    public String home3() {
        return "head_office/headOrder";
    }
    //성진

    //성진 본사-공지사항
    @RequestMapping("/head_announcement")
    public String head_announcement() {
        return "head_office/headAnnouncement";
    }
    //성진



    //성진 본사-지점관리
    @RequestMapping("/head_store")
    public String head_store() { return "head_office/headStore";}
    //

    @RequestMapping("/head_product")
    public String head_product(Model model) {

        ArrayList<Product> list = headService.selectAllProduct();
        model.addAttribute("list",list);

        return "head_office/headProduct";
    }

    //상품추가
    @PostMapping("/insertProduct.he")
    public String insertProduct(Product product, HttpSession session) {

        int result = headService.insertProduct(product);
        return "head_office/headProduct";
    }

    @PostMapping("/searchProduct")
    public String searchProduct(@RequestParam String condition, @RequestParam String keyword, Model model) {
        ArrayList<Product> list = headService.searchProduct(condition, keyword);
        model.addAttribute("list",list);

        return "head_office/headProduct";
    }


}
