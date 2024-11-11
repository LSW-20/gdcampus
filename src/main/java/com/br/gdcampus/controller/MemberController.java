package com.br.gdcampus.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.gdcampus.dto.MemberDto;
import com.br.gdcampus.service.MemberService;

//import ch.qos.logback.core.util.FileUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemberController {

	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
//	private final FileUtil fileUtil;
	
	@PostMapping("/signin.do")
	public void signin(MemberDto m
					 , HttpServletResponse response
					 , HttpSession session
					 , HttpServletRequest request) throws IOException {
		//받은 id, pwd로 맞는 회원 찾기
		MemberDto loginUser = memberService.selectMember(m);
		
		//script문을 응답데이터로 돌려줘서 흐름 제어
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(loginUser != null && bcryptPwdEncoder.matches(m.getUserPwd(), loginUser.getUserPwd()) ) {//로그인 성공
			//main페이지
			//직접 지우기 전 or 세션 만료 전까지 유효
			session.setAttribute("loginUser", loginUser);
			out.println("alert('"+loginUser.getUserName()+"님 환영합니다.');");
			//메인페이지 요청
			out.println("location.href='" +request.getContextPath()+ "';");
			//기존에 머물던 페이지 요청
			//out.println("location.href='" +request.getHeader("referer")+ "';");
		}else {//로그인 실패
			//alert창, 페이지 유지
			out.println("alert('로그인에 실패 하였습니다. 아이디 및 비밀 번호를 다시 확인 해 주세요.');");
			out.println("history.back();");
		}
		out.println("</script>");
		
	}//로그인
	
	
}
