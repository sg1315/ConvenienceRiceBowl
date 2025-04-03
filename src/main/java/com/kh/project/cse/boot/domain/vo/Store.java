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
    private int storeName;
    private Date storeDate;
    private int storeStatus;

}
