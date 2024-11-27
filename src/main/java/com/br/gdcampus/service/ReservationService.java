package com.br.gdcampus.service;

import java.util.Map;

public interface ReservationService {

	// 예약 가능 여부 조회 - 상우
	String checkAvailability(Map<String, Object> map);

	// 예약하기 - 상우
	int reserve(Map<String, String> map);
	
}
