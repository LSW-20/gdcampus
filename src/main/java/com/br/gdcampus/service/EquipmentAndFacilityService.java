package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.dto.PageInfoDto;

public interface EquipmentAndFacilityService {

	// 비품 카테고리 조회 - 상우
	List<String> selectEquipmentCategory();

	// 시설 카테고리 조회 - 상우
	List<String> selectFacilityCategory();

	// 비품 목록 조회(페이징 처리) - 상우
	int selectEquipmentListCount(String equipment); // 비품 목록 전체 개수 조회
	List<EquipmentDto> selectEquipmentList(PageInfoDto pi, String equipment); 
	  
	// 시설 목록 조회(페이징 처리) - 상우
	int selectFacilityListCount(String facility); // 시설 목록 전체 개수 조회
	List<FacilityDto> selectFacilityList(PageInfoDto pi, String facility);

	// 비품 삭제 - 상우
	int deleteEquipment(String[] deleteList);

	// 시설 삭제 - 상우
	int deleteFacility(String[] deleteList);
	
	// 비품 추가(첨부파일) - 상우
	int addEquipment(Map<String, String> map, AttachDto attachDto);
	
	// 시설 추가 - 상우
	int addFacility(Map<String, String> map);

	// 파일경로, DB저장파일명 조회 - 상우
	Map<String, String> selectFileURL(String equipNo);

	// 비품번호로 비품 정보 조회 - 상우
	EquipmentDto selectEquipmentByEquipNo(String equipNo);

	
	// 비품 수정 - 상우
	//int updateEquip(Map<String, Object> map);
	
	// 시설 수정 - 상우
	//int updateFacility(Map<String, Object> map);

	
}
