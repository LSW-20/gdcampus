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
	public int selectApprHomeListCount() {
		return 0;
	}

	//결재대기문서 페이징
	@Override
	public int selectApprTodoListCount() {
		return apprDao.selectApprTodoListCount();
	}

	@Override
	public List<ApprovalDto> selectApprTodoList(PageInfoDto pi, String userNo) {
		return apprDao.selectApprTodoList(pi, userNo);
	}

	@Override
	public int selectApprUpcomingListCount() {
		return 0;
	}

	@Override
	public List<ApprovalDto> selectApprUpcomingList(PageInfoDto pi, String userNo) {
		return null;
	}

	@Override
	public int selectMyDocListCount(Map<String, Object> params) {
		return apprDao.selectMyDocListCount(params);
	}

	@Override
	public List<ApprovalDto> selectMyDocList(PageInfoDto pi,  Map<String, Object> params) {
		return apprDao.selectMyDocList(pi, params);
	}

	@Override
	public int selectMyApprovedListCount() {
		return 0;
	}

	@Override
	public List<ApprovalDto> selectMyApprovedList(PageInfoDto pi, String userNo) {
		return null;
	}

	@Override
	public int selectApprViewerListCount() {
		return 0;
	}

	@Override
	public List<ApprRefDto> selectApprViewerList(PageInfoDto pi, String userNo) {
		return null;
	}

	@Override
	public ApprovalDto selectApprTodoDetail(String userNo, String apprNo) {
		return null;
	}

	@Override
	public ApprovalDto selectApprUpcomingDetail(String userNo, String apprNo) {
		return null;
	}

	@Override
	public ApprovalDto selectMyDocDetail(String userNo, String apprNo) {
		return null;
	}

	@Override
	public ApprovalDto selectMyApprovedDetail(String userNo, String apprNo) {
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
		
		//결재선 insert
		List<ApprLineDto> approvers = approval.getApprovers();
		if(approvers != null) {
			for(ApprLineDto line : approvers) {
				result = apprDao.insertApprovalLine(line);
				if(result == 0) {
	                throw new RuntimeException("결재선 등록 실패");
				}
			}
		}
		
		//문서타입따라 다르게 문서 등록
		if("기안서".equals(approval.getApprType())) {
			DraftDto draft = approval.getDraft();
			if(draft != null) {
				result = apprDao.insertSimpleDraft(draft);
				if(result == 0) {
					throw new RuntimeException("기안서 등록 실패");
				}
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
					}
				}
			}
		}
		
		return result;
	}

	@Override
	public int insertSimpleDraft(DraftDto draft) {
		return 0;
	}

	@Override
	public int insertPurchaseDraft(PurchaseDraftDto purchDraft) {
		return 0;
	}

	@Override
	public int insertPurchaseHistory(PurchaseHistoryDto purchHistory) {
		return 0;
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
		return 0;
	}

}
