package com.kh.project.cse.boot.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface StoreMapper {
    int insertStore(@Param("storeName") String storeName);

    int checkStoreName(@Param("checkStore") String checkStore);

    int checkStoreStatus(@Param("storeNo") int storeNo);

    int checkStore(@Param("checkStore")String checkStore);
}
