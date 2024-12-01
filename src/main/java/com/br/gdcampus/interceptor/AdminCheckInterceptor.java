package com.br.gdcampus.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.br.gdcampus.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component // servlet-context.xml 대체
public class AdminCheckInterceptor implements HandlerInterceptor{

	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
		HttpSession session = request.getSession();
		

		if (session.getAttribute("loginUser") != null) {
			
		    UserDto loginUser = (UserDto) session.getAttribute("loginUser"); 
		    String userNo = loginUser.getUserNo(); 
		    
		    if (userNo != null && !userNo.isEmpty() && userNo.charAt(0) == 'A') { // userNo의 첫 문자가 'A'인지 확인

		    	log.debug("[AdminCheckInterceptor] 관리자 계정 확인: 로그인한 유저는 관리자입니다. (userNo: {})", userNo);
		    	return true; // 정상적으로 컨트롤러 실행
		    	
		    } else {

		        // alert 메세지와 함께 메인페이지로 redirect.

		        
		        // RedirectAttributes의 대안
		        FlashMap flashMap = new FlashMap(); // Map같은거라 키-밸류 세트로 무언가를 담을 수 있다.
		        flashMap.put("alertMsg", "관리자 계정만 접근 가능합니다.");
		        // RequestContextUtils.getFlashMapManager(request) 여기까지가 FlashMapManager 객체를 반환한다.
		        RequestContextUtils.getFlashMapManager(request).saveOutputFlashMap(flashMap, request, response);
		       
		        // response.sendRedirect(request.getContextPath()); 스프링 부트는 context path가 빈 문자열일 경우 제대로 리다이렉트 안 됨.
		        response.sendRedirect(request.getContextPath().equals("") ? "/" : request.getContextPath());
		        
		        return false; // 컨트롤러 실행 차단
		        
		    }
		    
		} else {
		    
			// alert 메세지와 함께 메인페이지로 redirect.
			
			
	        FlashMap flashMap = new FlashMap(); 
	        flashMap.put("alertMsg", "로그인 후 이용가능한 서비스입니다.");
	        RequestContextUtils.getFlashMapManager(request).saveOutputFlashMap(flashMap, request, response);
	       
	        response.sendRedirect(request.getContextPath().equals("") ? "/" : request.getContextPath());
	        
			return false; // 컨트롤러 실행 차단
		}
		
		
	}
	
	
	
	
}
