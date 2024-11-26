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
public class DeptDto {
	
    private String deptNo;       // 부서 번호
    private String deptName;     // 부서 이름
    private Date createDate;     // 생성일
    private String createUser;   // 생성자
    private Date modifyDate;     // 수정일
    private String modifyUser;   // 수정자
}
