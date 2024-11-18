package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.ClassDao;
import com.br.gdcampus.dto.ClassDto;
import com.br.gdcampus.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClassServiceImpl implements ClassService {

	private final ClassDao classDao;
	
	@Override
	public int selectStaffOpningListCount(Map<String, String> search) {
		return classDao.selectStaffOpningListCount(search);
	}

	@Override
	public List<ClassDto> selectStaffOpningList(Map<String, String> search, PageInfoDto pi) {
		return classDao.selectStaffOpningList(search, pi);
	}

	@Override
	public ClassDto selectStaffOpningDetail(String classCode) {
		return classDao.selectStaffOpningDetail(classCode);
	}

	@Override
	public int selectProfOpningListCount(Map<String, String> search) {
		return 0;
	}

	@Override
	public List<ClassDto> selectProfOpningList(Map<String, String> search, PageInfoDto pi) {
		return null;
	}

	@Override
	public ClassDto selectProfOpningDetail(String classCode) {
		return null;
	}

	@Override
	public int updateOpning(ClassDto c) {
		return 0;
	}

	@Override
	public int updateOpningStatus(ClassDto c) {
		return 0;
	}

	@Override
	public int selectMyClassListCount(Map<String, String> search) {
		return 0;
	}

	@Override
	public List<ClassDto> selectMyClassList(Map<String, String> search, PageInfoDto pi) {
		return null;
	}

	@Override
	public ClassDto selectMyClassDetail(String userNo) {
		return null;
	}

	@Override
	public ClassDto selectLearnerList(String classCode) {
		return null;
	}

	@Override
	public ClassDto selectPlanList(String classCode) {
		return null;
	}

	@Override
	public int updatePlanList(ClassDto c) {
		return 0;
	}

}
