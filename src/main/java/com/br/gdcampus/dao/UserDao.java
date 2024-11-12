package com.br.gdcampus.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class UserDao {

	private final SqlSessionTemplate sqlSession;
	
}
