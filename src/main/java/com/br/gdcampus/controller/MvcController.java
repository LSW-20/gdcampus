package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
}
