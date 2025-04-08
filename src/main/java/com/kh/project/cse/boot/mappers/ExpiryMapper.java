package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Expiry;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface ExpiryMapper {
    int selectExpiryCount();

    ArrayList<Expiry> selectExpiryList(RowBounds rowBounds);
}
