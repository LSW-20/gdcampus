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
	private int middleTest;
	private int finalTest;
	private int practice;
	private int attendance;
	private int etc;
	private String finalGrade;
}
