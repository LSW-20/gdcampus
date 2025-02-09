package com.br.gdcampus.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.br.gdcampus.service.ClassService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MvcController {
	
	private final ClassService classService;
	/**
	 * 루트 경로 요청시 메인페이지를 띄워주는 컨트롤러
	 * author : 상우
	 * @return 메인페이지
	 */
	@GetMapping("/")
	public String mainPage() { 
		return "main";
	}
	
	/**
	 * 로그인후 작업하는 메인페이지
	 * author : 정언
	 * @return 메인페이지2
	 */
	@GetMapping("/main2.do")
	public void mainPage2(Model model) {
			 
		List<Map<String,Object>> chart = classService.selectStDeptCount();
		model.addAttribute("chart",chart);
		List<Map<String,Object>> chart2 = classService.selectDeptCount();
		model.addAttribute("chart2",chart2); 
		
	}
	
	
	/**
	 * 로그아웃
	 * author : 정언
	 * @return 메인페이지
	 */
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
	    // 세션 무효화
	    session.invalidate();
	    
	    // 로그아웃 후 메인 페이지나 로그인 페이지로 리다이렉트
	    return "redirect:/";  // 로그인 페이지로 리다이렉트 (예시)
	}
	@GetMapping("/test.do")
	public void test() {
		
	}
}
