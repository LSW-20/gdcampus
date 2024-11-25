package com.br.gdcampus.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.CategoryDto;
import com.br.gdcampus.dto.ClassDto;
import com.br.gdcampus.dto.EvaMethodDto;
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
	 * @param yytt classNo의 앞부분(년도두자리+학기+_)
	 * @param limit 시수 제한
	 * @param session 
	 * @param model
	 */
	@GetMapping("/opning/prof/addForm.do")
	public void classAddForm(String yytt, String limit, HttpSession session, Model model) {
		//개설학기+년도, limit값, 모든학과, 로그인한 회원정보를 보내줘야함
		log.debug("yytt : "+yytt);
		log.debug("limit : "+limit);
		
		List<CategoryDto> deptList =  classService.selectCategory("T_ST_DEPT");
		String deptName = null;
		for(CategoryDto c : deptList) {
			if(c.getStDeptNo().equals(((UserDto)session.getAttribute("loginUser")).getStDeptNo())) {
				deptName = c.getDeptName();
			}
		}
		
		model.addAttribute("classCode", yytt);
		model.addAttribute("limit", Integer.parseInt(limit));
		model.addAttribute("user", ((UserDto)session.getAttribute("loginUser")));
		model.addAttribute("deptList", deptList);
		model.addAttribute("deptName", deptName);
	}
	
	/**교수측 개설신청(db insert)
	 * @param c 저장할 데이터가 담긴 ClassDto객체
	 * @return 목록페이지로 redirect
	 */
	@PostMapping("/opning/prof/regist.do")
	public String registOpningForm(ClassDto c, RedirectAttributes rdAttributes) {
		log.debug("ClassDto : "+c);
		
		c.setClassCode(c.getClassCode() + c.getDeptName());
		
		int result = classService.insertClass(c);
		if(result == 1) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 등록되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg","등록에 실패하였습니다.");
		}
		return "redirect:/class/opning/prof/list.do";
	}
	
	@GetMapping("/opning/prof/modifyForm.do" )
	public void modifyForm(String classCode, Model model, HttpSession session) {
		ClassDto c = classService.selectStaffOpningDetail(classCode);
		log.debug("{}",c);
		model.addAttribute("c", c);
		model.addAttribute("deptList", classService.selectCategory("T_ST_DEPT"));
		session.setAttribute("c", c);
	}
	
	@PostMapping("/opning/prof/update.do")
	public String updateForm(ClassDto c, HttpSession session, RedirectAttributes rdAttributes) {
		
		String[] classCodeArr = c.getClassCode().split("_");
		classCodeArr[1] = c.getDeptName();
		c.setUpdateClassCode(String.join("_", classCodeArr));
		
		ClassDto originC = ((ClassDto)session.getAttribute("c"));
		c.setUpdateEvaList(originC.getEvaList());
		
		log.debug("c:{}",c);
		
		List<EvaMethodDto> updateEvaList = c.getUpdateEvaList();
		List<EvaMethodDto> evaList = c.getEvaList();
		List<EvaMethodDto> deleteEvaList = new ArrayList<EvaMethodDto>();
		
		for(int i=0; i<updateEvaList.size(); i++) { // 기존 내용 중간 실습 기타
			EvaMethodDto upEva = updateEvaList.get(i);
			int comCount = 0;
			for(int j=0; j<evaList.size(); j++) { // 새로운 내용 중간 기말 기타
				EvaMethodDto eva = evaList.get(j);
				if(upEva.getEvaItem().equals(eva.getEvaItem())) {
					// 이름이 일치하면 update 시켜주면 됨(evaList에서는 삭제)
					updateEvaList.set(i,eva);
					evaList.remove(j);
					j--;
					comCount++;
				}
				
			}
			// 다 돌았는데 하나도 일치하는 항목이 없으면 up에서 삭제하고 del로 넣어줌
			if(comCount == 0) {
				deleteEvaList.add(upEva);
				updateEvaList.remove(i);
				i--;
			}
		}
		
		log.debug("최종eva:{}",evaList);
		log.debug("최종upeva:{}",updateEvaList);
		log.debug("최종deleva:{}",deleteEvaList);
		
		c.setEvaList(evaList);
		c.setUpdateEvaList(updateEvaList);
		c.setDeleteEvaList(deleteEvaList);
		
		c.setUserNo(((UserDto)session.getAttribute("loginUser")).getUserNo());
		// evaList는 insert문 updateEvaList는 update문 deleteEvaList는 delete문
		// 대상학과가 바뀌는 경우도 있으므로 수정전 classCode와 수정후 classCode도 보내줘야함(Map)
		c.setClassCode(originC.getClassCode());
		log.debug("최종c:{}",c);
		
		int result = classService.updateOpning(c);
		
		if(result == 1) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 보완완료 처리되었습니다");
			return "redirect:/class/opning/prof/detail.do?classCode="+c.getUpdateClassCode();
		}else{
			rdAttributes.addFlashAttribute("alertMsg","변경사항 저장에 실패하였습니다.");
			return "redirect:/class/opning/prof/list.do";
		}
	}
}
