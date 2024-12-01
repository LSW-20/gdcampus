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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.DraftDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PurchaseDraftDto;
import com.br.gdcampus.dto.PurchaseHistoryDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.ApprovalService;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@RequestMapping("/approval")
//@RequiredArgsConstructor
@Controller
public class ApprovalController {
	
	private final ApprovalService apprService;
	private final PagingUtil pagingUtil;
	
	//sms변수
    private final DefaultMessageService messageService;
	
    //sms생성자
    public ApprovalController(ApprovalService apprService, PagingUtil pagingUtil) {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.apprService = apprService;
    	this.pagingUtil = pagingUtil;
    	this.messageService = NurigoApp.INSTANCE.initialize("NCS6NRPI8OO7RRUP", "YHHI9WZ1DYFLBLLDVWJTTWLOHG5BASO1", "https://api.coolsms.co.kr");
    }
    
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
		
		//관리자정의양식목록조회
		List<String> formTypes = apprService.selectCustomFormTypes();
//		System.out.println("양식이름 : "+formTypes);
		
		model.addAttribute("pi",pi);
		model.addAttribute("apprList",apprList);
		model.addAttribute("formList", formTypes);
	}
	
	//결재예정문서페이지
	@GetMapping("/upComing")
	public void upComingPage(@RequestParam(value="page",defaultValue="1") int currentPage, Model model, HttpSession session) {
		//Session에서 userNo가져오기
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		int listCount = apprService.selectApprUpcomingListCount(userNo);
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<ApprovalDto> apprList = apprService.selectApprUpcomingList(pi, userNo);
		
		//관리자정의양식목록조회
		List<String> formTypes = apprService.selectCustomFormTypes();
		
		model.addAttribute("pi",pi);
		model.addAttribute("apprList",apprList);
		model.addAttribute("formList", formTypes);
		
		
	}
	
	//기안서페이지 단순 페이지요청
	@GetMapping("/simpleDraft")
	public void simpleDraftPage() {}
	
	//품의서 단순 페이지요청
	@GetMapping("/purchaseDraft")
	public void purchaseDraftPage() {}
	
	//작성페이지 요청
	@GetMapping("/regist")
	public void registPage(@RequestParam(required=false) String formType, Model model) {

		//선택된 양식이 있고 관리자 정의 양식인 경우
		if(formType != null && !formType.equals("purchaseDraft") && !formType.equals("simpleDraft")) {
			ApprovalDto selectedForm = apprService.selectCustomFormContent(formType);
	        model.addAttribute("selectedForm", selectedForm);	
	        System.out.println("양식파라미터 받은 formType : "+formType);
	        System.out.println("양식 : "+selectedForm);
		}
		
	}
	
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
		//관리자정의양식목록조회
		List<String> formTypes = apprService.selectCustomFormTypes();
		
		model.addAttribute("formList", formTypes);		
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
		//관리자정의양식목록조회
		List<String> formTypes = apprService.selectCustomFormTypes();
		
		model.addAttribute("formList", formTypes);
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
	        	
	        	System.out.println("Controller 품의서 데이터: " + approval.getPurchDraft());

	        	List<PurchaseHistoryDto> items = new ArrayList<>();
	        	// 품목 리스트 처리
	            if(productNos != null && !productNos.isEmpty()) {
	                for(int i=0; i<productNos.size(); i++) {
	                    PurchaseHistoryDto item = PurchaseHistoryDto.builder()
	                            .productNo(productNos.get(i))
	                            .productName(productNames.get(i))
	                            .productUnit(productUnits.get(i))
	                            .productAmt(productAmts.get(i))
	                            .productPrice(productPrices.get(i))
	                            .build();
	                    items.add(item);
	                }
	            }
	            purchDraft.setPurchaseItems(items);
	            approval.setPurchDraft(purchDraft);
	        }

	        int result = apprService.insertApproval(approval);
	        String text = "";
	        if(result > 0) {
	            ra.addFlashAttribute("alertMsg", "결재요청 완료");
	            text = loginUser.getUserName() + "님의 결재 1건이 요청 되었습니다.";
	        } else {
	            ra.addFlashAttribute("alertMsg", "결재요청 실패");
	            text = loginUser.getUserName() + "님의 결재 요청이 실패 되었습니다.";
	        }
	        log.debug("text : {}",text);
