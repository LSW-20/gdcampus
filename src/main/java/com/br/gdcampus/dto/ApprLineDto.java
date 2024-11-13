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
	private int lineNo;
	private String apprNo;
	private String userNo;
	private int lineOrder;
	private int lineStatus;
	private Date lineDate;
	private String lineReason;
	private Date createDate;
	private String createUser;
	private Date modifyDate;
	private String modifyUser;
}
