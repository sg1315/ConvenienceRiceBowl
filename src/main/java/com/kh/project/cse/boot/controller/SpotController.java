package com.kh.project.cse.boot.controller;

import com.kh.project.cse.boot.domain.vo.Attendance;
import com.kh.project.cse.boot.domain.vo.Member;
import com.kh.project.cse.boot.service.MemberService;
import com.kh.project.cse.boot.service.SpotService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.ResourceTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SpotController {

    private final ResourceTransactionManager resourceTransactionManager;
    private final MemberService memberService;
    private final SpotService spotService;

    public SpotController(ResourceTransactionManager resourceTransactionManager, MemberService memberService, SpotService spotService) {
        this.resourceTransactionManager = resourceTransactionManager;
        this.memberService = memberService;
        this.spotService = spotService;
    }

    //대시보드
    @RequestMapping("/spot_dashboard")
    public String spot_dashboard() {
        return "spot/spotDashboard";
    }

    //상품목록
    @RequestMapping("/spot_product")
    public String spot_product() {
        return "spot/spotProduct";
    }

    //출고
    @RequestMapping("/spot_output")
    public String spot_output() {
        return "spot/spotOutput";
    }

    //년매출
    @RequestMapping("/spot_salesYear")
    public String spot_salesYear() {
        return "spot/spotSalesYear";
    }

    //멤버관리
//    @RequestMapping("/spot_member")
//    public String spot_member() {
//        return "spot/spotMember";
//    }

    //근태관리
    @RequestMapping("/spot_attendance")
    public String spot_attendance() {
        return "spot/spotAttendance";
    }

    //재고
    @RequestMapping("/spot_inventory")
    public String spot_inventory() {
        return "spot/spotInventory";
    }

    //공지사항
    @RequestMapping("/spot_notice")
    public String spot_notice() {
        return "spot/spotNotice";
    }

    //월매출
    @RequestMapping("/spot_sales")
    public String spot_sales() {
        return "spot/spotSales";
    }

    //유통기한
    @RequestMapping("/spot_expiration")
    public String spot_expiration() {
        return "spot/sporExpiration";
    }


    @RequestMapping("/inputmodal")
    public String inputmodal() {
        return "spotInputmodal";
    }

    @RequestMapping("/receiving")
    public String receiving() {
        return "receiving/receivingDetailsForm";
    }

    //입고
    @RequestMapping("/spot_order")
    public String spot_order() {
        return "spot/spotOrder";
    }

    @RequestMapping("/spot_input")
    public String spot_input() { return "spot/spotInput"; }

    //지점관리
    @PostMapping("/update_member")
    @ResponseBody
    public String update_member(@RequestBody Member member) {
        int result = memberService.updateMember(member);

        if (result > 0) {
            return "성공";
        }else {
            return "실패";
        }
    }

    //직원정보 조회
    @GetMapping("/spot_member")
    public String spotMemberInfo(Model model) {
        List<Member> memberList = memberService.selectMemberList();
        System.out.println(memberList);
        model.addAttribute("memberList", memberList);
        return "spot/spotMember";
    }
    @GetMapping("/spot_attendance")
    public String spot_attendanceInfo(Model model) {
        List<Attendance> attendanceList = spotService.selectInfoList();
        for (Attendance att : attendanceList) {
            System.out.println("출근기록: " + att.getAttendanceNo() + ", " + att.getMember().getMemberName());
        }
        model.addAttribute("attendanceList", attendanceList);
        return "spot/spotAttendance";
    }

}
