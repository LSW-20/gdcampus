package com.br.gdcampus.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.UserDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class UserDao {

	private final SqlSessionTemplate sqlSession;
	
	public UserDto selectUser(UserDto m) {
		return sqlSession.selectOne("userMapper.selectUser",m);
	}

	
	/**
	 * 회원(교수)의 소속학과 번호로 소소학과 이름 조회 
	 * author : 상우
	 * @param stDeptNo 소속학과 번호
	 * @return 소속학과 이름
	 */
	public String selectStDeptName(String stDeptNo) {
		return sqlSession.selectOne("userMapper.selectStDeptName", stDeptNo);
	}
	
	
	/**
	 * 부서번호로 부서명 조회
	 * author : 상우
	 * @param deptNo 부서번호
	 * @return 부서명
	 */
	public String selectDeptName(String deptNo) {
		return sqlSession.selectOne("userMapper.selectDeptName", deptNo);
	}
	
	/**
	 * 직급번호로 직급명 조회
	 * author : 상우
	 * @param rankNo 직급번호
	 * @return 직급명
	 */
	public String selectRankName(String rankNo) {
		return sqlSession.selectOne("userMapper.selectRankName", rankNo);
	}
}
