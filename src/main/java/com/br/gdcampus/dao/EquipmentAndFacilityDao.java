package com.br.gdcampus.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
