package com.br.gdcampus.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.TreeDao;
import com.br.gdcampus.dto.DeptDto;
import com.br.gdcampus.dto.UserDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TreeServiceImpl implements TreeService {

	private final TreeDao treeDao;
	
	@Override
	public List<Map<String, Object>> getOrgTree() {
	    // 1. 부서 목록 조회
	    List<DeptDto> deptList = treeDao.selectDepartments();
	    List<Map<String, Object>> result = new ArrayList<>();

	    // 2. 각 부서별 사용자 조회 및 트리 구조 생성
	    for(DeptDto dept : deptList) {
	        String deptNo = dept.getDeptNo();
	        List<UserDto> userList = treeDao.selectUsersByDept(deptNo);

	        // 사용자 정보를 자식 노드로 변환
	        List<Map<String, Object>> children = new ArrayList<>();
	        for(UserDto user : userList) {
	            Map<String, Object> userData = new HashMap<>();
	            userData.put("userNo", user.getUserNo());
	            userData.put("userName", user.getUserName());
	            userData.put("rankName", user.getRankName());
	            userData.put("deptName", user.getDeptName());

	            // jstree 노드 정보
	            Map<String, Object> userNode = new HashMap<>();
	            userNode.put("id", "user_" + user.getUserNo());
	            userNode.put("text", user.getUserName() + " " + user.getRankName());
	            userNode.put("type", "user");
	            userNode.put("data", userData);  // 사용자 상세 정보를 data 속성에 저장
	            
	            children.add(userNode);
	        }

	        // 부서 노드 정보
	        Map<String, Object> deptNode = new HashMap<>();
	        deptNode.put("id", "dept_" + deptNo);
	        deptNode.put("text", dept.getDeptName());
	        deptNode.put("type", "department");
	        deptNode.put("children", children);

	        result.add(deptNode);
	    }

	    return result;
	}

	@Override
	public List<DeptDto> selectDepartments() {
		return treeDao.selectDepartments();
	}

	@Override
	public List<UserDto> selectUsersByDept(String deptNo) {
		return treeDao.selectUsersByDept(deptNo);
	}

	@Override
	public List<Map<String, Object>> selectUsersByRank(int rankNo) {
		return treeDao.selectUsersByRank(rankNo);
	}

	@Override
	public Map<String, Object> selectUserDetail(String userNo) {
		return treeDao.selectUserDetail(userNo);
	}

}
