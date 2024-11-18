package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.ClassDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;

public interface ClassService {

//--------------------------------------개설신청 시작--------------------------------------------
	
	// 개설신청 목록 조회
	int selectStaffOpningListCount(Map<String,String> search);
	List<ClassDto> selectStaffOpningList(Map<String,String> search, PageInfoDto pi);
	// 개설신청 상세 조회
	ClassDto selectStaffOpningDetail(String classCode);
	
	// 개설신청 목록 조회
	int selectProfOpningListCount(Map<String,String> search);
	List<ClassDto> selectProfOpningList(Map<String,String> search, PageInfoDto pi);	
	// 개설신청 상세 조회
	ClassDto selectProfOpningDetail(String classCode);
	// 개설신청 수정(보완)
	int updateOpning(ClassDto c);

	// 개설신청 승인, 반려, 보완요청, 취소(교수측)
	int updateOpningStatus(ClassDto c);
	
//--------------------------------------개설신청 끝----------------------------------------------	

//--------------------------------------내강의 시작---------------------------------------------
	
	// 내강의 목록 조회
	int selectMyClassListCount(Map<String,String> search);
	List<ClassDto> selectMyClassList(Map<String,String> search, PageInfoDto pi);
	// 내강의 상세 조회
	ClassDto selectMyClassDetail(String userNo);
	// 수강생 목록 조회
	ClassDto selectLearnerList(String classCode);
	
	// 수업계획서 상세조회
	ClassDto selectPlanList(String classCode);
	// 수업계획서 수정
	int updatePlanList(ClassDto c);
		
//---------------------------------------내강의 끝---------------------------------------------
	
	
}
