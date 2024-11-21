package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.CategoryDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.RankDto;
import com.br.gdcampus.dto.UserDto;

import jakarta.servlet.http.HttpSession;

/**
 * 인사팀 회원관리 서비스(김하늘)
 */
public interface UserService {
//------------------------------인사팀 시작--------------------------------------	
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
	int PwdReset(UserDto user);
	//카테고리 조회
	List<CategoryDto> selectCategory(String category);
//------------------------------인사팀 끝--------------------------------------	
	//로그인
	UserDto selectUser(UserDto m);
	
	// 소속학과 이름 조회 - 상우
	String selectStDeptName(String stDeptNo);
	// 부서명 조회 - 상우
	String selectDeptName(String deptNo);
	// 직급명 조회 - 상우
	String selectRankName(String rankNo);
	// 관리자 유저의 사번, 이름 담기 - 상우
	List<UserDto> selectAdminList();
	// 교수 유저의 사번, 이름, 학과명 담기 - 상우
	List<UserDto> selectProfessorList();
	// 부서 카테고리 조회 - 상우
	List<String> selectDeptList();
	// 각 부서별 유저의 사번, 이름, 부서(직책), 직급 조회 - 상우
	List<UserDto> selectChatUserList(String dept);
	// 사번으로 이름찾기 - 상우
	String selectUserNameByUserNo(String userNo);
	
	//회원정보수정
	int updateUser(UserDto m); 
	//회원프로필수정
	int updateProfileImg(UserDto m);



	
	//아이디찾기
	UserDto idSearch(String email,String userName);
	//비번찾기
	UserDto pwdSearch(String email,String userId);
	//비번수정
	int pwdUpdate(UserDto m);
	//직급페이지
	List<RankDto> selectRank();
	//직급추가
	int insertRank(RankDto r);
	//직급수정
	int updateRank(RankDto r);
	//직급삭제
	int deleteRank(int rankNo);
	//직급여러행삭제
	int deleteRanks(List<Integer> rankNoList);
	//회원탈퇴
	int resignUser(String userNo);
}
