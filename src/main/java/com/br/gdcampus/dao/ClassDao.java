package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.ClassDto;
import com.br.gdcampus.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ClassDao {
	
	private final SqlSessionTemplate sqlSession;
	
//--------------------------------------개설신청 시작--------------------------------------------
	public int selectStaffOpningListCount(Map<String, String> search) {
		return sqlSession.selectOne("classMapper.selectStaffOpningListCount",search);
	}
	public List<ClassDto> selectStaffOpningList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("classMapper.selectStaffOpningList",search,rowBounds);
	}
	public ClassDto selectStaffOpningDetail(String classCode) {
		return sqlSession.selectOne("classMapper.selectStaffOpningDetail",classCode);
	}
	public int updateOpningStatus(ClassDto c) {
		return sqlSession.update("classMapper.updateOpningStatus",c);
	}
	public int updateClassStatus(ClassDto c) {
		// 승인상태로 변경하는 경우 class의 confirmYn의 값을 y로 바꿔줘야함 
		return sqlSession.update("classMapper.updateClassStatus",c);
	}
	public int selectProfOpningListCount(Map<String, String> search) {
		return sqlSession.selectOne("classMapper.selectProfOpningListCount",search);
	}
	public List<ClassDto> selectProfOpningList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("classMapper.selectProfOpningList",search,rowBounds);
	}
	public int selectSumClassTime(Map<String, String> search) {
		return sqlSession.selectOne("classMapper.selectSumClassTime",search);
	}

	
//--------------------------------------개설신청 끝----------------------------------------------
	

//--------------------------------------내강의 시작---------------------------------------------
	
	
//--------------------------------------내강의 끝----------------------------------------------	

}
