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
public class UserDao {

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
	
	/**
	 * 관리자 유저의 사번, 이름 조회
	 * author : 상우
	 * @return 관리자 유저의 사번, 이름
	 */
	public List<UserDto> selectAdminList() {
		return sqlSession.selectList("userMapper.selectAdminList");
	}
	
	/** 
	 * 교수 유저의 사번, 이름, 학과명 담기
	 * author : 상우
	 * @return 교수 유저의 사번, 이름, 학과명
	 */
	public List<UserDto> selectProfessorList() {
		return sqlSession.selectList("userMapper.selectProfessorList");
	}

	/**
	 * 각 부서별 유저의 사번, 이름, 부서(직책), 직급 조회
	 * author : 상우
	 * @return 각 부서별 유저의 사번, 이름, 부서(직책), 직급 
	 */
	public List<UserDto> selectChatUserList(String dept) {
		return sqlSession.selectList("userMapper.selectChatUserList", dept);
	}

	/**
	 * 부서 카테고리 조회
	 * author : 상우
	 * @return 부서 카테고리들
	 */
	public List<String> selectDeptList() {
		return sqlSession.selectList("userMapper.selectDeptList");
	}




	
}
