package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Circulation;
import com.kh.project.cse.boot.domain.vo.Product;

import java.util.ArrayList;
import java.util.List;

public interface PosService {
    ArrayList<Product> posProductSearch(String keyword);

    ArrayList<Product> posAllProductSelect();

    int posCirculationInsert(List<Circulation> list);
}
