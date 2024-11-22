package com.br.gdcampus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.EquipmentAndFacilityDao;
import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EquipmentAndFacilityServiceImpl implements EquipmentAndFacilityService {

	private final EquipmentAndFacilityDao equipAndFacilityDao;

	/**
	 * 비품 카테고리 조회
	 * author : 상우
	 * @return 비품 카테고리 목록
	 */
	@Override
	public List<String> selectEquipmentCategory() {
		return equipAndFacilityDao.selectEquipmentCategory();
	}

	/**
	 * 시설 카테고리 조회
	 * author : 상우
	 * @return 시설 카테고리 목록
	 */
	@Override
	public List<String> selectFacilityCategory() {
		return equipAndFacilityDao.selectFacilityCategory();
	}
	
}
