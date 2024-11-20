package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.ApprLineDto;
import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.DraftDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PurchaseDraftDto;
import com.br.gdcampus.dto.PurchaseHistoryDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
@Mapper
public class ApprovalDao {
	private final SqlSessionTemplate sqlSession;

	/**
	 * 결재문서함리스트페이징count
	 * @author 보겸
	 * @return 게시물개수
	 */
	public int selectApprTodoListCount() {
		return sqlSession.selectOne("approvalMapper.selectApprTodoListCount");
	}

	/**
	 * 결재문서함 리스트 목록 조회
	 * @author 보겸
	 * @param pi 페이징정보
	 * @param userNo loginUser정보
	 * @return 결재문서 리스트
	 */
	public List<ApprovalDto> selectApprTodoList(PageInfoDto pi, String userNo) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(),pi.getBoardLimit());
		
		return sqlSession.selectList("approvalMapper.selectApprTodoList",userNo,rowBounds);
	}

	/**
	 * 기안문서함페이징 count
	 * @author 보겸
	 * @param params : status(진행상태), userNo(loginUser)
	 * @return 게시물 개수
	 */
	public int selectMyDocListCount(Map<String, Object> params) {
		return sqlSession.selectOne("approvalMapper.selectMyDocListCount",params);
	}

	/**
	 * 기안문서함 리스트조회
	 * @author 보겸
	 * @param pi 페이징정보
	 * @param params : status(진행상태), userNo(loginUser)
	 * @return 게시물개수
	 */
	public List<ApprovalDto> selectMyDocList(PageInfoDto pi, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(),pi.getBoardLimit());
		
		return sqlSession.selectList("approvalMapper.selectMyDocList",params,rowBounds);
	}

	/**
	 * 기안문서함>진행중>최근순5게시물
	 * @author 보겸
	 * @param userNo
	 * @return 진행중인 내가기안한문서 5개
	 */
	public List<ApprovalDto> getRecentInProgressDocs(String userNo) {
		return sqlSession.selectList("approvalMapper.getRecentInProgressDocs",userNo);
	}

	/**
	 * 기안문서함>승인/반려>최근순5개
	 * @author 보겸
	 * @param userNo
	 * @return 완료된 내가기안한문서 5개
	 */
	public List<ApprovalDto> getRecentCompletedDocs(String userNo) {
		return sqlSession.selectList("approvalMapper.getRecentCompletedDocs",userNo);
	}

	/**
	 * 결재요청
	 * @param approval
	 * @return 처리행수
	 */
	public int insertApproval(ApprovalDto approval) {
		return sqlSession.insert("approvalMapper.insertApproval",approval);
	}

	/**
	 * 결재선 insert
	 * @param line
	 * @return
	 */
	public int insertApprovalLine(ApprLineDto line) {
		return sqlSession.insert("approvalMapper.insertApprovalLine",line);
	}

	/**
	 * 기안서 insert
	 * @param draft
	 * @return
	 */
	public int insertSimpleDraft(DraftDto draft) {
		return sqlSession.insert("approvalMapper.insertSimpleDraft",draft);
	}

	/**
	 * 품의서 insert
	 * @param purchDraft
	 * @return
	 */
	public int insertPurchaseDraft(PurchaseDraftDto purchDraft) {
		return sqlSession.insert("approvalMapper.insertPurchaseDraft",purchDraft);
	}

	/**
	 * 품의서>물품 insert
	 * @param item
	 * @return
	 */
	public int insertPurchaseHistory(PurchaseHistoryDto item) {
		return sqlSession.insert("approvalMapper.insertPurchaseHistory",item);
	}
	
	

}
