package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.ReservationDto;

public interface ReservationService {

	// 예약 가능 여부 조회 - 상우
	String checkAvailability(Map<String, Object> map);

	// 예약하기 - 상우
	int reserve(Map<String, String> map);

	// userNo로 예약내역 조회 - 상우
	List<ReservationDto> selectReservationByUserNo(String userNo);

	// 전체 예약내역 조회 - 상우
	List<ReservationDto> selectReservationAll();

	// 예약 신청에 대해 승인/반려하는 메소드 - 상우
	int updateReservation(Map<String, String> map);
	
}
