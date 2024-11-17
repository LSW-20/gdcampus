package com.br.gdcampus.service;

import java.util.List;

import com.br.gdcampus.dto.DeptDto;

/**
 * 부서 카테고리 관리
 * @author 박한나
 * 
 */
public interface DeptService {
    List<DeptDto> selectCategoryDeptDto(); // 부서 목록 조회
    int insertCategoryDept(DeptDto dept); // 부서 추가
    int updateCategoryDept(DeptDto dept); // 부서 수정
    int deleteCategoryDept(String deptNo); // 부서 삭제
}
