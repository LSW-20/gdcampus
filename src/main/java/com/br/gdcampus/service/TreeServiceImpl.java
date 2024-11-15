package com.br.gdcampus.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.TreeDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TreeServiceImpl implements TreeService {

	private final TreeDao treeDao;
	
	@Override
	public List<Map<String, Object>> getOrgTree() {
		
		//1. 부서 목록 조회
		List<Map<String,Object>> deptList = treeDao.selectDepartments();
		
		//2. 각 부서별 사용자 조회 및 트리 구조 생성
		for(Map<String,Object> dept: deptList) {
			
			//deptNo null문제 로그 찍어보기
	        Object deptNoObj = dept.get("deptNo");
	        System.out.println("deptNo value: " + deptNoObj);
	        System.out.println("deptNo type: " + (deptNoObj != null ? deptNoObj.getClass().getName() : "null"));
	        			
			
			String deptNo = (String)dept.get("deptNo");
			List<Map<String,Object>> userList = treeDao.selectUsersByDept(deptNo);
			
			//사용자정보를 자식 노드로 변환
			List<Map<String,Object>> children = new ArrayList<>();
			for(Map<String,Object> user : userList) {
				Map<String,Object> userNode = new HashMap<>();
				userNode.put("id", user.get("userNo"));
				userNode.put("text", user.get("userName")+" "+user.get("rankName"));
				userNode.put("type", "user");
				userNode.put("data", user);//추가데이터(일단넣어놓음)
				children.add(userNode);
			}
			
			//부서노드 정보 설정
			dept.put("id", "dept_"+deptNo);
			dept.put("text", dept.get("deptName"));
			dept.put("type", "department");
			dept.put("children", children);
		}
		
		
		return deptList;
	}

	@Override
	public List<Map<String, Object>> selectDepartments() {
		return treeDao.selectDepartments();
	}

	@Override
	public List<Map<String, Object>> selectUsersByDept(String deptNo) {
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
