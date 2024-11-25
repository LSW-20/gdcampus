package com.br.gdcampus.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 수강생 Dto
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class LearnerDto {

	private int learnerNo;
	private int stuNo;
	private String stuName;
	private String department;
	private int grade;
	private int middleTest;
	private int finalTestL; // 테이블에 오타나있음
	private int practice;
	private int attendance;
	private int etc;
	private String finalGrade;
}
