package com.br.gdcampus.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 수업 관련 dto 
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ClassDto {

	// 수업테이블
	 private String classCode; 	 
	 private String userNo;
	 private String modifyDate;
	 
	 private String classTitle;
	 private String classType;
	 private String prgMethod;
	 private int targetGrade;
	 private int classHours;
	 private String classGoals;
	 private String opreationPlan;
	 private String mainTextBook;
	 private String refnBook;
	 private String confirmYn;
	 
	 // 신청서테이블
	 private String status;
	 private String applDate;
	 private String reason;
	 private int delYn;
	
	 // 평가방식Dto
	 private List<EvaMethodDto> evaList; 
	 
	 // 수강생Dto
	 private List<LearnerDto> lernerList;
	 
	 // 수업계획Dto
	 private List<LessonPlanDto> planList;
}
