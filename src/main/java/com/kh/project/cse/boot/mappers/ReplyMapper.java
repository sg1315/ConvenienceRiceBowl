package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface ReplyMapper {

    int insertReply(Reply reply);

    ArrayList<Reply> selectReply(@Param("ano") int announcementNo);
}
