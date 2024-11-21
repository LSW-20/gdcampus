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
	
	/**교무팀 개설신청 리스트(테이블 안 내용) 조회 요청
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
	
	/**교무팀/교수 개설신청 상세조회
	 * @param classCode 상세조회할 강의번호
	 */
	@GetMapping("/opning/staff/detail.do")
	public void selectStaffOpningDetail(String classCode, Model model) {
		ClassDto c = classService.selectStaffOpningDetail(classCode);
		log.debug("c : {}", c);
		model.addAttribute("c", c);
		
	}
	
	/**교무팀 개설신청 보완요청, 승인, 반려
	 * @param c 개설신청 정보가 담긴 ClassDto
	 * @param session 로그인유저의 정보를 가져오기위한 session
	 * @return 승인여부
	 */
	@ResponseBody
	@PostMapping("/opning/staff/update.do")
	public String updateStaffOpningStatus(ClassDto c, HttpSession session) {
		c.setUserNo(((UserDto)session.getAttribute("loginUser")).getUserNo());
		int result = classService.updateOpningStatus(c); 
		if(c.getStatus().equals("승인")) {
			result -= 1;
		}
		if(result >= 1) {
			return "SUCCESS"; 
		}else {
			return "FAIL"; 
		}
	}
	
	/**
	 * 교수 개설신청 목록페이지 요청
	 */
	@GetMapping("/opning/prof/list.do")
	public void profOpningList() {}
	
	/**교수 개설신청 리스트(테이블 안 내용) 조회 요청
	 * @param currentPage 
	 * @param status 신청 상태
	 * @param keyword 검색어
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="/opning/prof/listContent.do", produces="application/json")
	public Map<String,Object> profOpningListContent(@RequestParam(value="page", defaultValue="1") int currentPage
			,HttpSession session,String status,String keyword) {
		
		Map<String, Object> res = new HashMap<>();
		Map<String,String> search = new HashMap<>();
		log.debug("status:{}, keyword:{}",status,keyword);
		search.put("status", status);
		search.put("keyword", keyword);
		search.put("userNo", ((UserDto)session.getAttribute("loginUser")).getUserNo());
		
		int listCount = classService.selectProfOpningListCount(search);
		log.debug("listCount:{}",listCount);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<ClassDto> list = classService.selectProfOpningList(search, pi);
		
		res.put("classList", list);
		res.put("pi", pi);
		return res;
	}
	
	/**교수 개설신청 상세조회
	 * @param classCode 상세조회할 강의번호
	 */
	@GetMapping("/opning/prof/detail.do")
	public void selectProfOpningDetail(String classCode, Model model) {
		ClassDto c = classService.selectStaffOpningDetail(classCode);
		log.debug("c : {}", c);
		model.addAttribute("c", c);
		
	}
	
	/**교수 개설신청 전 신청년도 총 신청한 수업 시수 구함(21시간 이상이면 신청 못함)
	 * @param yy 년도
	 * @param session 로그인 회원의 사번을 가져오기위해
	 * @return 년도에 해당하는 1학기와 2학기 총 신청 수업 시수
	 */
	@ResponseBody
	@GetMapping(value="/opning/prof/sum.do" , produces="application/json")
	public Map<String,Object> selectSumClassTime(String yy, HttpSession session) {
		
		Map<String, Object> res = new HashMap<>();
		Map<String,String> search = new HashMap<>();
		
		search.put("year", yy);
		search.put("userNo", ((UserDto)session.getAttribute("loginUser")).getUserNo());
		search.put("term", "1");
		
		int sum1 = classService.selectSumClassTime(search);
		search.put("term", "2");
		int sum2 = classService.selectSumClassTime(search);
		
		res.put("sum1", sum1);
		res.put("sum2", sum2);
		return res;
	}
	
	/**교수측 신청폼으로 이동
	 * @param yytt classNo의 앞부분(년도두자리+학기+_+교수의소속학과번호+_)
	 * @param limit 시수 제한
	 * @param session 
	 * @param model
	 */
	@GetMapping("/opning/prof/addForm.do")
	public void classAddForm(String yytt, String limit, HttpSession session, Model model) {
		//개설학기, 년도, limit값을 받아서 보내줘야함
		log.debug("yytt : "+yytt);
		log.debug("limit : "+limit);
		
		model.addAttribute("classCode", yytt);
		model.addAttribute("limit", Integer.parseInt(limit));
		model.addAttribute("user", ((UserDto)session.getAttribute("loginUser")));
	}
	
}
