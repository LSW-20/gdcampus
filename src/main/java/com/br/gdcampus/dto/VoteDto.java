package com.br.gdcampus.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 투표관련 DTO
 * @author 박한나
 * 
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class VoteDto {

	private String voteId;			// 투표게시글 고유번호
	private String cteateUser;		// 투표게시글 생성자
	private Date createDate;		// 투표게시글 생성일
	private String voteTitle;		// 투표게시글 제목
	private String voteContent;		// 투표게시글 내용
	private Date voteStart;			// 투표시작일 지정
	private Date voteEnd; 			// 투표종료일 지정
	private Date modifyDate;		// 투표게시글 수정일
	private String modifyUser;		// 투표게시글 수정자
	
		
}
