package com.br.gdcampus.dto;

import java.util.List;

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
public class UserDto {
	private String userNo;
	private String stDeptNo;
	private String rankNo;
	private String deptNo;
	private String createUser;
	private String updateUser;
	private String userStatus;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String gender;
	private String phone;
	private String address;
	private String profileURL;
	private String nameURL;
	private String hireDate;
	private String leaveDate;
	private int  holyDateTotal;

	private List<DeptDto> deptList;
	private List<RankDto> rankList;
	
	private String deptName; // 부서명 or 학과명 담기
	private String rankName;
}
