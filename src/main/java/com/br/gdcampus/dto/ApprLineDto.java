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
public class ApprLineDto {
	private Integer lineNo;	//nextval
	private String apprNo;	//currval
	private String userNo;
	private int lineOrder;
	private int lineStatus;	//0
	private Date lineDate;	//SYSDATE
	private String lineReason;//NULL
	private Date createDate;//SYSDATE
	private String createUser;
	private Date modifyDate;	//NULL
	private String modifyUser;	//NULL
	
	//따로 추가
	private String userName;
	private String deptName;
	private String rankName;
	
}
