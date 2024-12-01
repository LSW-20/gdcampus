package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.ClassDao;
import com.br.gdcampus.dto.CategoryDto;
import com.br.gdcampus.dto.ClassDto;
import com.br.gdcampus.dto.EvaMethodDto;
import com.br.gdcampus.dto.LessonPlanDto;
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
		return classDao.selectProfOpningListCount(search);
	}

	@Override
	public List<ClassDto> selectProfOpningList(Map<String, String> search, PageInfoDto pi) {
		return classDao.selectProfOpningList(search, pi);
	}
	@Override
	public int selectSumClassTime(Map<String, String> search) {
		return classDao.selectSumClassTime(search);
	}
	@Override
	public int insertClass(ClassDto c) {
		int result= 1;
		if(result == classDao.insertClass(c)) {
			if(result == classDao.insertOpning(c)) {
				if(result == classDao.insertEva(c)) {
					return 1;
				};
			};
		};
		return -1;
	}

	@Override
	public ClassDto selectProfOpningDetail(String classCode) {
		return null;
	}

	@Override
	public int updateOpning(ClassDto c) {
		int result = 0;
		int count = 0;
		//수업테이블 update
		result += classDao.updateClass(c);
		
		//개설신청테이블 update
		result += classDao.updateOpenAppl(c);
		
		//변경된 평가방식  update
		for(EvaMethodDto e : c.getUpdateEvaList()) {
			e.setClassCode(c.getUpdateClassCode());
			
			count += classDao.updateEva(e);
		}
		if(count == c.getUpdateEvaList().size()) {
			result += 1;
		}
		
		count = 0;
		
		//사라진 평가방식  delete
		for(EvaMethodDto e : c.getDeleteEvaList()) {
			e.setClassCode(c.getUpdateClassCode());
			count += classDao.deleteEva(e);
		}
		if(count == c.getDeleteEvaList().size()) {
			result += 1;
		}
		
		count = 0;
		
		//추가된 평가방식 insert
		for(EvaMethodDto e : c.getEvaList()) {
			e.setClassCode(c.getUpdateClassCode());			
			count += classDao.insertEvaMethod(e);
		}
		if(count == c.getEvaList().size()) {
			result += 1;
		}
		
		if(result == 5) {
			return 1;
		}else {
			return -1;
		}
	}

	@Override
	public int updateOpningStatus(ClassDto c) {
		int result = 0;
		
		result += classDao.updateOpningStatus(c);
		if(c.getStatus().equals("승인")) {
			result += classDao.updateClassStatus(c);
		}
		return result;
	}

	@Override
	public int selectMyClassListCount(Map<String, String> search) {
		return classDao.selectMyClassListCount(search);
	}

	@Override
	public List<ClassDto> selectMyClassList(Map<String, String> search, PageInfoDto pi) {
		return classDao.selectMyClassList(pi, search);
	}

	@Override
	public ClassDto selectMyClassDetail(String classCode) {
		return classDao.selectMyClassDetail(classCode);
	}

	@Override
	public ClassDto selectLearnerList(String classCode) {
		return classDao.selectLearnerList(classCode);
	}

	@Override
	public List<Map<String, Object>> selectLearnerCount(String classCode) {
		return classDao.selectLearnerCount(classCode);
	}
	@Override
	public ClassDto selectPlanList(String classCode) {
		return classDao.selectPlanList(classCode);
	}

	@Override
	public int updatePlanList(ClassDto c) {
		return 0;
	}

	@Override
	public List<CategoryDto> selectCategory(String string) {
		// 학과 조회
		return classDao.selectCategory(string);
	}

	@Override
	public List<LessonPlanDto> selectLessonPlanList(String classCode) {
		return classDao.selectLessonPlanList(classCode);
	}

	@Override
	public int updatePlanList(LessonPlanDto lesson) {
		int result = 0;
		int count = 0;
		count += classDao.deleteLesson(lesson);
		for(LessonPlanDto l : lesson.getDeletePlanList()) {			
			count += classDao.deleteLesson(l);
		}
		if(count == lesson.getDeletePlanList().size()) {
			System.out.println("count:"+count);
			System.out.println("size:"+lesson.getDeletePlanList().size());
			result += 1;
		}
		
		count = 0;
		
		for(LessonPlanDto l : lesson.getUpdatePlanList()) {
			l.setClassCode(lesson.getClassCode());
			
			count += classDao.insertLesson(l);
		}
		if(count == lesson.getUpdatePlanList().size()) {
			result += 1;
		}
		
		return result;
	}

	@Override
	public List<Map<String, Object>> selectStDeptCount() {
		return classDao.selectStDeptCount();
	}

	@Override
	public List<Map<String, Object>> selectDeptCount() {
		return classDao.selectDeptCount();
	}


}
