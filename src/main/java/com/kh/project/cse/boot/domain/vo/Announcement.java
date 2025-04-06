package com.kh.project.cse.boot.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Announcement {
    private int announcementNo;
    private String announcementTitle;
    private String announcementDetail;
    private int memberNo;
    private Date announcementDate;
    private int announcementStatus;

    private String storeName;




}
