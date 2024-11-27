package com.br.gdcampus.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 수업계획서 관련 dto
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class LessonPlanDto {
	
	private String classCode;
	private int week; 
	private String content;
	private String tchngMthd;
	private String material;
	
    private List<LessonPlanDto> planList;
    private List<LessonPlanDto> deletePlanList;
    private List<LessonPlanDto> updatePlanList;
}
