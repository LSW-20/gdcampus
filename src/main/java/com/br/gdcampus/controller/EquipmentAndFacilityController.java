package com.br.gdcampus.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	 * 비품, 시설 카테고리 관리 페이지(manageCategory.jsp)로 이동시키는 메소드
	 * author : 상우
	 */
	@GetMapping("/manageCategory")
	public void goManageCategoryPage(HttpSession session, Model model) {
		
	}
	
}
