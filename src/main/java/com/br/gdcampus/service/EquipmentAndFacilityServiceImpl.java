package com.br.gdcampus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.EquipmentAndFacilityDao;
import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.dto.PageInfoDto;

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

	/**
	 * 비품 목록 전체 개수 조회
	 * author : 상우
	 * @return 비품 목록 전체 개수
	 */
	@Override
	public int selectEquipmentListCount() {
		return equipAndFacilityDao.selectEquipmentListCount();
	}

	/**
	 * 비품 목록 조회
	 * author : 상우
	 * @param pi 페이징 처리에 필요한 정보
	 * @param equipment 비품 카테고리
	 * @return 비품 목록
	 */
	@Override
	public List<EquipmentDto> selectEquipmentList(PageInfoDto pi, String equipment) {
		return equipAndFacilityDao.selectEquipmentList(pi, equipment);
	}

	/**
	 * 시설 목록 전체 개수 조회
	 * author : 상우
	 * @return 시설 목록 전체 개수
	 */
	@Override
	public int selectFacilityListCount() {
		return equipAndFacilityDao.selectFacilityListCount();
	}

	/**
	 * 시설 목록 조회
	 * author : 상우
	 * @param pi 페이징 처리에 필요한 정보
	 * @param facility 시설 카테고리
	 * @return 시설 목록
	 */
	@Override
	public List<FacilityDto> selectFacilityList(PageInfoDto pi, String facility) {
		return equipAndFacilityDao.selectFacilityList(pi, facility);
	}
	
}
