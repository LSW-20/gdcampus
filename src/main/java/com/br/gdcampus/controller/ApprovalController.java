package com.br.gdcampus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.ApprLineDto;
import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.DraftDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PurchaseDraftDto;
import com.br.gdcampus.dto.PurchaseHistoryDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.ApprovalService;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		
		//Session에서 userNo가져오기
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		int listCount = apprService.selectApprTodoListCount(userNo);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<ApprovalDto> apprList = apprService.selectApprTodoList(pi, userNo);
		
		model.addAttribute("pi",pi);
		model.addAttribute("apprList",apprList);
	}
	
	//결재예정문서페이지
	@GetMapping("/upComing")
	public void upComingPage(@RequestParam(value="page",defaultValue="1") int currentPage, Model model, HttpSession session) {
		//Session에서 userNo가져오기
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		int listCount = apprService.selectApprUpcomingListCount(userNo);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<ApprovalDto> apprList = apprService.selectApprUpcomingList(pi, userNo);
		
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
		//Session에서 userNo가져오기
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();	

		//결재대기문서 총개수
		int listCount = apprService.selectApprTodoListCount(userNo);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 4, 4);
		List<ApprovalDto> docs = apprService.selectApprTodoList(pi, userNo);	
		
		Map<String, Object> response = new HashMap<>();
	    response.put("docs", docs);
	    response.put("maxPage", pi.getMaxPage());
	    return response;
	}
	
	@PostMapping("/insert") 
	public String insertApproval(@ModelAttribute ApprovalDto approval,
	                           @ModelAttribute DraftDto draft,
	                           @ModelAttribute PurchaseDraftDto purchDraft,
	                           @RequestParam(value="productNo", required=false) List<Integer> productNos,
	                           @RequestParam(value="productName", required=false) List<String> productNames,
	                           @RequestParam(value="productUnit", required=false) List<String> productUnits,
	                           @RequestParam(value="productAmt", required=false) List<Integer> productAmts,
	                           @RequestParam(value="productPrice", required=false) List<String> productPrices,
	                           HttpSession session,
	                           RedirectAttributes ra) {
	    
	    try {
	        UserDto loginUser = (UserDto)session.getAttribute("loginUser");
	        approval.setApprUser(loginUser.getUserNo());

	        // 문서 타입에 따른 처리
	        if("기안서".equals(approval.getApprType())) {
	            approval.setDraft(draft);
	        } else if("품의서".equals(approval.getApprType())) {
	            // 품목 리스트 처리
	            if(productNos != null && !productNos.isEmpty()) {
	                List<PurchaseHistoryDto> items = new ArrayList<>();
	                for(int i=0; i<productNos.size(); i++) {
	                    items.add(PurchaseHistoryDto.builder()
	                            .productNo(productNos.get(i))
	                            .productName(productNames.get(i))
	                            .productUnit(productUnits.get(i))
	                            .productAmt(productAmts.get(i))
	                            .productPrice(productPrices.get(i))
	                            .build());
	                }
	                purchDraft.setPurchaseItems(items);
	            }
	            approval.setPurchDraft(purchDraft);
	        }

	        int result = apprService.insertApproval(approval);
	        
	        if(result > 0) {
	            ra.addFlashAttribute("alertMsg", "결재요청 완료");
	        } else {
	            ra.addFlashAttribute("alertMsg", "결재요청 실패");
	        }
	        
	    } catch(Exception e) {
	        log.error("결재 요청 중 오류 발생", e);
	        ra.addFlashAttribute("alertMsg", "결재요청 처리 중 오류가 발생했습니다.");
	    }
	    
	    return "redirect:/approval/home";
	}
	
	@GetMapping("/detail/{apprNo}")
	public String detailPage(@PathVariable String apprNo, @RequestParam String type, Model model, HttpSession session) {
		
		UserDto loginUser = (UserDto)session.getAttribute("loginUser");
		ApprovalDto approval = null;
		
		System.out.println("세션유저 userNo : "+loginUser.getUserNo());
		Map<String, Object> params = new HashMap<>();
		params.put("userNo", loginUser.getUserNo());
		params.put("apprNo", apprNo);
		
		
		//문서종류함따라 상세조회
		switch(type) {
			case "todo":
				approval = apprService.selectApprTodoDetail(params);
				
				System.out.println(approval);
				break;
			case "upcoming":
				approval = apprService.selectApprUpcomingDetail(params);
				System.out.println(approval);
				break;
			case "myDoc":
				approval = apprService.selectMyDocDetail(params);
				System.out.println(approval);
				break;
			//case "others":
		}
		if(approval == null) {
			throw new RuntimeException("문서를 찾을 수 없음");
		}
		System.out.println("controller에 가져온 결재선 : "+ approval.getApprovers());
		model.addAttribute("approval",approval);
		model.addAttribute("type",type);
		
		return "/approval/detail";
	}
	
	
	
	
	
}
