package com.br.gdcampus.service;

import java.util.List;

import com.br.gdcampus.dto.NoticeDto;

/**
 *  공지사항 관련
 *  @author 박한나
 * 
 */

public interface NoticeService {
	
	// 공지사항 목록조회 
	List<NoticeDto> selectNoticeList();
	
	// 공지사항 상단고정
	//?
	
	// 번호로 공지사항 한개 조회 
	NoticeDto selectNoticeByNo(int noticeNo);
	
	// 공지사항 등록
	int insertNotice(NoticeDto n);
	
	// 공지사항 수정 
	int updateNotice(NoticeDto n);
	
	// 다수의 번호들 가지고 공지사항 일괄삭제 
	int deleteNotice(String[] deleteNo);
	
	// 공지사항 숨기기 (일반게시글로 이동)
	

	
}
