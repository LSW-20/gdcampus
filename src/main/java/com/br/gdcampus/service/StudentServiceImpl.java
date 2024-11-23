package com.br.gdcampus.service;

import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int deleteStu(int stuNo) {
		return stuDao.deleteStu(stuNo);
	}

	@Override
	public int insertStu(StudentDto s) {
		return stuDao.insertStu(s);
	}

	@Override
	@Transactional
	public boolean deleteStus(List<Integer> stuNos) {
		stuNos.removeIf(Objects::isNull);
		System.out.println("service :" + stuNos);
		try {
            stuDao.deleteStus(stuNos);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}

}
