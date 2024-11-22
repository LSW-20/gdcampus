package com.br.gdcampus.service;

import java.util.List;

import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.PageInfoDto;

public interface EquipmentAndFacilityService {

	// 비품 카테고리 조회 - 상우
	List<String> selectEquipmentCategory();

	// 시설 카테고리 조회 - 상우
	List<String> selectFacilityCategory();

	// 비품 목록 조회(페이징 처리)
	// int selectEquipmentListCount();
	// List<EquipmentDto> selectEquipmentList(PageInfoDto pi, String equipment);
	  
	// 시설 목록 조회(페이징 처리)
	// int selectFacilityListCount();
	// List<FacilityDto> selectFacilityList(PageInfoDto pi, String facility);
	

	// 비품 추가 - 상우
	//int insertEquip(Map<String, Object> map); // BoardDto board, AttachDto attach
	
	// 비품 수정 - 상우
	//int updateEquip(Map<String, Object> map);
	
	// 비품 삭제 - 상우
	//int deleteEquip(List<String> EquipNo);
	
	// 시설 추가 - 상우
	//int insertFacility(Map<String, Object> map);
	
	// 시설 수정 - 상우
	//int updateFacility(Map<String, Object> map);
	
	// 시설 삭제 - 상우
	//int deleteFacility(List<String> FacilityNo);
	
}