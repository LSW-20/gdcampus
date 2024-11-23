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
	List<ApprovalDto> selectMyApprovedList(PageInfoDto pi, Map<String, Object> params);
	
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
	
	//결재선 조회
	List<ApprLineDto> selectApproversList(String apprNo);
	
	//기안서상세요청
	DraftDto selectSimpleDraftDetail(String apprNo);
	
	//품의서상세요청
	PurchaseDraftDto selectPurchDraftDetail(String apprNo);
	
	//결재선 승인
	int updateLineAgree(Map<String, Object> params);
	
	//결재선 반려
	int updateLineReject(Map<String, Object> params);
	
	//결재상태 승인 처리
	int updateApprAgree(String apprNo);
	
	//결재상태 반려 처리
	int updateApprReject(String apprNo);
	
	//마지막결재자인지체크
	int isLastOrder(Map<String, Object> params);
	
	//다음결재자로
	int updateNextOrder(String apprNo);
	
	//결재선 추가
	int insertApprovalLine(ApprLineDto line);

	//이번차례인지확인
	int isCurrentOrder(Map<String, Object> params);

	//결재통합메소드
	int processApprove(String apprNo, String userNo, String apprStatus);
	
	//반려통합메소드
	int processReject(String apprNo, String userNo, String lineReason);
	
	//진행중으로변경
	int updateApprStatusToProgress(String apprNo);
	
	//글삭제
	
	//글수정
	
	//양식생성
	
}
