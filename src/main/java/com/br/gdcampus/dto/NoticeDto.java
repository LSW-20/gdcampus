package com.br.gdcampus.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 공지사항관련 dto
 * @author 박한나
 * 
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class NoticeDto {
	
    private String noticeNo;           // 게시글 번호
    private int boardTypeNo;         // 게시판 유형 번호 1공지사항 2 자유게시판 
    private String userNo;           // 사번 : 사용자 번호
    private String userName;           // 사용자 이름
    private String noticeTitle;        // 게시글 제목
    private String noticeContent;      // 게시글 내용
    private Date registDate;         // 등록 날짜
    private String fileStatus;       // 파일 첨부 여부
    private int count;               // 조회수
    private String postTop;          // 상단 고정 여부
    private Date modifyDate;         // 수정 날짜
    private String modifyUser;       // 수정 사용자 번호 
	
    private List<AttachDto> attachList; // has many 관계 
	
}
