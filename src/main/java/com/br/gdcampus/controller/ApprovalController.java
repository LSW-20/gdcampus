package com.br.gdcampus.controller;

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

import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.ApprovalService;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequestMapping("/approval")
@RequiredArgsConstructor
@Controller
public class ApprovalController {
	
	private final ApprovalService apprService;
	private final PagingUtil pagingUtil;
	
	/**
	 * 결재 대기함 list 페이지요청
	 * @author 보겸
	 * @param currentPage 페이징에 필요
	 * @param model		  변수->jsp
	 * @param session	  userNo 가져올때 필요
	 */
	@GetMapping("/todo")
	public void todoPage(@RequestParam(value="page",defaultValue="1") int currentPage, Model model, HttpSession session) {
		int listCount = apprService.selectApprTodoListCount();
		
		//Session에서 userNo가져오기
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<ApprovalDto> apprList = apprService.selectApprTodoList(pi, userNo);
		
		model.addAttribute("pi",pi);
		model.addAttribute("apprList",apprList);
	}
	
	//기안서페이지 단순 페이지요청
	@GetMapping("/simpleDraft")
	public void simpleDraftPage() {}
	
	//품의서 단순 페이지요청
	@GetMapping("/purchaseDraft")
	public void purchaseDraftPage() {}
	
	//작성페이지 요청
	@GetMapping("/regist")
	public void registPage() {}
	
	//기안문서함
	/**
	 * 내가작성한 문서=기안문서함
	 * @author 보겸
	 * @param currentPage 현재페이지
	 * @param status	  apprStatus
	 * @param model		  변수->jsp
	 * @param session	  loginUser
	 */
	@GetMapping("/myDoc")
	public void myDocPage(@RequestParam(value="page",defaultValue="1") int currentPage, @RequestParam(value="status", required=false) String status
						, Model model, HttpSession session) {
		
		//Session에서 userNo가져오기
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, Object> params = new HashMap<>();
		params.put("userNo", userNo);
		params.put("status", status);
		
		int listCount = apprService.selectMyDocListCount(params);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		
		List<ApprovalDto> apprList = apprService.selectMyDocList(pi, params);
		
		model.addAttribute("pi",pi);
		model.addAttribute("apprList",apprList);
		model.addAttribute("currentStatus",status);
		
	}
	
	/**
	 * 전자결재홈 페이지
	 * @author 보겸
	 * @param model
	 * @param session
	 */
	@GetMapping("/home")
	public void apprHomePage(Model model, HttpSession session) {
	    String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
	    
	    // 진행중인 문서 (최근 5개)
	    List<ApprovalDto> inProgressDocs = apprService.getRecentInProgressDocs(userNo);
	    
	    // 완료된 문서 (최근 5개)
	    List<ApprovalDto> completedDocs = apprService.getRecentCompletedDocs(userNo);
	    
	    model.addAttribute("inProgressDocs", inProgressDocs);
	    model.addAttribute("completedDocs", completedDocs);		
	}
	
	@GetMapping("/todo/list")
	@ResponseBody
	public Map<String, Object> getTodoDocs( @RequestParam(value="page", defaultValue="1") int currentPage,HttpSession session){
		//결재대기문서 총개수
		int listCount = apprService.selectApprTodoListCount();

		//Session에서 userNo가져오기
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();	
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 4, 4);
		List<ApprovalDto> docs = apprService.selectApprTodoList(pi, userNo);	
		
		Map<String, Object> response = new HashMap<>();
	    response.put("docs", docs);
	    response.put("maxPage", pi.getMaxPage());
	    return response;
	}
	
	@PostMapping("/insert")
	public String insertApproval(ApprovalDto approval, HttpSession session, RedirectAttributes ra) {
		
		UserDto loginUser = (UserDto)session.getAttribute("loginUser");
		approval.setApprUser(loginUser.getUserNo());
		
		int result = apprService.insertApproval(approval);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg","결재요청 완료");
			return "redirect:approval/home";			
		}else {
			ra.addFlashAttribute("alertMsg","결재요청 실패");
			return "redirect:approval/home";						
		}
		
		
	}
	
	
	
}
