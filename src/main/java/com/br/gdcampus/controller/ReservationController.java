package com.br.gdcampus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.dto.ReservationDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.EquipmentAndFacilityService;
import com.br.gdcampus.service.ReservationService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@RequestMapping("/reservation")
@Controller
public class ReservationController {

	private final EquipmentAndFacilityService equipmentAndFacilityService;
	private final ReservationService reservationService;
	
	// coolsms로 문자 발송을 위한 필드
	private final DefaultMessageService messageService;
	
    public ReservationController(EquipmentAndFacilityService equipmentAndFacilityService, ReservationService reservationService) {
        this.equipmentAndFacilityService = equipmentAndFacilityService;
        this.reservationService = reservationService;
        this.messageService = NurigoApp.INSTANCE.initialize("NCSHFTKCDQ10ANNZ", "2EIPIKNNJCGFYBBL0YXSQJTVDFAUWUDH", "https://api.coolsms.co.kr");  // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력.
    }
	
	
	
	/**
	 * 예약하기 페이지(/reservation/reservation.jsp)로 이동시키는 메소드
	 * author : 상우
	 * @param model 포워딩한 jsp로 응답 데이터를 전달하기 위한 객체
	 */
	@GetMapping("/main")
	public String reservationMain() {
		
		log.debug("=============== reservationMain 메소드 실행됨 ===============\n");
		return "/reservation/reservation";
		
	}
	
	
	/**
	 * ajax 요청. 비품, 시설 카테고리 조회 메소드
	 * author : 상우
	 * @param classification "비품" | "시설"
	 */
	@ResponseBody
	@GetMapping(value="/selectCategory", produces="application/json")
	public List<String> selectCategory(String classification) {
		
		log.debug("=============== selectCategory 메소드 실행됨 ===============\n");
		// log.debug("classification 값 : {}", classification);
		
	
		List<String> categoryList = new ArrayList<>();
		
		if(classification.equals("비품")) {
			
			categoryList = equipmentAndFacilityService.selectEquipmentCategory(); // 비품 카테고리 조회
			
		}else if(classification.equals("시설")) {
			
			categoryList = equipmentAndFacilityService.selectFacilityCategory();  // 시설 카테고리 조회
			
		}
		
		return categoryList;
	}
	
	
	/**
	 * ajax 요청. 비품, 시설 상세 조회 메소드
	 * author : 상우
	 * @param category "비품" | "시설"
	 */
	@ResponseBody
	@GetMapping(value="/selectDetailList", produces="application/json")
	public Map<String, Object> selectDetailList(String classification, String category) {
		
		log.debug("=============== selectDetailList 메소드 실행됨 =============== \n");
		// log.debug("classification 값 : {}", classification);
		// log.debug("category 값 : {}", category);

		Map<String, Object> detailListMap = new HashMap<>(); 
		
		
		if(classification.equals("비품")) {
			
			List<EquipmentDto> equipmentList = equipmentAndFacilityService.selectAllEquipment(category); // 카테고리에 맞는 비품 정보 조회
			detailListMap.put("equipmentList", equipmentList);
			
		}else if(classification.equals("시설")) {
			
			List<FacilityDto> facilityList = equipmentAndFacilityService.selectAllFacility(category);	 // 카테고리에 맞는 시설 정보 조회
			detailListMap.put("facilityList", facilityList);
			
		}
		
		return detailListMap;
	}
	
	
	/**
	 * ajax 요청. 예약 가능 여부 조회 메소드
	 * author : 상우
	 * @param map classification("비품" | "시설"), date(예약희망일), number(비품번호 | 시설번호)
	 */
    @ResponseBody
    @PostMapping("/checkAvailability")
    public String checkAvailability(@RequestBody Map<String, Object> map) {
    	
    	log.debug("=============== selectDetailList 메소드 실행됨 =============== \n");
        //log.debug("map : {}", map);
        //log.debug("classification : {}", map.get("classification")); // "비품" | "시설"
        //log.debug("date : {}", map.get("date")); // "YYYY-MM-DD"
        //log.debug("number : {}", map.get("number")); 
        
        
        String status = reservationService.checkAvailability(map);
        
        log.debug("status : {}", status); 
        String result = "";
        
        if(status == null || status.equals("예약신청반려")) { 
        	result = "예약 가능";
        }else {
        	result = "예약 불가능";
        }
        
        log.debug("result : {}", result); 
        return result;
    }
    
    
    /**
     * 예약하기 메소드
     * @param classification 구분("비품" | "시설")
     * @param number 비품번호 | 시설번호
     * @param date 예약희망일
     * @param reason 예약사유
     * @param session 현재 로그인한 사용자 세션
     * @param ra 리다이렉트한 jsp로 응답 데이터를 전달하기 위한 객체
     * @return
     */
    @PostMapping("/reserve")
	public String reserve(String classification, String number, String date, String reason, HttpSession session, RedirectAttributes ra) {
    	
    	log.debug("=============== reserve 메소드 실행됨 =============== \n");
    	// log.debug("classification : {}", classification);
    	// log.debug("number : {}", number);
    	// log.debug("date : {}", date);
    	// log.debug("reason : {}", reason);
    	
    	String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
    	String userName = ((UserDto)session.getAttribute("loginUser")).getUserName();
    	
    	
    	Map<String, String> map = new HashMap<>();
    	map.put("classification", classification);
    	map.put("number", number);
    	map.put("date", date);
    	map.put("reason", reason);
    	map.put("userNo", userNo);
    	map.put("userName", userName);

    	int result = reservationService.reserve(map);
    	
    	if(result > 0) {
    		ra.addFlashAttribute("alertMsg", "예약에 성공했습니다.");
    		return "redirect:/reservation/main";
    	}else {
    		ra.addFlashAttribute("alertMsg", "예약에 실패했습니다.");
    		return "redirect:/reservation/main";	
    	}
    	
    }
    
    
    /**
     * 내 예약 내역 조회 페이지(/reservation/myReservaion.jsp)로 이동시키는 메소드
     * author : 상우
     * @param session 현재 로그인한 사용자 세션
     * @param model 포워딩한 jsp로 응답 데이터를 전달하기 위한 객체
     */
    @GetMapping("/myReservation")
    public String myReservation(HttpSession session, Model model) {
    	
    	log.debug("=============== myReservation 메소드 실행됨 =============== \n");
    	
    	String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
    	
    	List<ReservationDto> reservationList = reservationService.selectReservationByUserNo(userNo); 
    	
    	log.debug("reservationList : {}", reservationList);
    	model.addAttribute("reservationList", reservationList); 	
    	
    	
    	
    	if(reservationList == null || reservationList.isEmpty()) {
    		
    		log.debug("현재 로그인 유저의 예약 내역 없음.");
    		
    	}else {
    		
    		for(ReservationDto reservationDto : reservationList) {
    			
    			if(reservationDto.getEquipNo() == null) { // 시설 예약의 경우
    				
    				reservationDto.setClassification("시설");
    				
    			}else if(reservationDto.getFacilityNo() == null){ // 비품 예약의 경우
    				
    				reservationDto.setClassification("비품");
    			}
    		}
    	}
    	
    	return "/reservation/myReservation";
    }
    
    
    
