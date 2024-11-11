package com.br.gdcampus.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MemberDao {
	private final SqlSessionTemplate sqlSession;

	public MemberDto selectMember(MemberDto m) {
		return sqlSession.selectOne("memberMapper.selectMember",m);
	}

}
