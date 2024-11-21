package com.br.gdcampus.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.WorkStatusDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Repository
public class HoliDao {
	
	private final SqlSessionTemplate sqlSession;
	
	public WorkStatusDto selectworkStatus(String userNo) {
		return sqlSession.selectOne("holimapper.selectworkStatus", userNo);
	}
	
}
