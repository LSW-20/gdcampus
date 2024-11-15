package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

public interface TreeService {
    // 전체 조직도 트리 조회
    List<Map<String, Object>> getOrgTree();
    
    // 부서 목록 조회 (가발령 제외)
    List<Map<String, Object>> getDepartments();
    
    // 특정 부서의 사용자 목록 조회
    List<Map<String, Object>> getDeptUsers(String deptNo);
    
    // 특정 직급의 사용자 목록 조회
    List<Map<String, Object>> getUsersByRank(int rankNo);
    
    // 사용자 상세 정보 조회 (부서, 직급 포함)
    Map<String, Object> getUserDetail(String userNo);
}
