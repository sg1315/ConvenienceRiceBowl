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
    private int circulationNo;
    private int storeNo;
    private int productNo;
    private int inputPrice;
    private int salePrice;
    private int circulationAmount;
    private Date circulationDate;
    private int status;

    private String price; // 별칭 데이터베이스에 추가 안해도 됌

    private String storeName;
    private String productName;
    private String categoryName;
    private int sumInputPrice;

    //발주목록 가져오기
    private String setNo;
    private int rowNum;
    private int rnum;
    private String minuteGroup;
    private int totalAmount;
    private int totalInputPrice;
    //년도별 집계 가져오기
    private String month;
    private int totalInput;
    private int totalSale;
    private int totalMargin;

}
