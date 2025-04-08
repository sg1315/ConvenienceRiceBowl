package com.kh.project.cse.boot.domain.vo;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Files {
    private int fileNo;
    private int productNo;
    private String originName;
    private String changeName;
    private String filePath;
}