package com.kh.project.cse.boot.domain.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Attendance {
    private int attendanceNo;
    private Date workingTime;
    private Date workoutTime;
    private Member member;
    private String status;
}
