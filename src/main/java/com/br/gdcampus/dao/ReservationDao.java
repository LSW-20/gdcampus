package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.ReservationDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ReservationDao {

	private final SqlSessionTemplate sqlSession;
	
	/**
	 * 예약 가능 여부 조회
	 * author : 상우
	 * @param map classification("비품" | "시설"), date(예약희망일), number(비품번호 | 시설번호)
	 * return 예약희망일에 해당하는 비품 | 시설의 상태값
	 */
	public String checkAvailability(Map<String, Object> map) {
		return sqlSession.selectOne("reservationMapper.checkAvailability", map);
	}

	/**
	 * 예약하기
	 * author : 상우
	 * @param map 구분("비품" | "시설"), 비품번호 | 시설번호, 예약희망일, 예약사유, 유저사번, 유저이름
	 * return 성공시 1, 실패시 0
	 */
	public int reserve(Map<String, String> map) {
		return sqlSession.insert("reservationMapper.reserve", map);
	}

	/**
	 * userNo로 예약내역 조회
	 * author : 상우
	 * @param userNo 유저사번
	 * return 예약내역
	 */
	public List<ReservationDto> selectReservationByUserNo(String userNo) {
		return sqlSession.selectList("reservationMapper.selectReservation", userNo);
	}

	/**
	 * 전체 예약내역 조회
	 * author : 상우
	 * return 전체 예약내역 
	 */
	public List<ReservationDto> selectReservationAll() {
		return sqlSession.selectList("reservationMapper.selectReservation");
	}
	
	/**
	 * 예약 신청에 대해 승인/반려하는 메소드
	 * author : 상우
	 * return 성공시 1, 실패시 0
	 */
	public int updateReservation(Map<String, String> map) {
		return sqlSession.update("reservationMapper.updateReservation", map);
	}

	/**
	 * [스케줄러] 일주일이 지났는데도 "예약신청중" 상태인 예약 신청은 자동으로 반려처리하는 메소드(매일 밤 12시 실행)
	 * author : 상우
	 * return 7일이 경과해 자동으로 반려처리 된 예약 신청 개수
	 */
	public int rejectReservationsOlderThan7Days() {
		return sqlSession.update("reservationMapper.rejectReservationsOlderThan7Days");
	}
	
	
}
