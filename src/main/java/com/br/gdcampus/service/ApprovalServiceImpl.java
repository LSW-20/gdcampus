package com.br.gdcampus.service;

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

	@Override
	public int selectMyApprovedListCount(String userNo) {
		return 0;
	}

	@Override
	public List<ApprovalDto> selectMyApprovedList(PageInfoDto pi, String userNo) {
		return null;
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
		System.out.println("결재할 결재선 apprNo : "+apprNo);
		if(approval != null) {
			//결재선조회
			List<ApprLineDto> approvers = apprDao.selectApproversList(apprNo);
			approval.setApprovers(approvers);
		}
		return approval;
	}

	//결재예정문서상세
	@Override
	public ApprovalDto selectApprUpcomingDetail(Map<String, Object> params) {
		ApprovalDto approval = apprDao.selectApprUpcomingDetail(params);
		String apprNo = (String)params.get("apprNo");
		System.out.println("결재할 결재선 apprNo : "+apprNo);
		if(approval != null) {
			//결재선조회
			List<ApprLineDto> approvers = apprDao.selectApproversList(apprNo);
			approval.setApprovers(approvers);
		}
		return approval;
	}

	//기안문서상세
	@Override
	public ApprovalDto selectMyDocDetail(Map<String, Object> params) {
		
		ApprovalDto approval = apprDao.selectMyDocDetail(params);
		
		String apprNo = (String)params.get("apprNo");
		System.out.println("결재할 결재선 apprNo : "+apprNo);
		if(approval != null) {
			//결재선조회
			List<ApprLineDto> approvers = apprDao.selectApproversList(apprNo);
			approval.setApprovers(approvers);
		}
		return approval;
	}

	@Override
	public ApprovalDto selectMyApprovedDetail(Map<String, Object> params) {
		return null;
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
			System.out.println("draft : "+draft);
			if(draft != null) {
				result = apprDao.insertSimpleDraft(draft);
				if(result == 0) {
					throw new RuntimeException("기안서 등록 실패");
				}
				System.out.println("기안서 insert result : "+result);
			}
		} else if("품의서".equals(approval.getApprType())) {
			PurchaseDraftDto purchDraft = approval.getPurchDraft();
			if(purchDraft != null) {
				result = apprDao.insertPurchaseDraft(purchDraft);
				if(result == 0) {
					throw new RuntimeException("품의서 등록 실패");
				}
				
				List<PurchaseHistoryDto> purchaseItems = purchDraft.getPurchaseItems();
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
	public int updateNextOrder(ApprovalDto approval) {
		return 0;
	}

	@Override
	public int updateAppAgree(ApprLineDto apprLine) {
		return 0;
	}

	@Override
	public int updateAject(ApprLineDto apprLine) {
		return 0;
	}

	@Override
	public int insertApprovalLine(ApprLineDto line) {
		return apprDao.insertApprovalLine(line);
	}

	@Override
	public List<ApprLineDto> selectApproversList(String apprNo) {
		return apprDao.selectApproversList(apprNo);
	}

}
