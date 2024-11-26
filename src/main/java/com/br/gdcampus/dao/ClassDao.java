package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.CategoryDto;
import com.br.gdcampus.dto.ClassDto;
import com.br.gdcampus.dto.EvaMethodDto;
import com.br.gdcampus.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ClassDao {
	
	private final SqlSessionTemplate sqlSession;
	
//--------------------------------------개설신청 시작--------------------------------------------
	public int selectStaffOpningListCount(Map<String, String> search) {
		return sqlSession.selectOne("classMapper.selectStaffOpningListCount",search);
	}
	public List<ClassDto> selectStaffOpningList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("classMapper.selectStaffOpningList",search,rowBounds);
	}
	public ClassDto selectStaffOpningDetail(String classCode) {
		return sqlSession.selectOne("classMapper.selectStaffOpningDetail",classCode);
	}
	public int updateOpningStatus(ClassDto c) {
		return sqlSession.update("classMapper.updateOpningStatus",c);
	}
	public int updateClassStatus(ClassDto c) {
		// 승인상태로 변경하는 경우 class의 confirmYn의 값을 y로 바꿔줘야함 
		return sqlSession.update("classMapper.updateClassStatus",c);
	}
	public int selectProfOpningListCount(Map<String, String> search) {
		return sqlSession.selectOne("classMapper.selectProfOpningListCount",search);
	}
	public List<ClassDto> selectProfOpningList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("classMapper.selectProfOpningList",search,rowBounds);
	}
	public int selectSumClassTime(Map<String, String> search) {
		return sqlSession.selectOne("classMapper.selectSumClassTime",search);
	}
	public List<CategoryDto> selectCategory(String category) {
		return sqlSession.selectList("userMapper.selectCategory",category);
	}
	public int insertClass(ClassDto c) {
		return sqlSession.insert("classMapper.insertClass",c);
	}
	public int insertOpning(ClassDto c) {
		return sqlSession.insert("classMapper.insertOpning",c);
	}
	public int insertEva(ClassDto c) {
		List<EvaMethodDto> evaList = c.getEvaList();
		int sum = 0;
		for(EvaMethodDto e : evaList) {
			e.setClassCode(c.getClassCode());
			sum += sqlSession.insert("classMapper.insertEva",e);
		};
		if(sum == evaList.size()) {
			return 1;
		}else {
			return -1;
		}
	}
	public int updateClass(ClassDto c) {
		return sqlSession.update("classMapper.updateClass",c);
	}
	public int updateOpenAppl(ClassDto c) {
		return sqlSession.update("classMapper.updateOpenAppl",c);
	}
	public int updateEva(EvaMethodDto e) {
		return sqlSession.update("classMapper.updateEva",e);
	}
	public int deleteEva(EvaMethodDto e) {
		return sqlSession.delete("classMapper.deleteEva",e);
	}
	public int insertEvaMethod(EvaMethodDto e) {
		return sqlSession.insert("classMapper.insertEvaMethod",e);
	}
	
//--------------------------------------개설신청 끝----------------------------------------------
	public int selectMyClassListCount(Map<String, String> search) {
		return sqlSession.selectOne("classMapper.selectMyClassListCount",search);
	}
	public List<ClassDto> selectMyClassList(PageInfoDto pi, Map<String, String> search) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("classMapper.selectMyClassList",search,rowBounds);
	}
	public ClassDto selectMyClassDetail(String classCode) {
		return sqlSession.selectOne("classMapper.selectMyClassDetail",classCode);
	}
	public ClassDto selectLearnerList(String classCode) {
		return sqlSession.selectOne("classMapper.selectLearnerList", classCode);
	}
	public List<Map<String, Object>> selectLearnerCount(String classCode) {
		return sqlSession.selectList("classMapper.selectLearnerCount", classCode);
	}

//--------------------------------------내강의 시작---------------------------------------------
	
	
//--------------------------------------내강의 끝----------------------------------------------	

}