//	        sendOne(text);
	    } catch(Exception e) {
	        log.error("결재 요청 중 오류 발생", e);
	        ra.addFlashAttribute("alertMsg", "결재요청 처리 중 오류가 발생했습니다.");
	    }
	    
	    return "redirect:/approval/home";
	}
	
	//메세지발송
    public SingleMessageSentResponse sendOne(String text) {
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01077253871");
        message.setTo("01077253871");
        message.setText(text);

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
    }
	
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String, Object> updateApproval(@RequestBody ApprovalDto approval,
	                                        HttpSession session) {
	    Map<String, Object> response = new HashMap<>();
	    
	    try {
	        UserDto loginUser = (UserDto)session.getAttribute("loginUser");
	        approval.setUpdateUser(loginUser.getUserNo());

	        int result = apprService.updateApproval(approval);
	        
	        response.put("success", result > 0);
	        response.put("message", result > 0 ? "수정 완료" : "수정 실패");
	        
	    } catch(Exception e) {
	        log.error("결재 문서 수정 중 오류 발생", e);
	        response.put("success", false);
	        response.put("message", "문서 수정 중 오류가 발생했습니다.");
	    }
	    
	    return response;
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
				System.out.println("결재대기: "+approval);
				break;
			case "upcoming":
				approval = apprService.selectApprUpcomingDetail(params);
				System.out.println("결재예정: "+approval);
				break;
			case "myDoc":
				approval = apprService.selectMyDocDetail(params);
				System.out.println("기안문서: "+approval);
				break;
			case "approved":
				approval = apprService.selectMyApprovedDetail(params);
				System.out.println("내결재함: "+approval);
		}
		if(approval == null) {
			throw new RuntimeException("문서를 찾을 수 없음");
		}
		System.out.println("### 현재 결재요청의 approvers : "+ approval.getApprovers());
		model.addAttribute("approval",approval);
		model.addAttribute("type",type);
		
		return "/approval/detail";
	}
	
	@PostMapping("/approve")
	@ResponseBody
	public Map<String,Object> approveDocument(@RequestParam String apprNo,@RequestParam String apprStatus, HttpSession session){
		Map<String,Object> response = new HashMap<>();
		
		try {
			String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
			int result = apprService.processApprove(apprNo,userNo,apprStatus);//결재통합
			response.put("success", result > 0);
		}catch(Exception e) {
			log.error("승인 중 오류 발생",e);
			response.put("success", false);
		}
		
		return response;
	}
	
	@PostMapping("/reject")
	@ResponseBody
	public Map<String, Object> rejectDocument(@RequestParam String apprNo, @RequestParam String lineReason, HttpSession session){
		Map<String,Object> response = new HashMap<>();
		try {
			String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
			int result = apprService.processReject(apprNo, userNo, lineReason);
			 response.put("success", result > 0);
		}catch(Exception e) {
			log.error("반려 처리 중 오류 발생",e);
	        response.put("success", false);
		}
	    return response;
	}
	
	@GetMapping("/approved")
	public void approvedByMePage(@RequestParam(value="page",defaultValue="1") int currentPage, @RequestParam(value="status", required=false) String status
			, Model model, HttpSession session) {
		
		//Session에서 userNo가져오기
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, Object> params = new HashMap<>();
		params.put("userNo", userNo);
		params.put("status", status);
		
		int listCount = apprService.selectMyApprovedListCount(userNo);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		
		List<ApprovalDto> apprList = apprService.selectMyApprovedList(pi, params);
		//관리자정의양식목록조회
		List<String> formTypes = apprService.selectCustomFormTypes();
		
		model.addAttribute("formList", formTypes);
		model.addAttribute("pi",pi);
		model.addAttribute("apprList",apprList);
		model.addAttribute("currentStatus",status);

	}
	
	@GetMapping("/admin/registForm")
	public void adminRegistFormPage() {}
	
	
	@GetMapping("/admin/formList")
	public String adminFormListPage(Model model) {
	    List<ApprovalDto> formList = apprService.selectAdminFormList();
	    model.addAttribute("formList", formList);
	    return "approval/admin/formList";  		
	}
	
	@PostMapping("/admin/insertForm")
	public String adminInsertForm(ApprovalDto apprForm, HttpSession session, RedirectAttributes ra) {
		try {
			//4 : 양식
			apprForm.setApprStatus("4");
			apprForm.setCreateUser(((UserDto)session.getAttribute("loginUser")).getUserNo());
			
			int result = apprService.insertAdminForm(apprForm);
			
			if(result > 0) {
				ra.addFlashAttribute("alertMsg", "양식이 등록 되었습니다.");
			}else {
				ra.addFlashAttribute("alertMsg", "양식이 등록 실패.");
				
			}
			
		}catch(Exception e){
			log.error("양식등록 오류",e);
			ra.addFlashAttribute("alertMsg", "exception - 양식 등록 중 에러 발생.");
		}
		
		
		return "redirect:/approval/admin/formList";
	}
	
	@GetMapping("/admin/detailForm/{apprNo}")
	public String adminFormDetailPage(@PathVariable String apprNo, Model model) {
		
		ApprovalDto apprForm = apprService.selectAdminFormDetail(apprNo);
		model.addAttribute("apprForm",apprForm);
		return"approval/admin/detailForm";
	}
	
	@PostMapping("/admin/updateForm")
	public String adminFormUpdate(ApprovalDto apprForm, HttpSession session, RedirectAttributes ra) {
	    try {
	        UserDto loginUser = (UserDto)session.getAttribute("loginUser");
	        
	        apprForm.setUpdateUser(loginUser.getUserNo()); // 수정자 정보 설정
	        
	        int result = apprService.updateAdminForm(apprForm);
	        
	        if(result > 0) {
	            ra.addFlashAttribute("alertMsg", "양식이 수정되었습니다.");
	        } else {
	            ra.addFlashAttribute("alertMsg", "양식 수정에 실패했습니다.");
	        }
	    } catch(Exception e) {
	        log.error("양식 수정 중 오류", e);
	        ra.addFlashAttribute("alertMsg", "양식 수정 중 오류가 발생했습니다.");
	    }
	    
	    return "redirect:/approval/admin/detailForm/" + apprForm.getApprNo();		
	}
	
	@GetMapping("/admin/deleteForm")
	public String deleteAdminForm(String apprNo, RedirectAttributes ra) {
	    try {
	        int result = apprService.deleteAdminForm(apprNo);
	        
	        if(result > 0) {
	            ra.addFlashAttribute("alertMsg", "양식이 삭제되었습니다.");
	        } else {
	            ra.addFlashAttribute("alertMsg", "양식 삭제에 실패했습니다.");
	        }
	    } catch(Exception e) {
	        ra.addFlashAttribute("alertMsg", "양식 삭제 중 오류가 발생했습니다.");
	    }		
		return "redirect:/approval/admin/formList";
	}
	
	
}
