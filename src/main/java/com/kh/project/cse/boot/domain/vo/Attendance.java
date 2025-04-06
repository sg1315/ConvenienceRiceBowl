package com.kh.project.cse.boot.domain.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Attendance {
    private int attendanceNo;
    private String workingTime;
    private String workoutTime;
    private Member member;
}
