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
public class CategoryDto {

	private String categoryNo;
	private String categoryName;
	
	private int rankNo;
	private String deptNo;
	private String stDeptNo;
	
	private String rankName;
	private String deptName;
	
	private String createUser;
	private String modifyUser;
}
