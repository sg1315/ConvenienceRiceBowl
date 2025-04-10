package com.kh.project.cse.boot.service;

import com.kh.project.cse.boot.domain.vo.Circulation;
import com.kh.project.cse.boot.domain.vo.Inventory;
import com.kh.project.cse.boot.domain.vo.Product;

import java.util.ArrayList;
import java.util.List;

public interface PosService {


    int posCirculationInsert(List<Circulation> list);

    ArrayList<Inventory> posAllInventroySelect(int storeNo);

    ArrayList<Inventory> posInventroySearch(String keyword, int storeNo);
}
