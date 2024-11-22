package com.br.gdcampus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.service.EquipmentAndFacilityService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequestMapping("/equipmentAndFacility")
@RequiredArgsConstructor
@Controller
public class EquipmentAndFacilityController {

	private final EquipmentAndFacilityService equipmentAndFacilityService;
	
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	
	/**
	 * 비품, 시설 관리 페이지(manage.jsp)로 이동시키는 메소드
	 * author : 상우
	 */
	@GetMapping("/manage")
	public void goManageCategoryPage(HttpSession session, Model model) {
		
	}
	
	
	/**
	 * 비품, 시설 카테고리 조회
	 * author : 상우
	 */
	@ResponseBody
	@GetMapping(value="/selectCategory", produces="application/json")
	public Map<String, Object> selectCategory(String category) {
		
		Map<String, Object> map = new HashMap<>();
		
		if( category.equals("비품") ) {
			List<String> list = equipmentAndFacilityService.selectEquipmentCategory();
			map.put("category", "비품");
			map.put("list", list);
		}else if( category.equals("시설") ) {
			List<String> list = equipmentAndFacilityService.selectFacilityCategory();
			map.put("category", "시설");
			map.put("list", list);
		}
	
		return map;
	}
	
	/**
	 * 비품, 시설 리스트 조회
	 * author : 상우
	 */
	@GetMapping("/selectList")
	public String selectList(String equipment, String facility, RedirectAttributes ra) {
		
		logger.debug("equipment값 : {}", equipment); // "비품 전체", "노트북", "키보드", "마우스", "의자"
		logger.debug("facility값 : {}", facility);	 // "시설 전체", "회의실", "강당", "휴게실", "연구실"	 
		
		Map<String, Object> responseMap = new HashMap<>();
		
		if(equipment == null) { // 시설 리스트 조회
			
			//List<EquipmentDto> equipmentList = equipmentAndFacilityService.selectFacilityList(facility);
			responseMap.put("구분", "시설");
			//responseMap.put("equipmentList", equipmentList);
			
		}else if(facility == null) { // 비품 리스트 조회
			
			//List<FacilityDto> facilityList = equipmentAndFacilityService.selectEquipmentList(equipment);
			responseMap.put("구분", "비품");			
			//responseMap.put("facilityList", facilityList);
			
		}
		
		ra.addFlashAttribute("responseMap", responseMap);
		
		return "redirect:/equipmentAndFacility/manage";
	}
	
	
	
}
