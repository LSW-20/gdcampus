package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.DeptDto;
import com.br.gdcampus.dto.UserDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class TreeDao {
	private final SqlSessionTemplate sqlSession;

	/**
	 * 부서목록 조회(가발령상태 제외)
	 * @author 보겸
	 * @return 인사,교무 부서정보
	 */
	public List<DeptDto> selectDepartments() {
		return sqlSession.selectList("treeMapper.selectDepartments");
	}

	public List<UserDto> selectUsersByDept(String deptNo) {
		//왜 널
	    System.out.println("DAO - deptNo value: " + deptNo);
	    System.out.println("DAO - deptNo type: " + (deptNo != null ? deptNo.getClass().getName() : "null"));		
		return sqlSession.selectList("treeMapper.selectUsersByDept",deptNo);
	}

	public List<Map<String, Object>> selectUsersByRank(int rankNo) {
		return sqlSession.selectList("treeMapper.selectUsersByRank", rankNo);
	}

	public Map<String, Object> selectUserDetail(String userNo) {
		return sqlSession.selectOne("treeMapper.selectUserDetail", userNo);
	}
	
	
}
