package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.PageInfoDto;

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
	 * @param params : status(진행상태), userNo(loginUser)
	 * @return 게시물 개수
	 */
	public int selectMyDocListCount(Map<String, Object> params) {
		return sqlSession.selectOne("approvalMapper.selectMyDocListCount",params);
	}

	/**
	 * 기안문서함 리스트조회
	 * @param pi 페이징정보
	 * @param params : status(진행상태), userNo(loginUser)
	 * @return 게시물개수
	 */
	public List<ApprovalDto> selectMyDocList(PageInfoDto pi, Map<String, Object> params) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(),pi.getBoardLimit());
		
		return sqlSession.selectList("approvalMapper.selectMyDocList",params,rowBounds);
	}
	
	

}
