package com.br.gdcampus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.gdcampus.dto.ClassDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.ClassService;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 수업 관련 컨트롤러
 */
@Slf4j
@RequestMapping("/class")
@RequiredArgsConstructor
@Controller
public class ClassController {

	private final ClassService classService;
	private final PagingUtil pagingUtil;
	
	/**
	 * 교무팀 개설신청 목록페이지 요청
	 */
	@GetMapping("/opning/staff/list.do")
	public void staffOpningList() {}
	
	/**인사팀 행정직원 리스트(테이블 안 내용) 조회 요청
	 * @param currentPage 
	 * @param status 신청 상태
	 * @param keyword 검색어
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="/opning/staff/listContent.do", produces="application/json")
	public Map<String,Object> staffOpningListContent(@RequestParam(value="page", defaultValue="1") int currentPage
			,String status,String keyword) {
		
		Map<String, Object> res = new HashMap<>();
		Map<String,String> search = new HashMap<>();
		log.debug("status:{}, keyword:{}",status,keyword);
		search.put("status", status);
		search.put("keyword", keyword);
		
		int listCount = classService.selectStaffOpningListCount(search);
		log.debug("listCount:{}",listCount);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<ClassDto> list = classService.selectStaffOpningList(search, pi);
		
		res.put("classList", list);
		res.put("pi", pi);
		return res;
	}
	
	/**인사팀 개설신청 상세조회
	 * @param classCode 상세조회할 강의번호
	 */
	@GetMapping("/opning/staff/detail.do")
	public void selectStaffOpningDetail(String classCode, Model model) {
		ClassDto c = classService.selectStaffOpningDetail(classCode);
		log.debug("c : {}", c);
		model.addAttribute("c", c);
		
	}
	
	@ResponseBody
	@PostMapping("/opning/staff/update.do")
	public String updateStaffOpningStatus(ClassDto c, HttpSession session) {
		c.setUserNo(((UserDto)session.getAttribute("loginUser")).getUserNo());
		int result = classService.updateOpningStatus(c); 
		return "SUCCESS"; 
	}
}