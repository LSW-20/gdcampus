package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.CategoryDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class User2Dao {

	private final SqlSessionTemplate sqlSession;
//--------------------------------------인사팀 시작----------------------------------------------	
	public List<CategoryDto> selectCategory(String category) {
		return sqlSession.selectList("userMapper.selectCategory",category);
	}

	public int selectStaffListCount(Map<String, String> search) {
		return sqlSession.selectOne("userMapper.selectStaffListCount",search);
	}
	
	public List<UserDto> selectStaffList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("userMapper.selectStaffList",search,rowBounds);
	}

//--------------------------------------인사팀 끝----------------------------------------------
	
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
	
	/**
	 * 회원프로필수정
	 */
	public int updateProfileImg(UserDto m) {
		return sqlSession.update("userMapper.updateProfileImg",m);
	}
	
}