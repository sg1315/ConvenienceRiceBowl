package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Announcement;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface AnnouncementMapper {

    int insertAnnouncement(Announcement announcement);

    int selectAnnouncementCount();

    ArrayList<Announcement> selectAnnouncementlist(RowBounds rowBounds);
}
