package com.br.gdcampus.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.UserService;
import com.br.gdcampus.util.FileUtil;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 인사팀 사원/교수관리 컨트롤러
 */
@Slf4j
@RequestMapping("/user")
@RequiredArgsConstructor
@Controller
public class UserController {
	
	private final UserService userService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;
	private final PagingUtil pagingUtil;
	
	
	//로그인(메인)
	@PostMapping("/signin.do")
	public void signin(UserDto m
					 , HttpServletResponse response
					 , HttpSession session
					 , HttpServletRequest request) throws IOException {
		//받은 id, pwd로 맞는 회원 찾기
		UserDto loginUser = userService.selectUser(m);
		
		//script문을 응답데이터로 돌려줘서 흐름 제어
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		if(loginUser != null && bcryptPwdEncoder.matches(m.getUserPwd(), loginUser.getUserPwd()) ) {//로그인 성공
			//main페이지
			//직접 지우기 전 or 세션 만료 전까지 유효
			//메인페이지 요청
//				out.println("location.href='" +request.getContextPath()+ "/main2';");
			 session.setAttribute("loginUser", loginUser);
			    out.println("<script>alert('" + loginUser.getUserName() + "님 환영합니다.');</script>");
			    response.sendRedirect(request.getContextPath() + "/main2.do");  // 서버 측에서 리디렉션
			//기존에 머물던 페이지 요청
			//out.println("location.href='" +request.getHeader("referer")+ "';");
		}else {//로그인 실패
			//alert창, 페이지 유지
			 out.println("<script>alert('로그인에 실패하였습니다. 아이디 및 비밀번호를 다시 확인 해 주세요.');</script>");
			    out.println("<script>history.back();</script>");
		}
		
	}
}
