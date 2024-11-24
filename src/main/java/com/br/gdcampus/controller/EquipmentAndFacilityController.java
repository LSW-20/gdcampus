package com.br.gdcampus.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.EquipmentAndFacilityService;
import com.br.gdcampus.util.FileUtil;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/equipmentAndFacility")
@RequiredArgsConstructor
@Controller
public class EquipmentAndFacilityController {

	private final EquipmentAndFacilityService equipmentAndFacilityService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	
	/**
	 * 비품, 시설 관리 페이지(list.jsp)로 이동시키는 메소드
	 * author : 상우
	 * @param equipment 비품 카테고리 : null | "비품 전체" | "노트북" | "키보드" | "마우스" | "의자"
	 * @param facility 시설 카테고리 :  null | "시설 전체" | "회의실" | "강당" | "휴게실" | "연구실"	
	 * @param currentPage 사용자가 요청한 페이징 번호(최초 검색시 1로 간주)
	 * @param model 포워딩한 jsp로 응답 데이터를 전달하기 위한 객체
	 */
	@GetMapping("/list")
	public void manageList(String equipment, String facility, @RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		log.debug("=============== manageList 메소드 실행됨 ===============");
		log.debug("equipment값 : {}", equipment);  
		log.debug("facility값 : {}", facility);	   
		log.debug("page값 : {}", currentPage);
		
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
	
	
	/**
	 * 비품, 시설 삭제 메소드
	 * @param target "비품" | "시설"
	 * @param deleteList 삭제할 비품 번호들 | 삭제할 시설 번호들
	 * @param ra 리다이렉트한 jsp로 응답 데이터를 전달하기 위한 객체
	 */
	@PostMapping("/deleteList")
	public String deleteList(String target, String[] deleteList, RedirectAttributes ra) {
		
		log.debug("=============== deleteList 메소드 실행됨 ===============");
		log.debug("deleteList 값 : {}",  Arrays.toString(deleteList)); 
		
		
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
	
	
	/**
	 * 비품 추가 메소드
	 * author : 상우
	 * @param selectedCategory 비품 카테고리 : "비품 전체" | "노트북" | "키보드" | "마우스" | "의자"
	 * @param name 사용자가 입력한 비품명
	 * @param session 현재 로그인한 사용자 세션
	 * @param ra 리다이렉트한 jsp로 응답 데이터를 전달하기 위한 객체
	 */
	@PostMapping("/addEquipment")
	public String addEquipment(String selectedCategory, String name, MultipartFile uploadFile, HttpSession session, RedirectAttributes ra) {
		
		log.debug("=============== addEquipment 메소드 실행됨 ===============");
		log.debug("selectedCategory 값 : {}",  selectedCategory); 
		log.debug("name 값 : {}",  name); 
		log.debug("uploadFile 값 : {}",  uploadFile); 
		
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("selectedCategory", selectedCategory);
		map.put("name", name);
		
		

	    AttachDto attachDto = null; // 첨부파일이 없으면 null인 채로 넘긴다.
		
	    if(uploadFile != null && !uploadFile.isEmpty()) { // 첨부파일이 존재할 경우 => 업로드
	    	
	      log.debug("파일명: {}", uploadFile.getOriginalFilename());
	      log.debug("파일크기: {}", uploadFile.getSize());
	      log.debug("파일타입: {}", uploadFile.getContentType());
	     
	      Map<String,String> insertFileInfo = new HashMap<>();
			
	      insertFileInfo = fileUtil.fileupload(uploadFile, "Equipment");
	      
		  attachDto = AttachDto.builder().filePath(insertFileInfo.get("filePath")).originalName(insertFileInfo.get("originalName")).filesystemName(insertFileInfo.get("filesystemName")).build();
	    }		
		

		int result = equipmentAndFacilityService.addEquipment(map, attachDto);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "비품 추가에 성공했습니다.");
		}else {
			ra.addFlashAttribute("alertMsg", "비품 추가에 실패하였습니다.");
		}
		
		return "redirect:/equipmentAndFacility/list";
	}
	
	
	/**
	 * 시설 추가 메소드
	 * author : 상우
	 * @param selectedCategory 시설 카테고리 : "시설 전체" | "회의실" | "강당" | "휴게실" | "연구실"	
	 * @param name 사용자가 입력한 시설명
	 * @param session 현재 로그인한 사용자 세션
	 * @param ra 리다이렉트한 jsp로 응답 데이터를 전달하기 위한 객체
	 */
	@PostMapping("/addFacility")
	public String addFacility(String selectedCategory, String name, HttpSession session, RedirectAttributes ra) {
		
		log.debug("=============== addFacility 메소드 실행됨 ===============");
		
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("selectedCategory", selectedCategory);
		map.put("name", name);
		
		int result = equipmentAndFacilityService.addFacility(map);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "시설 추가에 성공했습니다.");
		}else {
			ra.addFlashAttribute("alertMsg", "시설 추가에 실패하였습니다.");
		}
		
		return "redirect:/equipmentAndFacility/list";
	}
	
	
	
}
