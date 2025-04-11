package com.kh.project.cse.boot.mappers;

import com.kh.project.cse.boot.domain.vo.Announcement;
import com.kh.project.cse.boot.domain.vo.PageInfo;
import com.sun.tools.jconsole.JConsoleContext;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface AnnouncementMapper {

    int insertAnnouncement(Announcement announcement);

    int selectAnnouncementCount();

    ArrayList<Announcement> selectAnnouncementlist(RowBounds rowBounds);

    Announcement selectDetailAnnouncement(@Param("ano") int announcementNo);

    int updateAnnouncementDetail(Announcement announcement);

    int searchAnnouncementCount(String condition, String keyword);

    ArrayList<Announcement> searchAnnouncement(String condition, String keyword,RowBounds rowBounds);

    int deleteAnnouncement(@Param("ano") int announcementNo);

    ArrayList<Announcement> selectdashAnnouncementlist();

}
