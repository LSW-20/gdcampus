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
public class MemberDto {

	private String userNo;
	private String stDeptNo;
	private int rankNo;
	private String deptNo;
	private Date createDt;
	private String createUser;
	private Date modifyDt;
	private String updateUser;
	private char status;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private char gender;
	private String phone;
	private String address;
	private String profileURL;
	private String nameURL;
	private Date hireDt;
	private Date leaveDt;
	private int holiDt;
	
}
