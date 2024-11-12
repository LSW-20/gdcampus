package com.br.gdcampus.service;

import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;

/**
 * 인사팀 회원관리 서비스(김하늘)
 */
public interface UserService {
	// 행정직원 목록조회 + 이름으로 키워드 검색 + 부서/직급별 조회
	int selectStaffListCount(Map<String,String> search);
	List<UserDto> selectStaffList(Map<String,String> search, PageInfoDto pi);
	//행정직원 상세조회
	UserDto selectStaff(String userNo);
	//행정직원 추가
	int insertStaff(UserDto user);
	//행정직원 수정
	int updateStaff(UserDto user);
	
	//교수 목록조회 + 이름으로 키워드 검색 + 부서/직급별 조회
	int selectProfListCount(Map<String,String> search);
	List<UserDto> selectProfList(Map<String,String> search, PageInfoDto pi);
	//교수 상세조회
	UserDto selectProf(String userNo);
	//교수 추가
	int insertProf(UserDto user);
	//교수 수정
	int updateProf(UserDto user);
	
	//직원 퇴사처리
	int deleteUser(String loginUserNo, String userNo);
	//비밀번호 초기화
	int PwdReset(String loginUserNo, String userNo);
	
	//부서 카테고리 조회
	Category selectDept();
	//직급 카테고리 조회
	Category selectRank();
	//학과 카테고리 조회
	Category selectStDept();
	
}
