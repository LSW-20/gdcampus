package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.EquipmentDto;
import com.br.gdcampus.dto.FacilityDto;
import com.br.gdcampus.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class EquipmentAndFacilityDao {
	
	private final SqlSessionTemplate sqlSession;

	/**
	 * 비품 카테고리 조회
	 * author : 상우
	 * @return 비품 카테고리 목록
	 */
	public List<String> selectEquipmentCategory() {
		return sqlSession.selectList("equipmentAndFacilityMapper.selectEquipmentCategory");
	}
	
	/**
	 * 시설 카테고리 조회
	 * author : 상우
	 * @return 시설 카테고리 목록
	 */
	public List<String> selectFacilityCategory() {
		return sqlSession.selectList("equipmentAndFacilityMapper.selectFacilityCategory");
	}

	/**
	 * 비품 목록 전체 개수 조회
	 * author : 상우
	 * @return 비품 목록 전체 개수
	 */
	public int selectEquipmentListCount(String equipment) {
		 return sqlSession.selectOne("equipmentAndFacilityMapper.selectEquipmentListCount", equipment);
	}

	/**
	 * 비품 목록 조회
	 * author : 상우
	 * @param pi 페이징 처리에 필요한 정보
	 * @param equipment 비품 카테고리
	 * @return 비품 목록
	 */
	public List<EquipmentDto> selectEquipmentList(PageInfoDto pi, String equipment) {
		
		 RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		   
		 return sqlSession.selectList("equipmentAndFacilityMapper.selectEquipmentList", equipment, rowBounds);
	}

	/**
	 * 시설 목록 전체 개수 조회
	 * author : 상우
	 * @return 시설 목록 전체 개수
	 */
	public int selectFacilityListCount(String facility) {
		 return sqlSession.selectOne("equipmentAndFacilityMapper.selectFacilityListCount", facility);
	}

	/**
	 * 시설 목록 조회
	 * author : 상우
	 * @param pi 페이징 처리에 필요한 정보
	 * @param facility 시설 카테고리
	 * @return 시설 목록
	 */
	public List<FacilityDto> selectFacilityList(PageInfoDto pi, String facility) {
		 RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		   
		 return sqlSession.selectList("equipmentAndFacilityMapper.selectFacilityList", facility, rowBounds);
	}

	/**
	 * 비품 삭제
	 * author : 상우
	 * @param 삭제할 비품 번호들
	 * @return 성공시 1, 실패시 0
	 */
	public int deleteEquipment(String[] deleteList) {
		return sqlSession.update("equipmentAndFacilityMapper.deleteEquipment", deleteList);
	}

	/**
	 * 시설 삭제
	 * author : 상우
	 * @param 삭제할 시설 번호들
	 * @return 성공시 1, 실패시 0
	 */
	public int deleteFacility(String[] deleteList) {
		return sqlSession.update("equipmentAndFacilityMapper.deleteFacility", deleteList);
	}
	
	/**
	 * 비품 추가(첨부파일) - (1/2) T_EQUIPMENT 테이블에 INSERT
	 * author : 상우
	 * @param map 유저사번, 비품 카테고리, 비품명
	 * @return 성공시 1, 실패시 0
	 */
	public int addEquipment(Map<String, String> map) {
		return sqlSession.insert("equipmentAndFacilityMapper.addEquipment", map);
	}

	/**
	 * 비품 추가(첨부파일) - (2/2) T_ATTACHMENT 테이블에 INSERT
	 * author : 상우
	 * @param map 유저사번, 비품 카테고리, 비품명
	 * @param attachDto 첨부파일 dto
	 * @return 성공시 1, 실패시 0
	 */
	public int addAttachment(AttachDto attachDto) {
		return sqlSession.insert("equipmentAndFacilityMapper.addAttachment", attachDto);
	}

	/**
	 * 시설 추가
	 * author : 상우
	 * @param map 유저사번, 시설 카테고리, 시설명
	 * @return 성공시 1, 실패시 0
	 */
	public int addFacility(Map<String, String> map) {
		return sqlSession.insert("equipmentAndFacilityMapper.addFacility", map);
	}

	/**
	 * 파일경로, DB저장파일명 조회 메소드
	 * author : 상우
	 * @param equipNo 비품번호
	 * @return 파일경로, DB저장된파일명
	 */
	public Map<String, String> selectFileURL(String equipNo) {
		return sqlSession.selectOne("equipmentAndFacilityMapper.selectFileURL", equipNo);
	}

	/**
	 * 비품번호로 비품 정보 조회
	 * author : 상우
	 * @param equipNo 비품번호
	 * @return EquipmentDto
	 */
	public EquipmentDto selectEquipmentByEquipNo(String equipNo) {
		return sqlSession.selectOne("equipmentAndFacilityMapper.selectEquipmentByEquipNo", equipNo);
	}



}
