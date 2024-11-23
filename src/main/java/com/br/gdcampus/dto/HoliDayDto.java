package com.br.gdcampus.dto;

import java.sql.Date;

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
public class HoliDayDto {

	private int holiNo ;
	private String userNO ;
	private Date holiDate ;
	private int holiUsed;
	private int holiRemain;
	private int maxDays;
	private Date holiCreate;

}
