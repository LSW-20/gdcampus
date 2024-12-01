package com.br.gdcampus.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.br.gdcampus.service.ReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j // 로그 사용
@RequiredArgsConstructor // final 필드에 대해 매개변수 생성자가 만들어져서 주입된다.
@Component // 빈 등록
public class ReservationScheduler {

	
	private final ReservationService reservationService;
	
	
	
	@Scheduled(cron="0 0/1 * * * *") // 1분마다 실행되는지 확인용 메소드.
	public void execute1() {
		
		// log.debug("1분마다 매번 실행됨");
		
	}
	
	
	@Scheduled(cron="0 0 0 * * *") // 매일 밤 12시마다 실행된다. 일주일이 지났는데도 "예약신청중" 상태인 예약 신청은 자동으로 반려처리한다.
	public void rejectReservationsOlderThan7Days() {

		log.debug("[예약] rejectReservationsOlderThan7Days 스케줄러 실행됨");
		
		int result = reservationService.rejectReservationsOlderThan7Days();
		
		log.debug("7일이 경과해 자동으로 반려처리 된 예약 신청 개수 : {}", result);
	}

	
}
