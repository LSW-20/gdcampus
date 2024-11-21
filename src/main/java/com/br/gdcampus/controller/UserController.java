package com.br.gdcampus.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.CategoryDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.RankDto;
import com.br.gdcampus.dto.StudentDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.UserService;
import com.br.gdcampus.util.FileUtil;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.ServletException;
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

	//------------------------------인사팀 시작--------------------------------------	
		/**
		 * 인사팀 행정직원 리스트 조회 요청
		 */
		@GetMapping("/staff/list.do")
		public void staffList(Model model) {
			
			List<CategoryDto> deptList =  userService.selectCategory("T_DEPT");
			List<CategoryDto> rankList =  userService.selectCategory("T_RANK");
			
			Map<String, Object> map = new HashMap<>();
		    map.put("deptList", deptList);
		    map.put("rankList", rankList);
		    
		    model.addAllAttributes(map);
		}
		
		/**인사팀 행정직원 리스트(테이블 안 내용) 조회 요청
		 * @param currentPage 
		 * @param dept 부서번호
		 * @param rank 직급번호
		 * @param keyword 검색어
		 * @return
		 */
		@ResponseBody
		@GetMapping(value="/staff/listContent.do", produces="application/json")
		public Map<String,Object> staffListContent(@RequestParam(value="page", defaultValue="1") int currentPage
				,String dept, String rank, String keyword) {
			
			Map<String, Object> res = new HashMap<>();
			Map<String,String> search = new HashMap<>();
			
			search.put("dept", dept);
			search.put("rank", rank);
			search.put("keyword", keyword);
			
			int listCount = userService.selectStaffListCount(search);
			PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
			List<UserDto> list = userService.selectStaffList(search, pi);
			
			res.put("userList", list);
			res.put("pi", pi);
			return res;
		}
		
		/**인사팀 행정직원 상세페이지 요청
		 * @param userNo 조회할 사원의 사번
		 * @param model
		 */
		@GetMapping("/staff/detail.do") 
		public void detail(String userNo, Model model) {
			
			UserDto user =  userService.selectStaff(userNo);
			List<CategoryDto> deptList =  userService.selectCategory("T_DEPT");
			List<CategoryDto> rankList =  userService.selectCategory("T_RANK");
			
			Map<String, Object> map = new HashMap<>();
		    map.put("deptList", deptList);
		    map.put("rankList", rankList);
		    map.put("user", user);
		    
		    log.debug("user : {}",user);
		    
		    model.addAllAttributes(map);
		}
		
		/**인사팀 행정직원 정보 수정
		 * @param user 수정할 직원
		 * @param rdAttributes 
		 * @param session
		 * @return
		 */
		@PostMapping("/staff/update.do")
		public String updateStaff(UserDto user, RedirectAttributes rdAttributes, HttpSession session) {
			user.setUpdateUser(((UserDto)session.getAttribute("loginUser")).getUserNo());
			log.debug("updateUser : {}", user);
			int result = userService.updateStaff(user);
			
			if(result > 0) {
				rdAttributes.addFlashAttribute("alertMsg","성공적으로 저장되었습니다.");
			}else {
				rdAttributes.addFlashAttribute("alertMsg","수정사항 저장에 실패하였습니다.");
			}
			
			return "redirect:/user/staff/detail.do?userNo=" + user.getUserNo();
		}
		
		/**
		 * 인사팀 행정직원 추가페이지
		 */
		@GetMapping("/staff/addForm.do")
		public void staffAddForm(Model model) {
			
			List<CategoryDto> deptList =  userService.selectCategory("T_DEPT");
			List<CategoryDto> rankList =  userService.selectCategory("T_RANK");
			
			Map<String, Object> map = new HashMap<>();
		    map.put("deptList", deptList);
		    map.put("rankList", rankList);
		    
		    model.addAllAttributes(map);
		}
		
		/**인사팀 행정직원 추가 요청
		 * @param user 추가할 직원
		 * @param rdAttributes
		 * @param session
		 * @return
		 */
		@PostMapping("/staff/insert.do")
		public String insertStaff(UserDto user, RedirectAttributes rdAttributes, HttpSession session) {
			user.setCreateUser(((UserDto)session.getAttribute("loginUser")).getUserNo());
			log.debug("insertUser : {}", user);
			int result = userService.insertStaff(user);
			
			if(result > 0) {
				rdAttributes.addFlashAttribute("alertMsg","성공적으로 추가되었습니다.");
			}else {
				rdAttributes.addFlashAttribute("alertMsg","신규회원 생성에 실패하였습니다.");
			}
			
			return "redirect:/user/staff/list.do";
		}
		
		@ResponseBody
		@PostMapping("/resetPwd.do")
		public String replyInsert(UserDto user, HttpSession session) {
			user.setUpdateUser(((UserDto)session.getAttribute("loginUser")).getUserNo());
			log.debug("resetUser : {}", user);

			int result = userService.PwdReset(user);
			return result > 0 ? "SUCCESS" : "FAIL";
		}
	//------------------------------인사팀 끝--------------------------------------
		
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
	
	//아이디찾기이동(이메일인증페이지)
	@GetMapping("/profile/idSearch.do")
	public void idSearch() {
		
	}
	
	//비번찾기이동(이메일인증페이지)
	@GetMapping("/profile/pwdSearch.do")
	public void pwdSearch() {
		
	}
		
	//인증번호 입력(아이디)
	@PostMapping("/selectId")
	public void idResult(@RequestParam String email, @RequestParam String userName
			 , HttpServletResponse response
			 , HttpSession session
			 , HttpServletRequest request) throws IOException, ServletException {
		//받은 name email로 맞는 회원 찾기
		
	    
	    UserDto user = userService.idSearch(email,userName);
		
		//script문을 응답데이터로 돌려줘서 흐름 제어
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	
		if(user != null) {
			 session.setAttribute("ID", user.getUserId());
			 request.getRequestDispatcher("/WEB-INF/views/user/profile/idResult.jsp").forward(request, response);
		}else {
			 out.println("<script>alert('인증번호가 일치하지 않습니다.');</script>");
			    out.println("<script>history.back();</script>");
		}

	}
	
	//인증번호 입력(비밀번호)
	@PostMapping("/selectPwd")
	public void changePwd(@RequestParam String email, @RequestParam String userId
			 , HttpServletResponse response
			 , HttpSession session
			 , HttpServletRequest request) throws IOException, ServletException {
	    // userId와 email로 사용자 조회
	    UserDto user = userService.pwdSearch(email, userId);

	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    System.out.println(email);
	    System.out.println(userId);
	    System.out.println(user);
	    
	    if (user != null) {
	    	session.setAttribute("user", user);
			 request.getRequestDispatcher("/WEB-INF/views/user/profile/pwdChange.jsp").forward(request, response);
		}else {
			 out.println("<script>alert('인증번호가 일치하지 않습니다.');</script>");
			    out.println("<script>history.back();</script>");
		}
	    
	}
	
	//비밀번호 변경
	@PostMapping("/pwdUpdate")
	public String pwdUpdate(@RequestParam String newPwd, HttpServletResponse response, 
	                        HttpSession session, HttpServletRequest request, RedirectAttributes rdAttributes) throws IOException {
		PrintWriter out = response.getWriter();
		
	    // 로그인한 사용자 정보 가져오기 (세션에서)
	    UserDto user = (UserDto) session.getAttribute("user");
	    

	    // 새 비밀번호를 설정
	    user.setUserPwd(bcryptPwdEncoder.encode(newPwd));
	    

	    // 비밀번호 업데이트 처리
	    int result = userService.pwdUpdate(user);
	    
        if(result > 0) {
    	  rdAttributes.addFlashAttribute("alertMsg","비밀번호 변경 성공");
        }else {
      	  rdAttributes.addFlashAttribute("alertMsg","비밀번호 변경 실패");
        }
	    
	    
	    // 세션 초기화 (로그아웃 처리)
	    session.invalidate();

	    return "redirect:/";  // 비밀번호 변경 후 홈으로 리디렉션
	}
	
	//직급페이지
	@GetMapping("/profile/rank.do")
	public void student(Model model) { 
		List<RankDto> rankList =  userService.selectRank();
		model.addAttribute("rankList", rankList);
	}

	/**
	 * 직급추가
	 */
	@Transactional
	@PostMapping("/profile/insertRank")
	public String insertStu(@ModelAttribute RankDto r, RedirectAttributes rdAttributes) {
		
		System.out.println("컨트롤 r: " + r);
		int result = 0;
		
		try {
	        result = userService.insertRank(r);
	    } catch (Exception e) {
	        // 예외 처리: 에러 발생 시 리다이렉트하면서 에러 메시지 전달
	        rdAttributes.addFlashAttribute("alertMsg", "오류가났습니다 정확한 값을 입력해주세요.");
	        return "redirect:/user/profile/rank.do"; // 리다이렉트
	    }
		 
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 저장되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg","수정사항 저장에 실패하였습니다.");
		}
		return "redirect:/user/profile/rank.do";
	}
	
	/**
	 * 직급수정
	 */
	@Transactional
	@PostMapping("/profile/updateRank")
	public String updateStu(@ModelAttribute RankDto r, RedirectAttributes rdAttributes) {
		
		int result = 0;
		
		try {
	        result = userService.updateRank(r);
	    } catch (Exception e) {
	        // 예외 처리: 에러 발생 시 리다이렉트하면서 에러 메시지 전달
	        rdAttributes.addFlashAttribute("alertMsg", "오류가났습니다 정확한 값을 입력해주세요.");
	        return "redirect:/user/profile/rank.do"; // 리다이렉트
	    }
		 
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 저장되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg","수정사항 저장에 실패하였습니다.");
		}
		return "redirect:/user/profile/rank.do";
	}
	
	/**
	 * 직급삭제
	 */
	@Transactional
	@PostMapping("/profile/deleteRank")
	public String deleteStu(int rankNo, RedirectAttributes rdAttributes) {
		
		int result = 0;
		
		try {
	        result = userService.deleteRank(rankNo);
	    } catch (Exception e) {
	        // 예외 처리: 에러 발생 시 리다이렉트하면서 에러 메시지 전달
	        rdAttributes.addFlashAttribute("alertMsg", "오류가났습니다 정확한 값을 입력해주세요.");
	        return "redirect:/user/profile/rank.do"; // 리다이렉트
	    }
		 
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 저장되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg","수정사항 저장에 실패하였습니다.");
		}
		return "redirect:/user/profile/rank.do";
	}
	
	/**
	 * 직급여러행삭제
	 */
	@PostMapping("/profile/deleteRanks")
	@ResponseBody
	public Map<String, String> deleteRanks(@RequestBody List<Integer> rankNoList) {
	    int result = userService.deleteRanks(rankNoList);
	    
	    Map<String, String> response = new HashMap<>();
	    if (result > 0) {
	        response.put("message", "성공적으로 삭제되었습니다.");
	    } else {
	        response.put("message", "삭제에 실패했습니다.");
	    }
	    return response;
	}
	
	/**
	 * 회원탈퇴페이지
	 *
	*/
	@GetMapping("/profile/resign.do")
	public void resign() {}
	
	

    @PostMapping("/resign.do")
    public String resignBtn(String pwd, String userPwd, String userNo, RedirectAttributes rdAttributes, HttpSession session) {
    	
    	//비밀번호 미입력시
		if(pwd == null || pwd.isEmpty()) {
			rdAttributes.addFlashAttribute("alertMsg", "비밀번호를 입력해주세요.");
            return "redirect:/user/profile/resign.do";
        }
		
		//비밀번호가 일치했을 경우
        if(bcryptPwdEncoder.matches(pwd,userPwd)) {
        	int result = userService.resignUser(userNo);
        	if (result > 0) {
                session.invalidate();

                rdAttributes.addFlashAttribute("alertMsg", "회원탈퇴가 완료되었습니다.");

                return "redirect:/";
            } else {
                rdAttributes.addFlashAttribute("alertMsg", "회원탈퇴 처리에 실패하였습니다.");
                return "redirect:/user/profile/resign.do";
            }
        	
        //비밀번호가 틀렸을경우
        }else {
        	rdAttributes.addFlashAttribute("alertMsg", "비밀번호가 틀렸습니다.");
            return "redirect:/user/profile/resign.do";
        }
	      
    	
    }
}
