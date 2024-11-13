package com.br.gdcampus.dao;

import java.util.List;

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

	public int selectApprTodoListCount() {
		return sqlSession.selectOne("approvalMapper.selectApprTodoListCount");
	}

	public List<ApprovalDto> selectApprTodoList(PageInfoDto pi, String userNo) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(),pi.getBoardLimit());
		
		return sqlSession.selectList("approvalMapper.selectApprTodoList",userNo,rowBounds);
	}
	
	

}
