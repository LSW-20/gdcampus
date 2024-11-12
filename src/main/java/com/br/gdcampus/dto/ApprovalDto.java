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
public class ApprovalDto {
	private String apprNo;
	private String apprUser;
	private int deptNo;
	private String apprType;
	private Date apprDate;
	private String apprTitle;
	private String apprContent;
	private String apprStatus;
	private Date createDate;
	private String createUser;
	private Date modifyDate;
	private String updateUser;
}
