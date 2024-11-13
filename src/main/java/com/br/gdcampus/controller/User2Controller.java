package com.br.gdcampus.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.User2Service;
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
public class User2Controller {
	
	private final User2Service userService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;
	private final PagingUtil pagingUtil;
	
	@GetMapping("/staff/list.do")
	public void todoPage() {}
	
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
			    System.out.println(loginUser);
		}else {//로그인 실패
			//alert창, 페이지 유지
			 out.println("<script>alert('로그인에 실패하였습니다. 아이디 및 비밀번호를 다시 확인 해 주세요.');</script>");
			    out.println("<script>history.back();</script>");
		}
		
	}
	
	//프로필이동
	@GetMapping("/profile/profile.do")
	public void profile() {}
	
	//프로필수정
	@PostMapping("/profile/modify.do")
	public String profileModify(UserDto m
			, RedirectAttributes rdAttributes
			, HttpSession session) {
		int result = userService.updateUser(m);
		if(result > 0) {
			//DB에서 조회해서 세션에 갱신 된 회원 객체 덮어쓰는 과정 필요
			session.setAttribute("loginUser", userService.selectUser(m));
			rdAttributes.addFlashAttribute("alertMsg", "회원 정보가 수정 되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "회원 정보 수정 실패");
		}
		return "redirect:/user/profile/profile.do";
	}
	
	//프로필이미지 수정
	@ResponseBody
	@PostMapping("/updateProfile.do")//jsp(script)와 키값 동일하게 uploadFile
	public String modifyProfile(MultipartFile uploadFile
			, HttpSession session) {
		//현재 로그인 한 회원 정보
		UserDto loginUser = (UserDto)session.getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		//기존 프로필은 url주소 이제 필요x
		//삭제 위해 뽑아온다
		String originalProfileURL = loginUser.getProfileURL();
		
//		FileUtil클래스에 업로드 관련 클래스 만들어놨음,전역필드에 추가
		//변경 요청한 프로필 파일 업로드
		Map<String, String> map = fileUtil.fileupload(uploadFile, "profile");
		
		//현재 로그인 한 회원 객체에 새로 저장된 프로필 이미지에 대한 수정된 url주소 
		//를 ProfileURL에 담음
		loginUser.setProfileURL(map.get("filePath")+"/"+map.get("filesystemName"));
		
		//DB에 기록을 위한Service호출
		int result = userService.updateProfileImg(loginUser);
		
		if(result > 0) {
			//성공시 기존 프로필 존재 했을 경우 파일 삭제
			if(originalProfileURL != null) {
				new File(originalProfileURL).delete();
			}
			return "SUCCESS";
		}else {
			//DB기록 실패시 변경요청시 전달 된 프로필url파일 삭제
			new File(loginUser.getProfileURL()).delete();
			//바꾼 url주소 원복
			loginUser.setProfileURL(originalProfileURL);
			return "FAIL";
		}
		
	}//modifyProfile
	
	//아이디찾기
	@GetMapping("/idSearch.do")
	public void idSearch() {
		
	}
}
