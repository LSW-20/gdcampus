package com.br.gdcampus.dto;
import java.sql.Date;
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
public class ApprovalDto {
	private String apprNo;
	private String apprUser;
	private int deptNo;
	private String apprType;
	private Date apprDate;
	private String apprTitle;
	private String apprContent;
	private int currOrder;
	private String apprStatus;
	private Date createDate;
	private String createUser;
	private Date modifyDate;
	private String updateUser;
	
    // 결재선 정보를 담을 List
    private List<ApprLineDto> approvers;

    // 문서 타입별 정보
    private DraftDto draft;           // 기안서인 경우
    private PurchaseDraftDto purchDraft;  // 품의서인 경우
}
