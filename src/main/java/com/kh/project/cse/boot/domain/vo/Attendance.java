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
    private int memberNo;
    private int workingTime;
    private int workoutTime;
}
