package com.br.gdcampus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.StudentDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class StudentDao {
	private final SqlSessionTemplate sqlSession;
	
	public List<StudentDto> selectStu() {
		return sqlSession.selectList("studentMapper.selectStu");
	}
	
	public int insertStu(StudentDto s) {
		return sqlSession.insert("studentMapper.insertStu");
	}
	
	public int updateStu(StudentDto s) {
		return sqlSession.update("studentMapper.updateStu");
	}
	
	public int deleteStu(StudentDto s) {
		return sqlSession.update("studentMapper.deleteStu");
	}
}
