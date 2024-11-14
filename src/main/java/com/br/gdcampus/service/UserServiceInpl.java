package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.UserDao;
import com.br.gdcampus.dto.CategoryDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceInpl implements UserService {
	
	private final UserDao userDao;

	/**
	 * 행정직원 목록조회시 페이징처리를 위한 Count 메소드
	 */
	@Override
	public int selectStaffListCount(Map<String, String> search) {
		return userDao.selectStaffListCount(search);
	}

	/**
	 * 행정직원 목록조회 메소드
	 */
	@Override
	public List<UserDto> selectStaffList(Map<String, String> search, PageInfoDto pi) {
		return userDao.selectStaffList(search, pi);
	}

	/**
	 * 행정직원 상세조회 메소드
	 */
	@Override
	public UserDto selectStaff(String userNo) {
		return userDao.selectStaff(userNo);
	}

	/**
	 * 행정직원 추가 메소드
	 */
	@Override
	public int insertStaff(UserDto user) {
		return 0;
	}

	/**
	 * 행정직원 수정 메소드
	 */
	@Override
	public int updateStaff(UserDto user) {
		return 0;
	}

	/**
	 * 교수 목록조회시 페이징 처리를 위한 Count 메소드
	 */
	@Override
	public int selectProfListCount(Map<String, String> search) {
		return 0;
	}

	/**
	 * 교수 목록조회 메소드
	 */
	@Override
	public List<UserDto> selectProfList(Map<String, String> search, PageInfoDto pi) {
		return null;
	}

	/**
	 * 교수 상세조회 메소드
	 */
	@Override
	public UserDto selectProf(String userNo) {
		return null;
	}
	
	/**
	 * 교수 추가 메소드
	 */
	@Override
	public int insertProf(UserDto user) {
		return 0;
	}

	/**
	 * 교수 수정 메소드
	 */
	@Override
	public int updateProf(UserDto user) {
		return 0;
	}

	/**
	 * 교수 사원 퇴사처리 메소드
	 * @param loginUserNo - 수정자 사번
	 * @param userNo - 탈퇴처리할 사원의 사번
	 * 
	 */
	@Override
	public int deleteUser(String loginUserNo, String userNo) {
		return 0;
	}

	/**
	 * 교수 사원 비밀번호 초기화 메소드
	 * @param loginUserNo - 수정자 사번
	 * @param userNo - 비밀번호 초기화 할 사원의 사번
	 */
	@Override
	public int PwdReset(String loginUserNo, String userNo) {
		return 0;
	}

	/**
	 * 카테고리 동적 생성을 위해 매번 부서,직급,학과를 조회해야해서 
	 * 아예 따로 빼두고 재활용
	 */
	@Override
	public List<CategoryDto> selectCategory(String category) {
		return userDao.selectCategory(category);
	}


	@Override
	/**
	 * 로그인 메소드
	 */
	public UserDto selectUser(UserDto m) {
		return userDao.selectUser(m);
	}

	
	/**
	 * 회원(교수)의 소속학과 번호로 소소학과 이름 조회 
	 * author : 상우
	 * @param stDeptNo 소속학과 번호
	 * @return 소속학과 이름
	 */
	@Override
	public String selectStDeptName(String stDeptNo) {
		return userDao.selectStDeptName(stDeptNo);
	}

	/**
	 * 부서번호로 부서명 조회
	 * author : 상우
	 * @param deptNo 부서번호
	 * @return 부서명
	 */
	@Override
	public String selectDeptName(String deptNo) {
		return userDao.selectDeptName(deptNo);
	}

	/**
	 * 직급번호로 직급명 조회
	 * author : 상우
	 * @param rankNo 직급번호
	 * @return 직급명
	 */
	@Override
	public String selectRankName(String rankNo) {
		return userDao.selectRankName(rankNo);
	}
	@Override
	/**
	 * 회원정보수정 메소드
	 */
	public int updateUser(UserDto m) {
		return userDao.updateUser(m);
	}

	/**
	 * 프로필이미지수정 메소드
	 */
	@Override
	public int updateProfileImg(UserDto m) {
		return userDao.updateProfileImg(m);
	}
	
	

}
