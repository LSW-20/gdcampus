package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.br.gdcampus.dao.UserDao;
import com.br.gdcampus.dto.CategoryDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.RankDto;
import com.br.gdcampus.dto.UserDto;

import jakarta.servlet.http.HttpSession;
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
		return userDao.insertStaff(user);
	}

	/**
	 * 행정직원 수정 메소드
	 */
	@Override
	public int updateStaff(UserDto user) {
		return userDao.updateStaff(user);
	}

	/**
	 * 교수 목록조회시 페이징 처리를 위한 Count 메소드
	 */
	@Override
	public int selectProfListCount(Map<String, String> search) {
		return userDao.selectProfListCount(search);
	}

	/**
	 * 교수 목록조회 메소드
	 */
	@Override
	public List<UserDto> selectProfList(Map<String, String> search, PageInfoDto pi) {
		return userDao.selectProfList(search, pi);
	}

	/**
	 * 교수 상세조회 메소드
	 */
	@Override
	public UserDto selectProf(String userNo) {
		return userDao.selectProf(userNo);
	}
	
	/**
	 * 교수 추가 메소드
	 */
	@Override
	public int insertProf(UserDto user) {
		return userDao.insertProf(user);
	}

	/**
	 * 교수 수정 메소드
	 */
	@Override
	public int updateProf(UserDto user) {
		return userDao.updateProf(user);
	}

	/**
	 * 교수 사원 퇴사처리 메소드
	 * @param loginUserNo - 수정자 사번
	 * @param userNo - 탈퇴처리할 사원의 사번
	 * 
	 */
	@Override
	public 	int deleteUser(Map<String, String> delInfo) {
		return userDao.deleteUser(delInfo);
	}

	/**
	 * 비밀번호 초기화 메소드
	 */
	@Override
	public int PwdReset(UserDto user) {
		return userDao.PwdReset(user);
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
	
	/**
	 * 관리자 유저의 사번, 이름 조회
	 * author : 상우
	 * @return 관리자 유저의 사번, 이름
	 */
	@Override
	public List<UserDto> selectAdminList() {
		return userDao.selectAdminList();
	}
	
	/** 
	 * 교수 유저의 사번, 이름, 학과명 담기
	 * author : 상우
	 * @return 교수 유저의 사번, 이름, 학과명
	 */
	@Override
	public List<UserDto> selectProfessorList() {
		return userDao.selectProfessorList();
	}
	
	
	/**
	 * 각 부서별 유저의 사번, 이름, 부서(직책), 직급 조회
	 * author : 상우
	 * @return 각 부서별 유저의 사번, 이름, 부서(직책), 직급
	 */
	@Override
	public List<UserDto> selectChatUserList(String dept) {
		return userDao.selectChatUserList(dept);
	}
	
	/**
	 * 부서 카테고리 조회
	 * author : 상우
	 * @return 부서 카테고리들
	 */
	@Override
	public List<String> selectDeptList() {
		return userDao.selectDeptList();
	}
	
	/**
	 * 사번으로 이름 찾기
	 * author : 상우
	 * @return 이름
	 */
	@Override
	public String selectUserNameByUserNo(String userNo) {
		return userDao.selectUserNameByUserNo(userNo);
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







	/**
	 * 아이디찾기
	 */
	@Override
	public UserDto idSearch(String email, String userName) {
		return userDao.idSearch(email,userName);
	}

	/**
	 * 비밀번호찾기
	 */
	@Override
	public UserDto pwdSearch(String email, String userId) {
		return userDao.pwdSearch(email,userId);
	}

	/**
	 * 비밀번호수정
	 */
	@Override
	public int pwdUpdate(UserDto m) {
		return userDao.pwdUpdate(m);
	}

	/**
	 * 직급페이지
	 */
	@Override
	public List<RankDto> selectRank() {
		return userDao.selectRank();
	}
	/**
	 * 직급추가
	 */
	@Override
	public int insertRank(RankDto r) {
		return userDao.insertRank(r);
	}
	/**
	 * 직급수정
	 */
	@Override
	public int updateRank(RankDto r) {
		return userDao.updateRank(r);
	}
	/**
	 * 직급삭제
	 */
	@Override
	public int deleteRank(int rankNo) {
		return userDao.deleteRank(rankNo);
	}

	/**
	 * 여러행삭제
	 */
	@Override
	@Transactional
	 public boolean deleteRanks(List<Integer> rankNos) {
		rankNos.removeIf(Objects::isNull);
		System.out.println("service :" + rankNos);
		try {
            userDao.deleteRanks(rankNos);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}
	
	/**
	 * 회원탈퇴
	 */
	@Override
	public int resignUser(String userNo) {
		return userDao.resignUser(userNo);
	}
	
	
	

}
