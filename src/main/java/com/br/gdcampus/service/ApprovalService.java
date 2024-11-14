package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.ApprRefDto;
import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.PageInfoDto;

/**
 * 보겸 - 결재 service
 */
public interface ApprovalService {
	//결재홈 목록 조회
	int selectApprHomeListCount();//?count다 따로 둬야하나
	
	//결재대기문서함 목록 조회 apprStatus==1 && lineOrder==currOrder join
	int selectApprTodoListCount();
	List<ApprovalDto> selectApprTodoList(PageInfoDto pi, String userNo);
	//?DTO가 너무 많이 나뉘어져 있음 - Dto 하나로 합쳐버려?Map처리해서 버텨?
	
	//결재예정문서 조회  apprStatus==1 && linOrder<나 join
	int selectApprUpcomingListCount();
	List<ApprovalDto> selectApprUpcomingList(PageInfoDto pi,  String userNo);
	
	//기안문서함 조회	apprUser(== userNo), apprStatus
	int selectMyDocListCount(Map<String, Object> params);
	List<ApprovalDto> selectMyDocList(PageInfoDto pi,  Map<String, Object> params);
	
	//결재문서함 조회   lineOrder.contain(나) && apprStatus 2 or 3 join
	int selectMyApprovedListCount();
	List<ApprovalDto> selectMyApprovedList(PageInfoDto pi, String userNo);
	
	//참조/열람대기문서 조회 T_APPR_REF userNo == loginUser
	int selectApprViewerListCount();
	List<ApprRefDto> selectApprViewerList(PageInfoDto pi, String userNo);
	
	//결재대기문서상세
	ApprovalDto selectApprTodoDetail(String userNo, String apprNo);
	
	//결재예정문서 상세
	ApprovalDto selectApprUpcomingDetail(String userNo, String apprNo);
	
	//기안문서상세
	ApprovalDto selectMyDocDetail(String userNo, String apprNo);
	
	//결재문서 상세
	ApprovalDto selectMyApprovedDetail(String userNo, String apprNo);

	//기안문서>진행중 최근 5개
	List<ApprovalDto> getRecentInProgressDocs(String userNo);

	//기안문서>환료 최근 5개
	List<ApprovalDto> getRecentCompletedDocs(String userNo);
	
	
	//결재 승인
	
	//반려
	
	//글삭제
	
	//글수정
	
	//결재선 추가
	
	//결재선 조회
	
	//결재자 순서 업데이트

	//양식생성
	
}
