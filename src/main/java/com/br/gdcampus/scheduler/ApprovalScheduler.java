package com.br.gdcampus.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.br.gdcampus.service.ApprovalService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j						//로그
@RequiredArgsConstructor	//final필드
@Component					//빈등록
public class ApprovalScheduler {
	
	private final ApprovalService apprService;
	
	//평일 17시30분마다 실행
	@Scheduled(cron="0 30 17 * * 1-5")//초 분 시 일 월 요일
	public void selectTodayApproval() {
		int result = apprService.selectTodayApproval();
		log.debug("오늘 들어온 결재 안건 수 : {}",result);
	}
}
