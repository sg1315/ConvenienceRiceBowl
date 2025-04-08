package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Expiry;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface ExpiryMapper {
    int selectExpiryCount(@Param("storeNo") int storeNo);

    ArrayList<Expiry> selectExpiryList(@Param("storeNo")int storeNo, RowBounds rowBounds);

    int insertExpiry(@Param("storeNo") int storeNo, @Param("productNo") int productNo, @Param("inventoryCount") int inventoryCount);
    int deleteExpiry(@Param("storeNo") int storeNo, @Param("productNo") int productNo, @Param("expirationDate") String expirationDate);
}
