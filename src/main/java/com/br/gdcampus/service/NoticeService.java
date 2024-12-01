package com.br.gdcampus.service;

import java.util.List;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.NoticeDto;

/**
 *  공지사항 관련
 *  @author 박한나
 * 
 */

public interface NoticeService {
	
	// 공지사항 목록조회 
	List<NoticeDto> selectNoticeList();
	
	// 공지사항 상단고정용(
	NoticeDto selectNotice(String no); 

	// 공지사항 등록
	int insertNotice(NoticeDto n);
	
	// 공지사항 수정 
	int updateNotice(NoticeDto n);
	
	// 다수의 번호들 가지고 공지사항 일괄삭제 
	int deleteNotice(String[] deleteNo);

	// 공지사항 게시글 상세 - 게시글 조회
	NoticeDto selectNoticeDetail(String no);

	// 공지사항 수정
	int updatePost(NoticeDto n, String[] delFileNo);
	
	// 공지사항 삭제
	List<AttachDto> selectDelAttach(String[] delFileNo);
	
	// 공지사항 댓글조회기능
	List<CommentDto> selectCommentList(String no);

	int noticeUpdateIncreaseCount(String no);

	List<AttachDto> selectAttachList(String no);

	int deleteNotice(String no);

	

	

	
}
