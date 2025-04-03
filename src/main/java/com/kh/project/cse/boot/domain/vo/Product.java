package com.kh.project.cse.boot.domain.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Product {


    private int prodcuctNo;
    private  int categoryNo;
    private String productName;
    private int inputPrice;
    private int salePrice;

    //재고부족량
    private int shortageAmount;

    //입고가능여부
    private String availavility;



}
