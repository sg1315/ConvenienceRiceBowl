package com.kh.project.cse.boot.domain.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Category {
    private int categoryNo;
    private String categoryName;
    private String expirationDate;
}
