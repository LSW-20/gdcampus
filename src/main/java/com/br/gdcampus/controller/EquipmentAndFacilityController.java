package com.br.gdcampus.controller;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.service.EquipmentAndFacilityService;
import com.br.gdcampus.util.PagingUtil;

import lombok.RequiredArgsConstructor;

@RequestMapping("/equipmentAndFacility")
@RequiredArgsConstructor
@Controller
public class EquipmentAndFacilityController {

	private final EquipmentAndFacilityService equipmentAndFacilityService;
	private final PagingUtil pagingUtil;
	
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	  
	
	
	/**
	 * 비품, 시설 관리 페이지(list.jsp)로 이동시키는 메소드
	 * author : 상우
	 */
	@GetMapping("/list")
	public void manageList(String equipment, String facility, @RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		logger.debug("=============== manageList 메소드 실행됨 ===============");
		logger.debug("equipment값 : {}", equipment); // "비품 전체", "노트북", "키보드", "마우스", "의자"
		logger.debug("facility값 : {}", facility);	 // "시설 전체", "회의실", "강당", "휴게실", "연구실"	 
		logger.debug("page값 : {}", currentPage);
		
		if(facility != null) {
			model.addAttribute("resultClass", facility);
		}else if(equipment != null) {
			model.addAttribute("resultClass", equipment);
		}
		
		
		List<String> equipmentCategoryList = equipmentAndFacilityService.selectEquipmentCategory(); // 비품 카테고리 조회
		List<String> facilityCategoryList = equipmentAndFacilityService.selectFacilityCategory(); 	// 시설 카테고리 조회
		
		model.addAttribute("equipmentCategoryList", equipmentCategoryList);
		model.addAttribute("facilityCategoryList", facilityCategoryList);
		
		
		if(facility != null) { // 시설 리스트 조회의 경우
			
			int listCount = equipmentAndFacilityService.selectFacilityListCount(facility);
		    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
			
			List<FacilityDto> list = equipmentAndFacilityService.selectFacilityList(pi, facility);

			model.addAttribute("category", "시설");
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
		}else if(equipment != null) { // 비품 리스트 조회의 경우
			
			int listCount = equipmentAndFacilityService.selectEquipmentListCount(equipment);
		    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
			
			List<EquipmentDto> list = equipmentAndFacilityService.selectEquipmentList(pi, equipment);	
			
			model.addAttribute("category", "비품");
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);

		}
		
	}
	
	
	@PostMapping("/deleteList")
	public String deleteList(String target, String[] deleteList, RedirectAttributes ra) {
		
		logger.debug("=============== deleteList 메소드 실행됨 ===============");
		logger.debug("deleteList 값 : {}",  Arrays.toString(deleteList)); 
		
		
		if (deleteList == null || deleteList.length == 0) {
		    ra.addFlashAttribute("alertMsg", "삭제할 항목이 없습니다.");
		    return "redirect:/equipmentAndFacility/list";
		}
		
		int result = 0;
		
		if(target.equals("비품")) {
			result = equipmentAndFacilityService.deleteEquipment(deleteList);
		}else {
			result = equipmentAndFacilityService.deleteFacility(deleteList);
		}
		
		
		
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "삭제에 성공했습니다.");
		}else {
			ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
		}
		
		return "redirect:/equipmentAndFacility/list";
	}
	
	

	
	
	
}
