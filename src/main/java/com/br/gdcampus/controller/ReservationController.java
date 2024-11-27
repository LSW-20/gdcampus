package com.br.gdcampus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.EquipmentAndFacilityService;
import com.br.gdcampus.service.ReservationService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/reservation")
@RequiredArgsConstructor
@Controller
public class ReservationController {

	private final EquipmentAndFacilityService equipmentAndFacilityService;
	private final ReservationService reservationService;
	
	
	/**
	 * 예약하기 페이지(reservation.jsp)로 이동시키는 메소드
	 * author : 상우
	 * @param model 포워딩한 jsp로 응답 데이터를 전달하기 위한 객체
	 */
	@GetMapping("/main")
	public String reservationMain() {
		
		log.debug("=============== reservationMain 메소드 실행됨 ===============\n");
		return "/equipmentAndFacility/reservation";
		
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
    	log.debug("classification : {}", classification);
    	log.debug("number : {}", number);
    	log.debug("date : {}", date);
    	log.debug("reason : {}", reason);
    	
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
    		return "redirect:/reservation/myReservation";
    	}else {
    		ra.addFlashAttribute("alertMsg", "예약에 실패했습니다.");
    		return "redirect:/reservation/main";	
    	}
    	
    }
    
    
    @GetMapping("/myReservation")
    public String myReservation() {
    	
    	log.debug("=============== myReservation 메소드 실행됨 =============== \n");
    	
    	
    	
    	
    	
    	return "/equipmentAndFacility/myReservation";
    }
}
