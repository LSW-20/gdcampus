package com.br.gdcampus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.StudentDao;
import com.br.gdcampus.dto.StudentDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService {

	private final StudentDao stuDao;
	
	@Override
	public List<StudentDto> selectStu() {
		return stuDao.selectStu();
	}

	@Override
	public int updateStu(StudentDto s) {
		return stuDao.updateStu(s);
	}

	@Override
	public int deleteStu(StudentDto s) {
		return stuDao.deleteStu(s);
	}

	@Override
	public int insertStu(StudentDto s) {
		return stuDao.insertStu(s);
	}

}
