package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.ClassDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;

public interface ClassService {

//--------------------------------------개설신청-교무팀 시작--------------------------------------------
	
	// 개설신청 목록 조회
	int selectStaffOpningListCount(Map<String,String> search);
	List<ClassDto> selectStaffOpningList(Map<String,String> search, PageInfoDto pi);
	// 개설신청 상세 조회
	ClassDto selectStaffOpningDetail(String classCode);
	// 개설신청 승인 처리(여부도 바뀌어야함 이건 트리거로?), 반려처리, 보완요청
	int updateOpningStatus(ClassDto c);
	
//--------------------------------------개설신청-교무팀 끝---------------------------------------------	
		
//--------------------------------------개설신청-교수 시작---------------------------------------------
	
	// 개설신청 목록 조회
	int selectProfOpningListCount(Map<String,String> search);
	List<UserDto> selectProfOpningList(Map<String,String> search, PageInfoDto pi);	
	// 개설신청 상세 조회
	ClassDto selectProfOpningDetail(String classCode);
	// 개설신청 상세 조회
	
	// 개설신청 수정(보완)
	
	// 개설신청 취소 처리
	
	
//--------------------------------------개설신청-교수 끝----------------------------------------------	

//--------------------------------------내강의 시작---------------------------------------------
	
	// 내강의 목록 조회
	
	// 내강의 상세 조회
	
	// 수강생 상세 조회
	
	
//--------------------------------------내강의 끝----------------------------------------------	
		
//---------------------------------------수업계획서 시작---------------------------------------------
	
	// 수업계획서 조회
	
	// 수업계획서 수정
	
	// 수업계획서 삭제
	
	// 수업계획서 추가
	
	
//---------------------------------------수업계획서 끝----------------------------------------------		
	
}
