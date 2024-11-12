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
public class ApprRefDto {
	private int refNo;
	private String apprNo;
	private String userNo;
	private String refType;
	private String readYn;
	private Date readDate;
	private Date createDate;
	private String creator;//CREATEOR
	private Date modifyDate;
	private String modifyUser;
}
