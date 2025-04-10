package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Expiry;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface ExpiryMapper {
    // 유통기한 리스트 불러오기
    int selectExpiryCount(@Param("storeNo") int storeNo);
    ArrayList<Expiry> selectExpiryList(@Param("storeNo")int storeNo, RowBounds rowBounds);
    
    // 유통기한 검색
    int searchExpiryListCount(@Param("searchExpiry") String searchExpiry, @Param("keyword") String keyword, @Param("storeNo") int storeNo);
    ArrayList<Expiry> searchExpiryList(@Param("searchExpiry") String searchExpiry,@Param("keyword") String keyword,@Param("storeNo") int storeNo, RowBounds rowBounds);
    
    // 유통기한 폐기
    int deleteExpiry(@Param("storeNo") int storeNo, @Param("productNo") int productNo, @Param("expirationDate") String expirationDate);


}
