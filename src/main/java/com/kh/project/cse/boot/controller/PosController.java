package com.kh.project.cse.boot.controller;

import com.kh.project.cse.boot.domain.vo.*;

import com.kh.project.cse.boot.service.HeadService;
import com.kh.project.cse.boot.service.PosService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
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
    public String home2(HttpSession session, Model model) {

        Member member = (Member) session.getAttribute("loginMember");
        int storeNo = member.getStoreNo();
        ArrayList<Inventory> list = posService.posAllInventroySelect(storeNo);

        model.addAttribute("list",list);


        return "pos/posmain";
    }

    @GetMapping("/pos/productSearch")
    @ResponseBody
    public ArrayList<Inventory> posInventroySearch(@RequestParam("keyword") String keyword, HttpSession session, Model model) {

        Member member = (Member) session.getAttribute("loginMember");
        int storeNo = member.getStoreNo();

        ArrayList<Inventory> list = posService.posInventroySearch(keyword, storeNo);

        model.addAttribute("list", list);
        return list;
    }


    @PostMapping("/posCirculationInsert")
    @ResponseBody
    public ResponseEntity<?> posCirculationInsert(@RequestBody List<Circulation> list, HttpSession session) {
        System.out.println("수신된 객체 수: " + list.size());

        list.forEach(System.out::println);

        Member member = (Member) session.getAttribute("loginMember");
        String setNo = member.getStoreNo() + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));

        for (Circulation circulation : list) {
            circulation.setStoreNo(member.getStoreNo());
            circulation.setSetNo(setNo);
        };

        int result = posService.posCirculationInsert(list);

        if (result > 0) {
            return ResponseEntity.ok("판매 완료");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("판매 실패");
        }
    }
}
