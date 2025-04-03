package com.kh.project.cse.boot.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Inventory {
    private int inventoryNo;
    private int storeNo;
    private int productNo;
    private int inventoryCount;
    private Date expeirationDate;

}
