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
	public List<Map<String, Object>> getOrgTree(String loginUserNo) {  // 로그인 유저 번호 파라미터 추가
	    List<DeptDto> deptList = treeDao.selectDepartments();
	    List<Map<String, Object>> result = new ArrayList<>();
	    
	    for(DeptDto dept : deptList) {
	        String deptNo = dept.getDeptNo();
	        List<UserDto> userList = treeDao.selectUsersByDept(deptNo);
	        
	        List<Map<String, Object>> children = new ArrayList<>();
	        for(UserDto user : userList) {
	            // 로그인 유저는 제외
	            if(user.getUserNo().equals(loginUserNo)) {
	                continue;
	            }

	            Map<String, Object> userData = new HashMap<>();
	            userData.put("userNo", user.getUserNo());
	            userData.put("userName", user.getUserName());
	            userData.put("rankName", user.getRankName());
	            userData.put("deptName", user.getDeptName());
	            
	            Map<String, Object> userNode = new HashMap<>();
	            userNode.put("id", "user_" + user.getUserNo());
	            userNode.put("text", user.getUserName() + " " + user.getRankName());
	            userNode.put("type", "user");
	            userNode.put("data", userData);
	            
	            children.add(userNode);
	        }
	        
	        // 해당 부서에 사용자가 있는 경우에만 부서 노드 추가
	        if(!children.isEmpty()) {
	            Map<String, Object> deptNode = new HashMap<>();
	            deptNode.put("id", "dept_" + deptNo);
	            deptNode.put("text", dept.getDeptName());
	            deptNode.put("type", "department");
	            deptNode.put("children", children);
	            result.add(deptNode);
	        }
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
