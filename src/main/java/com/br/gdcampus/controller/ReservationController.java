package com.br.gdcampus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.service.EquipmentAndFacilityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/reservation")
@RequiredArgsConstructor
@Controller
public class ReservationController {

	private final EquipmentAndFacilityService equipmentAndFacilityService;
	// private final ReservationService reservationService;
	
	
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
	
	
}
