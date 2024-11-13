package com.br.gdcampus.dto;

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
public class DeptDto {


	private String deptNo;
	private String deptName;
	private String createDate;
	private String createUser;
	private String modifyDate;
	private String modifyUser;
}
