package com.br.gdcampus.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.MemberDto;
import com.br.gdcampus.dto.UserDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class UserDao {

	private final SqlSessionTemplate sqlSession;
	
	public UserDto selectUser(UserDto m) {
		return sqlSession.selectOne("userMapper.selectUser",m);
	}
}
