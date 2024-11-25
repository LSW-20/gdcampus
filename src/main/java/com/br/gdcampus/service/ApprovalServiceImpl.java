package com.br.gdcampus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.ApprovalDao;
import com.br.gdcampus.dto.ApprLineDto;
import com.br.gdcampus.dto.ApprRefDto;
import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.DraftDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PurchaseDraftDto;
import com.br.gdcampus.dto.PurchaseHistoryDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ApprovalServiceImpl implements ApprovalService {
	private final ApprovalDao apprDao;
	
	//결재홈 페이징
	@Override
	public int selectApprHomeListCount(String userNo) {
		return 0;
	}

	//결재대기문서 페이징
	@Override
	public int selectApprTodoListCount(String userNo) {
		return apprDao.selectApprTodoListCount(userNo);
	}

	//결재대기문서 리스트
	@Override
	public List<ApprovalDto> selectApprTodoList(PageInfoDto pi, String userNo) {
		return apprDao.selectApprTodoList(pi, userNo);
	}

	//결재예정문서 페이징
	@Override
	public int selectApprUpcomingListCount(String userNo) {
		return apprDao.selectApprUpcomingListCount(userNo);
	}

	//결재예정문서 리스트
	@Override
	public List<ApprovalDto> selectApprUpcomingList(PageInfoDto pi, String userNo) {
		return apprDao.selectApprUpcomingList(pi,userNo);
	}

	//기안문서함 페이징
	@Override
	public int selectMyDocListCount(Map<String, Object> params) {
		return apprDao.selectMyDocListCount(params);
	}

	//기안문서함 리스트
	@Override
	public List<ApprovalDto> selectMyDocList(PageInfoDto pi,  Map<String, Object> params) {
		return apprDao.selectMyDocList(pi, params);
	}

	//내결재함 페이징
	@Override
	public int selectMyApprovedListCount(String userNo) {
		return apprDao.selectMyApprovedListCount(userNo);
	}

	//내결재함 리스트
	@Override
	public List<ApprovalDto> selectMyApprovedList(PageInfoDto pi, Map<String, Object> params) {
		return apprDao.selectMyApprovedList(pi,params);
	}

	@Override
	public int selectApprViewerListCount(String userNo) {
		return 0;
	}

	@Override
	public List<ApprRefDto> selectApprViewerList(PageInfoDto pi, String userNo) {
		return null;
	}

	//결재대기문서상세
	@Override
	public ApprovalDto selectApprTodoDetail(Map<String, Object> params) {
		ApprovalDto approval = apprDao.selectApprTodoDetail(params);
		String apprNo = (String)params.get("apprNo");
		System.out.println("가져올apprNo : "+apprNo);
		if(approval != null) {
			//결재선조회
			List<ApprLineDto> approvers = apprDao.selectApproversList(apprNo);
			approval.setApprovers(approvers);
			
			//문서종류별 상세 내용 조회
			if(approval.getApprType().equals("기안서")) {
				DraftDto draft = apprDao.selectSimpleDraftDetail(apprNo);
				approval.setDraft(draft);
			}else if(approval.getApprType().equals("품의서")) {
				PurchaseDraftDto purchDraft = apprDao.selectPurchDraftDetail(apprNo);
				approval.setPurchDraft(purchDraft);
			}
		}
		return approval;
	}

	//결재예정문서상세
	@Override
	public ApprovalDto selectApprUpcomingDetail(Map<String, Object> params) {
		ApprovalDto approval = apprDao.selectApprUpcomingDetail(params);
		String apprNo = (String)params.get("apprNo");
		System.out.println("가져올apprNo : "+apprNo);
		if(approval != null) {
			//결재선조회
			List<ApprLineDto> approvers = apprDao.selectApproversList(apprNo);
			approval.setApprovers(approvers);
			
			//문서종류별 상세 내용 조회
			if(approval.getApprType().equals("기안서")) {
				DraftDto draft = apprDao.selectSimpleDraftDetail(apprNo);
				approval.setDraft(draft);
			}else if(approval.getApprType().equals("품의서")) {
				PurchaseDraftDto purchDraft = apprDao.selectPurchDraftDetail(apprNo);
				approval.setPurchDraft(purchDraft);
			}
		}
		return approval;
	}

	//기안문서상세
	@Override
	public ApprovalDto selectMyDocDetail(Map<String, Object> params) {
		
		ApprovalDto approval = apprDao.selectMyDocDetail(params);
		
		String apprNo = (String)params.get("apprNo");
		System.out.println("가져올apprNo : "+apprNo);
		
		if(approval != null) {
			
			//결재선조회
			List<ApprLineDto> approvers = apprDao.selectApproversList(apprNo);
			approval.setApprovers(approvers);
			
			//문서종류별 상세 내용 조회
			if(approval.getApprType().equals("기안서")) {
				DraftDto draft = apprDao.selectSimpleDraftDetail(apprNo);
				approval.setDraft(draft);
			}else if(approval.getApprType().equals("품의서")) {
				PurchaseDraftDto purchDraft = apprDao.selectPurchDraftDetail(apprNo);
				approval.setPurchDraft(purchDraft);
			}
		}
		return approval;
	}

	@Override
	public ApprovalDto selectMyApprovedDetail(Map<String, Object> params) {
		ApprovalDto approval = apprDao.selectMyApprovedDetail(params);
		
		String apprNo = (String)params.get("apprNo");
		System.out.println("가져올apprNo : "+apprNo);
		
		if(approval != null) {
			
			//결재선조회
			List<ApprLineDto> approvers = apprDao.selectApproversList(apprNo);
			approval.setApprovers(approvers);
			
			//문서종류별 상세 내용 조회
			if(approval.getApprType().equals("기안서")) {
				DraftDto draft = apprDao.selectSimpleDraftDetail(apprNo);
				approval.setDraft(draft);
			}else if(approval.getApprType().equals("품의서")) {
				PurchaseDraftDto purchDraft = apprDao.selectPurchDraftDetail(apprNo);
				approval.setPurchDraft(purchDraft);
			}
		}
		return approval;
	}

	//기안문서>진행중>최근순5개
	@Override
	public List<ApprovalDto> getRecentInProgressDocs(String userNo) {
		return apprDao.getRecentInProgressDocs(userNo);
	}

	//기안문서>완료>최근순5개
	@Override
	public List<ApprovalDto> getRecentCompletedDocs(String userNo) {
		return apprDao.getRecentCompletedDocs(userNo);
	}

	//결재요청
	@Override
	public int insertApproval(ApprovalDto approval) {
		
		//결재 insert
		int result = apprDao.insertApproval(approval);
		if(result == 0) {
			throw new RuntimeException("결재 문서 등록 실패");
		}
		
		System.out.println("결재 insert result : "+result);
	
		//결재선 insert
		List<ApprLineDto> approvers = approval.getApprovers();
		System.out.println("결재선 : "+approvers);
		if(approvers != null && !approvers.isEmpty()) {
			for(ApprLineDto line : approvers) {
				result = apprDao.insertApprovalLine(line);
				if(result == 0) {
	                throw new RuntimeException("결재선 등록 실패");
				}
			}
		}
		System.out.println("결재선 insert result : "+result);
		
		//문서타입따라 다르게 문서 등록
		if("기안서".equals(approval.getApprType())) {
			DraftDto draft = approval.getDraft();
//			System.out.println("draft : "+draft);
			if(draft != null) {
				result = apprDao.insertSimpleDraft(draft);
				if(result == 0) {
					throw new RuntimeException("기안서 등록 실패");
				}
				System.out.println("기안서 insert result : "+result);
			}
		} else if("품의서".equals(approval.getApprType())) {
			PurchaseDraftDto purchDraft = approval.getPurchDraft();
			System.out.println("ServiceImple purchDraft : "+purchDraft);
			if(purchDraft != null) {
				result = apprDao.insertPurchaseDraft(purchDraft);
				if(result == 0) {
					throw new RuntimeException("품의서 등록 실패");
				}
				
				List<PurchaseHistoryDto> purchaseItems = purchDraft.getPurchaseItems();
				System.out.println("ServiceImpl items : " + purchaseItems);
				if(purchaseItems != null) {
					for(PurchaseHistoryDto item : purchaseItems) {
						result = apprDao.insertPurchaseHistory(item);
						if(result == 0) {
							throw new RuntimeException("품의서 물품 등록 실패");
						}
						System.out.println("품의서 insert result : "+result);
					}
				}
			}
		}
		
		return result;
	}

	@Override
	public int insertSimpleDraft(DraftDto draft) {
		return apprDao.insertSimpleDraft(draft);
	}

	@Override
	public int insertPurchaseDraft(PurchaseDraftDto purchDraft) {
		return apprDao.insertPurchaseDraft(purchDraft);
	}

	@Override
	public int insertPurchaseHistory(PurchaseHistoryDto purchHistory) {
		return apprDao.insertPurchaseHistory(purchHistory);
	}

	@Override
	public List<ApprLineDto> selectApproversList(String apprNo) {
		return apprDao.selectApproversList(apprNo);
	}

	@Override
	public DraftDto selectSimpleDraftDetail(String apprNo) {
		return apprDao.selectSimpleDraftDetail(apprNo);
	}

	@Override
	public PurchaseDraftDto selectPurchDraftDetail(String apprNo) {
		return apprDao.selectPurchDraftDetail(apprNo);
	}

	@Override
	public int updateLineAgree(Map<String, Object> params) {
		return apprDao.updateLineAgree(params);
	}

	@Override
	public int updateLineReject(Map<String, Object> params) {
		return apprDao.updateLineReject(params);
	}

	@Override
	public int updateApprAgree(String apprNo) {
		return apprDao.updateApprAgree(apprNo);
	}
	
	@Override
	public int updateApprReject(String apprNo) {
		return apprDao.updateApprReject(apprNo);
	}

	@Override
	public int isLastOrder(Map<String, Object> params) {
		return apprDao.isLastOrder(params);
	}

	@Override
	public int updateNextOrder(String apprNo) {
		return apprDao.updateNextOrder(apprNo);
	}

	@Override
	public int insertApprovalLine(ApprLineDto line) {
		return apprDao.insertApprovalLine(line);
	}
	
	@Override
	public int isCurrentOrder(Map<String, Object> params) {
		return apprDao.isCurrentOrder(params);
	}
	
	@Override
	public int updateApprStatusToProgress(String apprNo) {
		return apprDao.updateApprStatusToProgress(apprNo);
	}
	
	//승인통합메소드
	public int processApprove(String apprNo, String userNo, String apprStatus) {
		Map<String,Object> params = new HashMap<>();
		params.put("apprNo", apprNo);
		params.put("userNo", userNo);
		System.out.println("0대기 | 1진행 | 2승인 | 3반려 : "+ apprStatus);
		params.put("apprStatus", apprStatus);
		
		//현재 결재 순서인지 체크
		int isCurrentOrder = apprDao.isCurrentOrder(params);
		if(isCurrentOrder == 0) {
			System.out.println("현재 결재순서가 아님. return 0처리");
			return 0;
		}
		
		//결재선승인처리
		int result = updateLineAgree(params);
		
		if(result > 0) {
			if(apprStatus.equals("0")) {
				//대기라면 진행중으로변경
				apprDao.updateApprStatusToProgress(apprNo);
			}
			int isLast = isLastOrder(params);
			if(isLast > 0) { //다음결재자가 존재
				result = updateNextOrder(apprNo);
			}else {//마지막 결재자인 경우
				result = updateApprAgree(apprNo);
			}
		}
		
		return result;
	}
	
	//반려통합메소드
	public int processReject(String apprNo, String userNo, String lineReason) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("apprNo", apprNo);
		params.put("userNo", userNo);
		params.put("lineReason", lineReason);
		
		//결재선반려처리
		int result = updateLineReject(params);
		
		if(result > 0) {
			//결재문서반려전환
			result = updateApprReject(apprNo);
		}
		
		
		return result;
	}

	@Override
	public int insertAdminForm(ApprovalDto apprForm) {
		return apprDao.insertAdminForm(apprForm);
	}

	@Override
	public List<ApprovalDto> selectAdminFormList() {
		return apprDao.selectAdminFormList();
	}

	@Override
	public ApprovalDto selectAdminFormDetail(String apprNo) {
		return apprDao.selectAdminFormDetail(apprNo);
	}

	@Override
	public int updateAdminForm(ApprovalDto apprForm) {
		return apprDao.updateAdminForm(apprForm);
	}

	@Override
	public int deleteAdminForm(String apprNo) {
		return apprDao.deleteAdminForm(apprNo);
	}



	
	
}
