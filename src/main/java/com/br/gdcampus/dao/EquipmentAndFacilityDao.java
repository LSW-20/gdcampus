package com.br.gdcampus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
