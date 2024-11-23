package com.br.gdcampus.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

	@NoArgsConstructor
	@AllArgsConstructor
	@Getter
	@Setter
	@ToString
	@Builder
	public class WorkStatusDto {
	 private String userNo;
	 private int arDate;
	 private int weekendDate;
	 private int arTime;
	 private int arAv;
	 private int weekendTime;
	 private char workStatus;
		
	}

	