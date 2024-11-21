package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.DeptDto;
import com.br.gdcampus.dto.UserDto;

public interface TreeService {
    // 전체 조직도 트리 조회
    List<Map<String, Object>> getOrgTree();
    
    // 부서 목록 조회 (가발령 제외)
    List<DeptDto> selectDepartments();
    
    // 특정 부서의 사용자 목록 조회
    List<UserDto> selectUsersByDept(String deptNo);
    
    // 특정 직급의 사용자 목록 조회
    List<Map<String, Object>> selectUsersByRank(int rankNo);
    
    // 사용자 상세 정보 조회 (부서, 직급 포함)
    Map<String, Object> selectUserDetail(String userNo);
}
