package com.br.gdcampus.controller;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.gdcampus.dto.DeptDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.TreeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController//@ResponseBody생략 가능
@RequestMapping("/tree")
@RequiredArgsConstructor
public class TreeController {
	
	private final TreeService treeService;
	
	/**
	 * 조직도 트리 데이터 조회
	 * @author 보겸
	 * @return 부서 및 사용자 계층구조 데이터
	 */
	@GetMapping("/org")
	public List<Map<String,Object>> getOrgTree(HttpSession session){
	    UserDto loginUser = (UserDto)session.getAttribute("loginUser");
	    return treeService.getOrgTree(loginUser.getUserNo());
	}
	
	/**
	 * 특정부서 사용자 목록 조회
	 * @param deptNo 부서번호
	 * @return 해당부서 사용자 목록
	 */
	@GetMapping("/dept/{deptNo}/users")
	public List<UserDto> getDeptUsers(@PathVariable String deptNo){

		return treeService.selectUsersByDept(deptNo);
	}
	
	/**
	 * 부서목록 조회(가발령제외시킴)
	 * @author 보겸
	 * @return 부서목록
	 */
	@GetMapping("/departments")
	public List<DeptDto> getDepartments(){
		return treeService.selectDepartments();
	}
	
	
	
}
