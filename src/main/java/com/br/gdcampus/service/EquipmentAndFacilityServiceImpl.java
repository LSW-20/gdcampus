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
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		
		int result = equipAndFacilityDao.deleteEquipment(deleteList); // 비품 테이블에 update로 status를 "Y"에서 "N"으로 수정한다.
		
		if(result > 0) {
			for(String equipNo : deleteList) {
				equipAndFacilityDao.deleteAttachment(equipNo); // 첨부파일 테이블에 delete. 그런데 업로드한 파일이 아닌 static에 있는 초기 샘플 파일은 t_attachment에 데이터가 없다. 
			}
		}
		
		return result;
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
		
		if(result > 0) {
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
	 * 비품번호로 파일경로, DB저장파일명 등 조회 메소드
	 * author : 상우
	 * @param equipNo 비품번호
	 * @return 파일경로, db저장파일명
	 */
	@Override
	public AttachDto selectAttachment(String equipNo) {
		return equipAndFacilityDao.selectAttachment(equipNo);
	}

	/**
	 * 비품번호로 비품 정보 조회
	 * author : 상우
	 * @param equipNo 비품번호
	 * @return 비품 정보
	 */
	@Override
	public EquipmentDto selectEquipmentByEquipNo(String equipNo) {
		return equipAndFacilityDao.selectEquipmentByEquipNo(equipNo);
	}

	
	/**
	 * 시설 수정
	 * author : 상우 
	 * @param map 유저사번, 시설 카테고리, 시설명, 시설번호
	 * @return 성공시 1, 실패시 0
	 */
	public int modifyFacility(Map<String, Object> map) {
		return equipAndFacilityDao.modifyFacility(map);
	}


	/**
	 * 비품 수정(첨부파일 있음)
	 * author : 상우
	 * @param map 유저사번, 비품 카테고리, 비품명, 비품번호 + 첨부파일dto
	 * @return 성공시 1, 실패시 0
	 */
	@Override
	public int modifyEquipmentWithFile(Map<String, Object> map) {
		

	    // 1) t_equipment 테이블에 update
	    int result1 = equipAndFacilityDao.modifyEquipment(map);
	    
	   
	    // 2) t_attachment 테이블에 delete
	    String equipNo = (String) map.get("no");
	    
	    if(result1 > 0) {
	    	equipAndFacilityDao.deleteAttachment(equipNo); // 첨부파일 테이블에 delete. 그런데 업로드한 파일이 아닌 static에 있는 초기 샘플 파일은 t_attachment에 데이터가 없다. 
	    }
	    
	   
	    // 3) t_attachment 테이블에 insert
	    AttachDto insertAttachDto = (AttachDto) map.get("insertAttachDto");
	    insertAttachDto.setEquipNo((String) map.get("no"));
	    int result2 = 0;
	    
	    if(result1 > 0) {
	    	result2 = equipAndFacilityDao.modifyAddAttachment(insertAttachDto); // 비품 수정 후 첨부파일 insert 시에는 비품번호로 시퀀스.currval을 쓸 수 없어서 다른 쿼리를 사용해야 한다.
	    }
	   
	    log.debug("result1 값 : {}", result1);
	    log.debug("result2 값 : {}", result2);
	    return ( result1 == 1 && result2 == 1) ? 1 : -1;
	   
	}

	/**
	 * 복수의 비품 번호로 복수의 첨부파일 정보 조회
	 * author : 임상우
	 * @param equipNoList 비품 번호들
	 * return 비품 번호에 해당하는 첨부파일 정보 리스트
	 */
	@Override
	public List<AttachDto> selectAttachmentList(String[] equipNoList) {
		return equipAndFacilityDao.selectAttachmentList(equipNoList);
	}

	/**
	 * 카테고리에 맞는 비품 정보 조회
	 * author : 임상우
	 * return 전체 비품 정보
	 */
	@Override
	public List<EquipmentDto> selectAllEquipment(String category) {
		return equipAndFacilityDao.selectAllEquipment(category);
	}

	/**
	 * 카테고리에 맞는 시설 정보 조회
	 * author : 임상우
	 * return 전체 시설 정보
	 */
	@Override
	public List<FacilityDto> selectAllFacility(String category) {
		return equipAndFacilityDao.selectAllFacility(category);
	}


}
