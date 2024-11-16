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
		
		//1. 부서 목록 조회
		List<DeptDto> deptList = treeDao.selectDepartments();
		
		
		List<Map<String, Object>> coke = new ArrayList<>();
		
		
		
		//2. 각 부서별 사용자 조회 및 트리 구조 생성
		for(DeptDto dept: deptList) {
			
			//deptNo null문제 로그 찍어보기
	        //Object deptNoObj = dept.get("deptNo");
	        System.out.println("===== 각 부서 번호 deptNo value: " + dept.getDeptNo());
	        //System.out.println("@# deptNo type: " + (deptNoObj != null ? deptNoObj.getClass().getName() : "null"));
	        			
			
			//String deptNo = (String)dept.get("deptNo");
	        String deptNo = dept.getDeptNo();
			List<UserDto> userList = treeDao.selectUsersByDept(deptNo); // 각 부서에 속한 UserDto들 조회
			
			
			//사용자정보를 자식 노드로 변환
			List<Map<String,Object>> children = new ArrayList<>();
			
			for(UserDto user : userList) {
				Map<String,Object> userNode = new HashMap<>();
				userNode.put("id", user.getUserNo());
				userNode.put("text", user.getUserName()+" "+user.getRankName());
				userNode.put("type", "user");
				userNode.put("data", user);//추가데이터(일단넣어놓음)
				children.add(userNode);
			}
				
			//부서노드 정보 설정
			Map<String, Object> sugar = new HashMap<>();
			sugar.put("id", "dept_"+deptNo);
			sugar.put("text", dept.getDeptName());
			sugar.put("type", "department");
			sugar.put("children", children);
			
			coke.add(sugar);
		}
		
		System.out.println("coke : " + coke.toString());
		return coke;
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
