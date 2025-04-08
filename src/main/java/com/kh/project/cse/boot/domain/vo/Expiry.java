package com.kh.project.cse.boot.domain.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Expiry {
    private int productNo;
    private String categoryName;
    private String productName;
    private String expirationDate;
    private int inventoryCount;
    private String price;
    private String nearExpiry;
}
