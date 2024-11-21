package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.ApprLineDto;
import com.br.gdcampus.dto.ApprRefDto;
import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.DraftDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PurchaseDraftDto;
import com.br.gdcampus.dto.PurchaseHistoryDto;

/**
 * 보겸 - 결재 service
 */
public interface ApprovalService {
	//결재홈 목록 조회
	int selectApprHomeListCount(String userNo);
	
	//결재대기문서함 목록 조회
	int selectApprTodoListCount(String userNo);
	List<ApprovalDto> selectApprTodoList(PageInfoDto pi, String userNo);
		
	//결재예정문서 조회  apprStatus==1 && linOrder<나 join
	int selectApprUpcomingListCount(String userNo);
	List<ApprovalDto> selectApprUpcomingList(PageInfoDto pi,  String userNo);
	
	//기안문서함 조회
	int selectMyDocListCount(Map<String, Object> params);
	List<ApprovalDto> selectMyDocList(PageInfoDto pi,  Map<String, Object> params);

	//기안문서>진행중 최근 5개
	List<ApprovalDto> getRecentInProgressDocs(String userNo);
	
	//기안문서>환료 최근 5개
	List<ApprovalDto> getRecentCompletedDocs(String userNo);
	
	//결재문서함 조회   lineOrder.contain(나) && apprStatus 2 or 3 join
	int selectMyApprovedListCount(String userNo);
	List<ApprovalDto> selectMyApprovedList(PageInfoDto pi, String userNo);
	
	//참조/열람대기문서 조회 T_APPR_REF userNo == loginUser
	int selectApprViewerListCount(String userNo);
	List<ApprRefDto> selectApprViewerList(PageInfoDto pi, String userNo);
	
	//결재대기문서상세
	ApprovalDto selectApprTodoDetail(Map<String, Object> params);
	
	//결재예정문서 상세
	ApprovalDto selectApprUpcomingDetail(Map<String, Object> params);
	
	//기안문서상세
	ApprovalDto selectMyDocDetail(Map<String, Object> params);
	
	//결재문서 상세
	ApprovalDto selectMyApprovedDetail(Map<String, Object> params);

	
	//결재요청
	int insertApproval(ApprovalDto approval);
	
	//기안서insert
	int insertSimpleDraft(DraftDto draft);
	
	//품의서insert
	int insertPurchaseDraft(PurchaseDraftDto purchDraft);
	
	//품의서물품history insert
	int insertPurchaseHistory(PurchaseHistoryDto purchHistory);
	
	//결재선 다음사람
	int updateNextOrder(ApprovalDto approval);
	
	//결재선 조회
	List<ApprLineDto> selectApproversList(String apprNo);
	
	//결재 승인
	int updateAppAgree(ApprLineDto apprLine);
	
	//반려
	int updateAject(ApprLineDto apprLine);
	
	//글삭제
	
	//글수정
	
	//결재선 추가
	int insertApprovalLine(ApprLineDto line);
	
	//결재자 순서 업데이트
	
	//양식생성
	
}
