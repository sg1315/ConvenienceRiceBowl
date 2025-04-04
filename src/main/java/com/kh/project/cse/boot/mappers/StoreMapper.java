package com.kh.project.cse.boot.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface StoreMapper {
    int insertStore(@Param("storeName") String storeName);
}
