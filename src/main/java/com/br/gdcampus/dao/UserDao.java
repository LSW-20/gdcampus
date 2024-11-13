package com.br.gdcampus.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.UserDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class UserDao {

	private final SqlSessionTemplate sqlSession;
	
	/**
	 * 로그인
	 * @param m
	 * @return
	 */
	public UserDto selectUser(UserDto m) {
		return sqlSession.selectOne("userMapper.selectUser",m);
	}
	
	/**
	 * 회원정보수정
	 * @param m
	 * @return
	 */
	public int updateUser(UserDto m) {
		return sqlSession.update("userMapper.updateUser",m);
	}
}
