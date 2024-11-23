package com.br.gdcampus.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component // servlet-context.xml에 빈등록 대체
public class LoginCheckInterceptor implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있을 경우 
			return true;   // 정상적으로 Controller 실행
		}else { // 로그인이 되어있지 않을 경우
			
			// alert 메세지와 함께 메인페이지가 다시 보여지도록
			
			// RedirectAttributes의 대안 
			FlashMap flashMap = new FlashMap();
			flashMap.put("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			RequestContextUtils.getFlashMapManager(request).saveOutputFlashMap(flashMap, request, response);
			
			response.sendRedirect(request.getContextPath().equals("") ? "/"
																	  : request.getContextPath());
			
			// case 1) contextPath 가 ""일 경우 (이슈상황)
			// localhost:8888/member/myinfo.do  url 요청시 로그인되어있지 않을 경우 "" 과 같은 url 재요청 됨 
			// localhost:8888/member/   url 재요청됨 
			
			// case 2) contextPath 가 "/boot"일 경우
			// localhost:8888/boot/member/myinfo.do  url 요청시 로그인되어있지 않을 경우 "/boot" 과 같은 url 재요청 됨 
			// localhost:8888/boot      url 재요청됨
			
			
			return false;  // Controller 실행되지 않도록
		}
		
		
	}

}
