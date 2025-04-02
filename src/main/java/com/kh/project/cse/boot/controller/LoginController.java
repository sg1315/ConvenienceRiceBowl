package com.kh.project.cse.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LoginController {

    //유하
    @RequestMapping("/loginForm")
    public String loginForm() {
        return "login/loginForm";
    }
}
