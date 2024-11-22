package com.br.gdcampus.service;

import java.util.List;

import com.br.gdcampus.dto.StudentDto;

public interface StudentService {

	//학생 조회
	List<StudentDto> selectStu();
	
	//학생 추가
	int insertStu(StudentDto s);
	
	//학생 수정
	int updateStu(StudentDto s);
	
	//학생 삭제
	int deleteStu(int stuNo);
	
	//여러행 삭제
	boolean deleteStus(List<Integer> stuNoList);
}
