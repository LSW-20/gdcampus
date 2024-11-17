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
	
//--------------------------------------개설신청-교무팀 시작--------------------------------------------
	public List<ClassDto> selectClassList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("classMpper.selectStaffClassList",search,rowBounds);
	}
//--------------------------------------개설신청-교무팀 끝---------------------------------------------	
	
//--------------------------------------개설신청-교수 시작---------------------------------------------
	
//--------------------------------------개설신청-교수 끝----------------------------------------------	

//--------------------------------------내강의 시작---------------------------------------------
	
//--------------------------------------내강의 끝----------------------------------------------	
	
//---------------------------------------수업계획서 시작---------------------------------------------
	
//---------------------------------------수업계획서 끝----------------------------------------------	
}
