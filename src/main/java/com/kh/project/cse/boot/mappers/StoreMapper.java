package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Product;
import com.kh.project.cse.boot.domain.vo.Store;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface StoreMapper {
    int insertStore(@Param("storeName") String storeName);

    int checkStoreName(@Param("checkStore") String checkStore);

    int checkStoreStatus(@Param("storeNo") int storeNo);

    int checkStore(@Param("checkStore")String checkStore);

    int storeListCount();

    ArrayList<Store> selectAllStore(RowBounds rowBounds);

    ArrayList<Store> searchStore(String condition, String keyword, RowBounds rowBounds);

    int updateStoreNo(String storeNumber);

    ArrayList<Store> selectStoreStatus(RowBounds rowBounds);

    ArrayList<Product> searchMember(RowBounds rowBounds);
}
