package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.EquipmentAndFacilityDao;
import com.br.gdcampus.dto.AttachDto;
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
	 * @param equipment 비품 카테고리
	 * @return 비품 목록 전체 개수
	 */
	@Override
	public int selectEquipmentListCount(String equipment) {
		return equipAndFacilityDao.selectEquipmentListCount(equipment);
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
	 * @param facility 시설 카테고리
	 * @return 시설 목록 전체 개수
	 */
	@Override
	public int selectFacilityListCount(String facility) {
		return equipAndFacilityDao.selectFacilityListCount(facility);
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

	/**
	 * 비품 삭제
	 * author : 상우
	 * @param deleteList 삭제할 비품 번호들
	 * @return 성공시 1, 실패시 0
	 */
	@Override
	public int deleteEquipment(String[] deleteList) {
		return equipAndFacilityDao.deleteEquipment(deleteList);
	}

	/**
	 * 시설 삭제
	 * author : 상우
	 * @param 삭제할 시설 번호들
	 * @return 성공시 1, 실패시 0
	 */
	@Override
	public int deleteFacility(String[] deleteList) {
		return equipAndFacilityDao.deleteFacility(deleteList);
	}
	
	/**
	 * 비품 추가(첨부파일)
	 * author : 상우
	 * @param map 유저사번, 비품 카테고리, 비품명
	 * @param attachDto 첨부파일 dto
	 * @return 성공시 1, 실패시 0
	 */
	@Override
	public int addEquipment(Map<String, String> map, AttachDto attachDto) {

		int result = equipAndFacilityDao.addEquipment(map);
		
		if(result > 0 && attachDto != null) {
			result = equipAndFacilityDao.addAttachment(attachDto);
		}
		
		return result;
	}

	/**
	 * 시설 추가
	 * author : 상우
	 * @param map 유저사번, 시설 카테고리, 시설명
	 * @return 성공시 1, 실패시 0
	 */
	@Override
	public int addFacility(Map<String, String> map) {
		return equipAndFacilityDao.addFacility(map);
	}

	/**
	 * 파일경로, DB저장파일명 조회 메소드
	 * author : 상우
	 * @param equipNo 비품번호
	 * @return 파일경로, db저장파일명
	 */
	@Override
	public Map<String, String> selectFileURL(String equipNo) {
		return equipAndFacilityDao.selectFileURL(equipNo);
	}

	/**
	 * 비품번호로 비품 정보 조회
	 * author : 상우
	 * @param equipNo 비품번호
	 * @return EquipmentDto
	 */
	@Override
	public EquipmentDto selectEquipmentByEquipNo(String equipNo) {
		return equipAndFacilityDao.selectEquipmentByEquipNo(equipNo);
	}




	
}
