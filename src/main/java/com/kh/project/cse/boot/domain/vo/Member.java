package com.kh.project.cse.boot.domain.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class Member {
    private int memberNo;
    private int storeNo;
    private String position; //1.본사 2.지점장 3.매니저 4. 알바
    private String memberName;
    private String phone;

    private String residentNo;
    private String memberId;
    private String memberPwd;
    private String status; //Y: 재직, N: 퇴직

    private String storeName;//지점생성
    private int count;//페이징전체목록수


}
