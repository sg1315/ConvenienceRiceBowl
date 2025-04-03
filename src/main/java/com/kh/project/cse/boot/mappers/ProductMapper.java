package com.kh.project.cse.boot.mappers;


import com.kh.project.cse.boot.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
    int insertProduct(Product product);
}
