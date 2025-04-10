package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Files;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilesMapper {
    int insertFiles(Files files);

    int updateFiles(Files files);

    int deleteFile(int productNo);

    Files selectProductFile(int productNo);
}
