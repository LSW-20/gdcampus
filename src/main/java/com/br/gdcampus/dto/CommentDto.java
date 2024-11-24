package com.br.gdcampus.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 댓글 관련 dto 
 * @author 박한나
 * 
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class CommentDto {

	
	private int commentNo;			// 댓글번호
	private String userNo;			// 사번
	private String postNo;			// 참조게시글번호
	private String commenterId;		// 댓글작성자아이디
	private String writerCommenter;		// 댓글작성자이름
	private int refCommentNo;		// 이 댓글이 어떤 댓글에 달릴건지/ 원글일 경우 0
	private Date registDate;		// 댓글 작성 날짜
	private String comment;			// 댓글내용
	private Date modifyDate;		// 댓글 수정일
	private int level;				// 댓글 뎁스
	
}
