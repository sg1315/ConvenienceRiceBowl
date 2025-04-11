package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Inventory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface InventoryMapper {

    int inventoryCount(int storeNo);

    ArrayList<Inventory> selectInventory(RowBounds rowBounds, int storeNo);

    int searchInventoryCount(int storeNo, String condition, String keyword, int check);

    ArrayList<Inventory> searchInventory(RowBounds rowBounds, int storeNo, String condition, String keyword, int check);




    //포스기 전체출력
    ArrayList<Inventory> posAllInventroySelect(int storeNo);
    //포스기 검색
    ArrayList<Inventory> posInventroySearch(String keyword, int storeNo);

    //대쉬보드
    int selectdashInventoryCount(int storeNo);
}
