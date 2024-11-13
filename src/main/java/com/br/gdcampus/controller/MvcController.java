package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class MvcController {

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
	public void mainPage2() {
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
}
