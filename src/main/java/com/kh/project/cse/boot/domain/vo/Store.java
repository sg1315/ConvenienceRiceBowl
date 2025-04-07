package com.kh.project.cse.boot.domain.vo;

import lombok.*;

import java.sql.Date;
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Store {
    private int storeNo;
    private String storeName;
    private Date storeDate;
    private int storeStatus;
    private int count;
    private String memberName;
    private String memberNo;
}
