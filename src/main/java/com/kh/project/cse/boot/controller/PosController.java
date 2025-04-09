package com.kh.project.cse.boot.controller;

import com.kh.project.cse.boot.domain.vo.Circulation;
import com.kh.project.cse.boot.domain.vo.Member;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.domain.vo.Product;

import com.kh.project.cse.boot.service.HeadService;
import com.kh.project.cse.boot.service.PosService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class PosController {

    private final PosService posService;

    @RequestMapping("/pos_go")
    public String home2(Model model) {
        ArrayList<Product> list = posService.posAllProductSelect();
        model.addAttribute("list",list);


        return "pos/posmain";
    }

    @GetMapping("/pos/productSearch")
    @ResponseBody
    public ArrayList<Product> productSearch(@RequestParam("keyword") String keyword, Model model) {

        ArrayList<Product> list = posService.posProductSearch(keyword);

        model.addAttribute("list", list);
        return list;
    }


    @PostMapping("/posCirculationInsert")
    @ResponseBody
    public ResponseEntity<?> posCirculationInsert(@RequestBody List<Circulation> list, HttpSession session) {
        //list.forEach(System.out::println);

        Member member = (Member) session.getAttribute("loginUser");

        String setNo = member.getStoreNo() + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));

        for (Circulation circulation : list) {
            circulation.setStoreNo(member.getStoreNo());
            circulation.setStatus(3);
            circulation.setSetNo(setNo);
        };

        int result = posService.posCirculationInsert(list);

        if (result > 0) {
            return ResponseEntity.ok("발주 요청 완료");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("발주 요청 실패");
        }
    }
}
