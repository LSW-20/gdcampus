package com.br.gdcampus.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return sqlSession.insert("studentMapper.insertStu", s);
	}
	
	
	public int updateStu(StudentDto s) {
		return sqlSession.update("studentMapper.updateStu", s);
	}
	
	public int deleteStu(int stuNo) {
		return sqlSession.update("studentMapper.deleteStu", stuNo);
	}
	public int deleteStus(List<Integer> stuNos) {
		Map<String, Object> params = new HashMap<>();
	    params.put("stuNos", stuNos);

	    return sqlSession.update("studentMapper.deleteStus", params);
	}
	
}
