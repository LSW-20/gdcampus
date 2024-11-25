package com.br.gdcampus.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		
		if(target.equals("시설")) {
			result = equipmentAndFacilityService.deleteFacility(deleteList);
			
			if(result > 0) {
				ra.addFlashAttribute("alertMsg", "시설 삭제에 성공했습니다.");
			}else {
				ra.addFlashAttribute("alertMsg", "시설 삭제에 실패하였습니다.");
			}
			
		}else if(target.equals("비품")) {
			
			
			// 삭제할 비품 번호들(deleteList)에서 첨부파일로 업로드한 비품, 초기 샘플데이터로 있던 비품을 분리한다.
			// 비품 테이블에 삭제(update로 status를 "N"으로 변경)는 모든 deleteList에 대해 하지만,
			// 파일 삭제는 첨부파일로 업로드한 비품, 초기 샘플데이터로 있던 비품을 구분해서 해야 한다.
			
			
			// (1) db에 삭제 요청 성공시 삭제할 파일 정보 미리 조회 (첨부파일로 업로드한 파일 정보들)
			List<AttachDto> delAttachDtoList = new ArrayList<>();
			delAttachDtoList = equipmentAndFacilityService.selectAttachmentList(deleteList); // 복수의 비품 번호로 복수의 첨부파일 정보 조회
			
			List<String> uploadEquipmentNoList = new ArrayList<>(); // 첨부파일로 업로드한 비품 번호들이 uploadEquipmentNoList에 담긴다. 
			for(AttachDto attachDto : delAttachDtoList) {
				uploadEquipmentNoList.add(attachDto.getEquipNo());
			}
			
			
			// (2) db에 삭제 요청 성공시 삭제할 파일 정보 미리 조회 (초기 샘플데이터 파일명 - 첨부파일로 업로드하지 않고 static 폴더에 있음) 
			List<String> sampleNameList = new ArrayList<>();
			for(String equipNo : deleteList) {
				
				// deleteList에서 첨부파일로 업로드한 비품 번호들이 아닌 초기 샘플데이터들의 비품명이 sampleNameList에 담긴다. 
				if(!uploadEquipmentNoList.contains(equipNo)) {
					EquipmentDto equipmentDto = equipmentAndFacilityService.selectEquipmentByEquipNo(equipNo);
					sampleNameList.add(equipmentDto.getEquipName());
				}
			}
			
			
			// (3) 비품 테이블 삭제(update로 status를 "N"으로 변경)
			result = equipmentAndFacilityService.deleteEquipment(deleteList);
			
			if(result > 0) {
				
				ra.addFlashAttribute("alertMsg", "비품 삭제에 성공했습니다.");
				
				
				if(!uploadEquipmentNoList.isEmpty()) { // deleteList 중 첨부파일로 업로드한 비품번호들이 있다면 실행
					
					for(AttachDto delAttachDto : delAttachDtoList) {
						new File(delAttachDto.getFilePath() + "/" + delAttachDto.getFilesystemName()).delete();
					}
				}
				
				
				if(!sampleNameList.isEmpty()) { // deleteList 중 초기 샘플데이터 비품번호들이 있다면 실행
					
			        for (String equipmentName : sampleNameList) {
			        	
			        	// File sampleFile = new File("src/main/resources/static/images/equipment/" + equipmentName + ".jpg"); 로컬에서는 이렇게 직접 참조 가능하지만 배포하면 불가능하다.

						try {
							String staticPath = new ClassPathResource("static/images/equipment/").getFile().getAbsolutePath();
							File sampleFile = new File(staticPath + "/" + equipmentName + ".jpg");
							
				            if (sampleFile.exists()) {
				                if (sampleFile.delete()) {
				                    log.debug("샘플 데이터 삭제 성공: {}", sampleFile.getAbsolutePath());
				                } else {
				                    log.warn("샘플 데이터 삭제 실패: {}", sampleFile.getAbsolutePath());
				                }
				            } else {
				                log.debug("샘플 데이터 파일이 존재하지 않음: {}", sampleFile.getAbsolutePath());
				            }
				            
						} catch (IOException e) {
							log.error("샘플 데이터 삭제 중 경로 접근 실패", e);
						}

			        }
					
				}
				

			}else {
				ra.addFlashAttribute("alertMsg", "비품 삭제에 실패하였습니다.");
			}
			
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
		
		

	    AttachDto attachDto = null;
		
	    if(uploadFile != null && !uploadFile.isEmpty()) { // 첨부파일은 required라 무조건 넘어오긴 한다.
	    	
	      log.debug("파일명 : {}", uploadFile.getOriginalFilename());
	      log.debug("파일크기 : {}", uploadFile.getSize());
	      log.debug("파일타입 : {}", uploadFile.getContentType());
	     
	      // /upload/Equipment/yyyyMMdd에 첨부파일 저장하고, 첨부파일의 정보를 돌려받음. 
	      Map<String,String> insertFileInfo = new HashMap<>();
	      insertFileInfo = fileUtil.fileupload(uploadFile, "Equipment");
	      
	      // 첨부파일테이블에 insert할 첨부파일 정보
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
	
	
	/**
	 * 비품번호로 파일경로, db저장파일명 조회 메소드
	 * @param equipNo 조회할 비품 번호
	 * @param session 현재 로그인한 사용자 세션
	 * @return 파일경로 + DB저장파일명
	 */
	@ResponseBody
	@GetMapping(value="/selectFileURL", produces="text/html; charset=utf-8")
	public String selectFileURL(String equipNo) {
		
		log.debug("=============== selectFileURL 메소드 실행됨(수정하기 클릭시) ===============");
		
		AttachDto attachDto = equipmentAndFacilityService.selectAttachment(equipNo); // static 폴더의 초기 샘플 데이터면 null | db에 첨부파일 업로드했다면 파일경로, db에저장된파일명이 담긴 Map 객체
		
		
		String filePathAndFileSystemName = "";
		
		if(attachDto != null) {
			filePathAndFileSystemName = attachDto.getFilePath() + "/" + attachDto.getFilesystemName();
		}else {
			EquipmentDto equipmentDto = equipmentAndFacilityService.selectEquipmentByEquipNo(equipNo); // 비품번호로 비품 정보 조회
			filePathAndFileSystemName = "/images/equipment/" + equipmentDto.getEquipName() + ".jpg"; // 초기 샘플 데이터는 확장자가 전부 .jpg
		}
		
		
		log.debug("filePathAndFileSystemName 값 : {}", filePathAndFileSystemName);
		
		return filePathAndFileSystemName;
	}
	
	
	/**
	 * 비품, 시설 수정 메소드
	 * author : 상우
	 * @param classification 구분("비품" | "시설")
	 * @param category 수정한 분류
	 * @param no 비품번호 | 시설번호
	 * @param name 수정한비품명 | 수정한시설명
	 * @param modifyUploadFile 첨부파일(비어있을 수도 있다)
	 * @param session 현재 로그인한 사용자 세션
	 * @param ra 리다이렉트한 jsp로 응답 데이터를 전달하기 위한 객체
	 */
	@PostMapping("/modify")
	public String modify(String classification, String category, String no, String name, MultipartFile modifyUploadFile, HttpSession session, RedirectAttributes ra) {
		
		// 수정가능한 것은 분류(category)와 이름(name)뿐이다.
		
		log.debug("=============== modify 메소드 실행됨 ===============");
		log.debug("파일명 : {}",  modifyUploadFile.getOriginalFilename()); 
		
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("selectedCategory", category);
		map.put("no", no);
		map.put("name", name);
		
		int result = 0;
		
		
		// 시설 수정 요청인 경우. 시설은 첨부파일이 없다.
		if(classification.equals("시설")) { 
			
			result = equipmentAndFacilityService.modifyFacility(map);
			
		    if(result > 0) { 	    	
		    	ra.addFlashAttribute("alertMsg", "시설 수정에 성공했습니다.");
		    }else {  	
		    	ra.addFlashAttribute("alertMsg", "시설 수정에 실패했습니다.");
		    }
		    
		}
		
		
		// 비품 수정 요청인 경우. 비품은 첨부파일이 필수로 온다.
		// 기존 첨부파일은 사용자가 업로드한 파일일 수도 있고, static 폴더의 샘플 파일일 수도 있다.
		if(classification.equals("비품")) {
			
			AttachDto delAttachDto = null;
			AttachDto insertAttachDto = null;
			
				
			// (1) db에 수정 요청 성공시 삭제할 파일 정보 미리 조회 (첨부파일로 업로드한 파일 정보들)
			delAttachDto = equipmentAndFacilityService.selectAttachment(no);
			

			// (2) db에 수정 요청 성공시 삭제할 파일 정보 미리 조회 (초기 샘플데이터 파일명 - 첨부파일로 업로드하지 않고 static 폴더에 있음) 
			EquipmentDto equipmentDto = equipmentAndFacilityService.selectEquipmentByEquipNo(no);
			String equipmentName = equipmentDto.getEquipName();
			
			
			// /upload/Equipment/yyyyMMdd에 첨부파일 저장하고, 첨부파일의 정보를 돌려받음. 
		    Map<String,String> insertFileInfo = new HashMap<>();			
		    insertFileInfo = fileUtil.fileupload(modifyUploadFile, "Equipment");	  
		    
		    // 첨부파일테이블에 insert할 첨부파일 정보
		    insertAttachDto = AttachDto.builder().filePath(insertFileInfo.get("filePath")).originalName(insertFileInfo.get("originalName")).filesystemName(insertFileInfo.get("filesystemName")).build();
			map.put("insertAttachDto", insertAttachDto);		
			
			
			// (3) 비품 테이블 update, 첨부파일 테이블에 기존 데이터 delete, 첨부파일 테이블에 새 데이터 insert
		    result = equipmentAndFacilityService.modifyEquipmentWithFile(map);
		    
		    
		    
		    if(result > 0) { 
		    	
		    	ra.addFlashAttribute("alertMsg", "비품 수정에 성공했습니다.\\n(업로드한 이미지 파일 있음)");
		    	
		    	if(delAttachDto != null) { // 기존 파일이 첨부파일 업로드 기능으로 업로드한 경우
		    		
		    		new File(delAttachDto.getFilePath() + "/" + delAttachDto.getFilesystemName()).delete(); 
		    		
		    	}else if(delAttachDto == null) { // 기존 파일이 static 폴더의 샘플 파일인 경우(첨부 파일 테이블에 데이터 없음)
		    		
					try {
						String staticPath = new ClassPathResource("static/images/equipment/").getFile().getAbsolutePath();
						File sampleFile = new File(staticPath + "/" + equipmentName + ".jpg");
						
			            if (sampleFile.exists()) {
			                if (sampleFile.delete()) {
			                    log.debug("샘플 데이터 삭제 성공: {}", sampleFile.getAbsolutePath());
			                } else {
			                    log.warn("샘플 데이터 삭제 실패: {}", sampleFile.getAbsolutePath());
			                }
			            } else {
			                log.debug("샘플 데이터 파일이 존재하지 않음: {}", sampleFile.getAbsolutePath());
			            }
			            
					} catch (IOException e) {
						log.error("샘플 데이터 삭제 중 경로 접근 실패", e);
					}
		    		
		    	}
		        
		        
		    }else { 
		    	
		    	ra.addFlashAttribute("alertMsg", "비품 수정에 실패했습니다.");
		    	new File(insertAttachDto.getFilePath() + "/" + insertAttachDto.getFilesystemName()).delete(); // 기능이 실패했으나 첨부파일 저장된 상태다. 삭제한다.
		    }
			    
			
			
		}
		
		return "redirect:/equipmentAndFacility/list";
		
	}
	
	
}