    /**
     * 비품, 시설 예약 관리 페이지(/reservation/approveReservation.jsp)로 이동시키는 메소드
     * author : 상우
     * @param session 현재 로그인한 사용자 세션
     * @param model 포워딩한 jsp로 응답 데이터를 전달하기 위한 객체
     */
    @GetMapping("/approveReservation")
    public String approveReservation(HttpSession session, Model model) {
    	
    	log.debug("=============== approveReservation 메소드 실행됨 =============== \n");
    	
    	String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
    	
    	List<ReservationDto> reservationList = reservationService.selectReservationAll();
    	
    	log.debug("reservationList : {}", reservationList);
    	model.addAttribute("reservationList", reservationList); 	
    	
    	
    	
    	if(reservationList == null || reservationList.isEmpty()) {
    		
    		log.debug("표시할 비품, 시설 예약 내역이 없음.");
    		
    	}else {
    		
    		for(ReservationDto reservationDto : reservationList) {
    			
    			if(reservationDto.getEquipNo() == null) { // 시설 예약의 경우
    				
    				reservationDto.setClassification("시설");
    				
    			}else if(reservationDto.getFacilityNo() == null){ // 비품 예약의 경우
    				
    				reservationDto.setClassification("비품");
    			}
    		}
    	}
    	
    	return "/reservation/approveReservation";
    }
    
    
    /**
     * 예약 신청에 대해 승인/반려하는 메소드
     * @param classification "비품" | "시설"
     * @param reservationNo 예약번호
     * @param reason 승인/반려사유
     * @param choice "승인" | "반려"
     * @param session 현재 로그인한 사용자 세션
     * @param ra 리다이렉트한 jsp로 응답 데이터를 전달하기 위한 객체
     */
    @PostMapping("/updateReservation")
	public String updateReservation(String classification, String reservationNo, String reason, String choice, String userName
									, String equipName, String facilityName, String reservationDate, HttpSession session, RedirectAttributes ra) {
    	
    	log.debug("=============== updateReservation 메소드 실행됨 =============== \n");
    	log.debug("classification : {}", classification);
    	log.debug("reservationNo : {}", reservationNo);
    	log.debug("reason : {}", reason);
    	log.debug("choice : {}", choice);
    	
    	String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo(); // 현재 로그인한 관리자 사번을 최근 수정자로.
    	
    	Map<String, String> map = new HashMap<>();
    	map.put("classification", classification);
    	map.put("reservationNo", reservationNo);
    	map.put("reason", reason);
    	map.put("choice", choice);
    	map.put("userNo", userNo);


    	int result = reservationService.updateReservation(map);
    	
    	if(result > 0) {
    		ra.addFlashAttribute("alertMsg", "예약 처리에 성공했습니다.");
    		
    		String text = "";
    		if(classification.equals("비품")) {
    			text = userName +"님의 " + reservationDate + " 일자의 " + equipName + " 비품의 예약 신청이 " + choice + "되었습니다.";
    		}else if(classification.equals("시설")) {
    			text = userName +"님의 " + reservationDate + " 일자의 " + facilityName + " 시설의 예약 신청이 " + choice + "되었습니다.";
    		}
    		log.debug("text : {}", text);
    		
    		//sendOne(text);
    		
    		return "redirect:/reservation/approveReservation";
    	}else {
    		ra.addFlashAttribute("alertMsg", "예약 처리에 실패했습니다.");
    		return "redirect:/reservation/approveReservation";	
    	}
    	
    }
        
    
    /**
     * coolsms로 문자 발송시키는 메소드
     * author : 상우
     * @param text 문자로 보낼 내용
     */
    public SingleMessageSentResponse sendOne(String text) {
    	
        Message message = new Message();
        
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01026783677");
        message.setTo("01026783677");
        
        message.setText(text); // 한글 45자, 영자 90자 이하 입력되면 자동으로 SMS타입의 메시지가 추가됩니다.

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
    }
    
    
    
    
}
