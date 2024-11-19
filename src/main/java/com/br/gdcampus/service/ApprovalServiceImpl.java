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
		return apprDao.insertApproval(approval);
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

}
