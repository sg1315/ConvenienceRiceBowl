package com.kh.project.cse.boot.controller;

import com.kh.project.cse.boot.domain.vo.Attendance;
import com.kh.project.cse.boot.domain.vo.Member;
import com.kh.project.cse.boot.service.MemberService;
import com.kh.project.cse.boot.service.SpotService;
import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.domain.vo.Circulation;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.service.SpotService;
import com.kh.project.cse.boot.service.SpotServiceImpl;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.ResourceTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;
import java.time.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class SpotController {

    private final ResourceTransactionManager resourceTransactionManager;
    private final MemberService memberService;
    private final SpotService spotService;
    private Member member;


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

    //발주
    @RequestMapping("/spot_order")
    public String spot_order(
            @RequestParam(defaultValue = "1") int cpage,
            @RequestParam(required = false) String setNo,
            @RequestParam(required = false) Integer status,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
            HttpSession session,
            Model model) {

        Member loginUser = (Member) session.getAttribute("loginUser");
        int storeNo = loginUser.getStoreNo();

        //date값 보정
        if (startDate != null) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(startDate);
            cal.set(Calendar.HOUR_OF_DAY, 0);
            cal.set(Calendar.MINUTE, 0);
            cal.set(Calendar.SECOND, 0);
            cal.set(Calendar.MILLISECOND, 0);
            startDate = cal.getTime();
        }
        if (endDate != null) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(endDate);
            cal.set(Calendar.HOUR_OF_DAY, 23);
            cal.set(Calendar.MINUTE, 59);
            cal.set(Calendar.SECOND, 59);
            cal.set(Calendar.MILLISECOND, 999);
            endDate = cal.getTime();
        }
        List<Category> clist = spotService.orderRequestCategoryList();
        ArrayList<Product> plist = spotService.orderRequestProductList();

        ArrayList<Circulation> resultList;
        PageInfo pi;

        if (setNo != null || status != null || startDate != null || endDate != null) {
            int searchCount = spotService.orderSearchListCount(storeNo, setNo, status, startDate, endDate);
            pi = new PageInfo(searchCount, cpage, 10, 10);

            resultList = spotService.orderSearchList(pi, storeNo, setNo, status, startDate, endDate);

            model.addAttribute("olist", null);
            model.addAttribute("oslist", resultList);
        } else {
            int listCount = spotService.orderRequestListCount(storeNo);
            pi = new PageInfo(listCount, cpage, 10, 10);

            resultList = spotService.orderRequestList(pi, storeNo);

            model.addAttribute("olist", resultList);
            model.addAttribute("oslist", null);
        }

        model.addAttribute("pi", pi);
        model.addAttribute("clist", clist);
        model.addAttribute("plist", plist);

        model.addAttribute("setNo", setNo);
        model.addAttribute("status", status);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "spot/spotOrder";
    }
    @GetMapping("/spot_order/productSearch")
    @ResponseBody
    public ArrayList<Product> productSearch(@RequestParam("category") String category, @RequestParam("keyword") String keyword, Model model) {

        ArrayList<Product> pslist = spotService.orderRequestProductSearch(category, keyword);

        model.addAttribute("pslist", pslist);
        return pslist;
    }
    //발주 - 발주요청
    @PostMapping("/spot_order/requestOrder")
    public ResponseEntity<String> requestOrder(@RequestBody List<Circulation> orderList, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        int storeNo = loginUser.getStoreNo();
        String setNo = storeNo + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmm"));

        int result = 0;

        result = spotService.insertOrder(orderList, storeNo, setNo);
        if (result > 0) {
            return ResponseEntity.ok("발주 요청 완료");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("발주 요청 실패");
        }
    }


    //입고
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
    public String spotMemberInfo(@RequestParam(required = false) String keyword, Model model) {
        List<Member> memberList;

        if (keyword != null && !keyword.trim().isEmpty()) {
            memberList = memberService.selectMemberBykeyword(keyword);
        } else {
            memberList = memberService.selectMemberList();
        }

        model.addAttribute("memberList", memberList);
        model.addAttribute("keyword", keyword);

        return "spot/spotMember";
    }
    //근태정보 조회 - 초기화면
    @GetMapping("/spot_attendance")
    public String spotAttendanceInfo(@SessionAttribute("loginUser") Member loginMember, Model model) {
        List<Attendance> attendanceList = spotService.selectInfoList();
        model.addAttribute("loginMember", loginMember);
        System.out.println("attendanceList: " + attendanceList);

        model.addAttribute("attendanceList", attendanceList);

        return "spot/spotAttendance";
    }
    //근태정보 - 모달 수정버튼
    @PostMapping("/spot_attendance/updateAttendance")
    @ResponseBody
    public Map<String, Object> updateAttendanceNow(@RequestBody Map<String,Object> payload) {
        String memberId = (String) payload.get("memberId");
        String workingTimeStr = (String) payload.get("workingTime");
        String workoutTimeStr = (String) payload.get("workoutTime");

        System.out.println("업데이트 요청 받은 memberId: " + memberId);
        System.out.println("workingTimeStr: " + workingTimeStr);
        System.out.println("workoutTimeStr: " + workoutTimeStr);

        Date workingTime = null;
        Date workoutTime = null;
        try {
            if (workingTimeStr != null) {
                workingTime = Date.from(LocalDateTime.parse(workingTimeStr).atZone(ZoneId.systemDefault()).toInstant());
            }
            if (workoutTimeStr != null) {
                workoutTime = Date.from(LocalDateTime.parse(workoutTimeStr).atZone(ZoneId.systemDefault()).toInstant());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Member member = new Member();
        member.setMemberId(memberId);

        Attendance attendance = new Attendance();
        attendance.setMember(member);
        attendance.setWorkingTime(workingTime);
        attendance.setWorkoutTime(workoutTime);

        int result = spotService.updateWorkTime(attendance);

        Map<String, Object> response = new HashMap<>();
        response.put("result", result > 0 ? "success" : "fail");
        return response;
    }
    //근태관리 - 출퇴근시간 업데이트
    @PostMapping("/spot_attendance/updateTime")
    @ResponseBody
    public Map<String, Object> updateAttendanceTime(@RequestBody Map<String, String> request) {
        String memberId = request.get("memberId");
        String time = request.get("time");
        String type = request.get("type");

        Timestamp timestamp = Timestamp.valueOf(LocalDateTime.parse(time));

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("memberId", memberId);
        paramMap.put("time", timestamp);

        int result = 0;
        if ("출근".equals(type)) {
            result = spotService.updateWorkingTime(paramMap);
        } else if ("퇴근".equals(type)) {
            result = spotService.updateLeaveTime(paramMap);
        }

        Map<String, Object> response = new HashMap<>();
        response.put("result", result == 1 ? "success" : "fail");
        return response;
        }

        //매출 집계 - 검색
        @GetMapping("/spot_sales")
        public String spotSales(
                @RequestParam(value = "startMonth", required = false) String startMonth,
                @RequestParam(value = "endMonth", required = false) String endMonth,
                HttpSession session,
                Model model
        ) {
            if (startMonth == null || endMonth == null) {
                String thisMonth = LocalDate.now().toString().substring(0, 7);
                return "redirect:/spot_sales?startMonth=" + thisMonth + "&endMonth=" + thisMonth;
            }

            Member loginUser = (Member) session.getAttribute("loginUser");
            int storeNo = loginUser.getStoreNo();

            LocalDate startDate = LocalDate.parse(startMonth + "-01");
            LocalDate endDate = YearMonth.parse(endMonth).plusMonths(1).atDay(1); // 다음 달 1일

            List<Circulation> result = spotService.getSalesByMonth(storeNo, startDate, endDate);

            model.addAttribute("list", result);
            model.addAttribute("startMonth", startMonth);
            model.addAttribute("endMonth", endMonth);
            System.out.println("로그인 유저: " + loginUser);
            System.out.println("조회기간: " + startDate + " ~ " + endDate.minusDays(1)); // 확인용 출력
            System.out.println("조회된 매출 데이터 건수: " + result.size());

            return "spot/spotSales";
        }

        //매출 집계 - 모달
        @GetMapping("/spot_sales/detail")
        @ResponseBody
        public List<Circulation> getDetail(@RequestParam("date") String date, HttpSession session) {
            Member loginUser = (Member) session.getAttribute("loginUser");
            int storeNo = loginUser.getStoreNo();
            return spotService.getDetailsByDate(date, storeNo);
        }







}
