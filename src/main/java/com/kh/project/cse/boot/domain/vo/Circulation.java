package com.kh.project.cse.boot.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Circulation {
    private int circulateionNo;
    private int storeNo;
    private int productNo;
    private int inputPrice;
    private int salePrice;
    private int circulateionAmount;
    private Date circulateionDate;
    private int status;


    private String storeName;
}
