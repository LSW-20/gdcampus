package com.br.gdcampus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.ApprovalDao;
import com.br.gdcampus.dto.ApprRefDto;
import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.PageInfoDto;

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
	public int selectMyDocListCount() {
		return 0;
	}

	@Override
	public List<ApprovalDto> selectMyDocList(PageInfoDto pi, String apprUser) {
		return null;
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

}
