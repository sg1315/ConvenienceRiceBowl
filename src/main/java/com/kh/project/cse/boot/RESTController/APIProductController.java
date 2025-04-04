package com.kh.project.cse.boot.RESTController;

import com.kh.project.cse.boot.domain.vo.Category;
import com.kh.project.cse.boot.service.HeadService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/category")
public class APIProductController {
    final HeadService headService;

    @GetMapping("/drawCategory")
    public List<Category> getCategory(){
        List<Category> list = headService.selectAllCategories();
        return headService.selectAllCategories();
    }
}
