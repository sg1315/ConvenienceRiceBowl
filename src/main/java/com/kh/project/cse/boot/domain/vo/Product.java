package com.kh.project.cse.boot.domain.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Product {
    private int productNo;
    private  int categoryNo;
    private String productName;
    private String originName;
    private String changeName;
    private String filePath;
    private int inputPrice;
    private int salePrice;
    //재고부족량
    private int shortageAmount;
    //입고가능여부
    private String availability;
    private int status;

    private String categoryName;
    private int count;



}
