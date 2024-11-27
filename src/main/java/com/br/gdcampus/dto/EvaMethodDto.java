package com.br.gdcampus.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 수업 평가방식 관련 dto
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class EvaMethodDto {

	private String classCode;
	private String evaItem;
	private int allocation;
	private String evaDetail;
	 // 수업계획Dto
	private List<LessonPlanDto> planList;
}
