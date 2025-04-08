package com.kh.project.cse.boot.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Reply {
    private String replyNo;
    private int announcementNo;
    private String replyContent;
    private int memberNo;
    private String createDate;

    private String storeName;

}
