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
public class PurchaseDraftDto {
	private String apprNo;
	private String purchDept;
	private String purchEmpName;
	private Date createDate;
	private String purchPurpose;
	private Date purchDeadline;
	private String purchTotal;//int?String?
}
