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
	 private String modifyDate; // 수정일
	 
	 private String updateClassCode; // 수정후 학과 반영
	 private String deptName; // 개설 학과명
	 private int stuCount;
	 
	 private String classTitle;
	 private String classType;
	 private String prgMethod;
	 private int targetGrade;
	 private int classHours;
	 private String classGoals;
	 private String operationPlan;
	 private String mainTextBook;
	 private String refnBook;
	 private String confirmYn; // 승인YN 강의목록에 띄울땐 Y만뜨게
	 
	 // 신청서테이블
	 private String status;
	 private String applDate; // 신청일
	 private String reason;
	 private String delYn;
	
	 // 평가방식Dto
	 private List<EvaMethodDto> evaList; 
	 private List<EvaMethodDto> deleteEvaList; 
	 private List<EvaMethodDto> updateEvaList; 
	 
	 // 수강생Dto
	 private List<LearnerDto> learnerList;
	 
	 // 수업계획Dto
	 private List<LessonPlanDto> planList;
	 private List<LessonPlanDto> deletePlanList;
	 private List<LessonPlanDto> updatePlanList;
}
