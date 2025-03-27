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
}
