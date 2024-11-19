package com.br.gdcampus.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * 게시글 / 공지사항 관련 dto 
 * 
 * @author 박한나
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class PostDto {

    private String postNo;           // 게시글 번호
    private int boardTypeNo;         // 게시판 유형 번호
    private int userNo;              // 사번 : 사용자 번호
    private String postTitle;        // 게시글 제목
    private String postContent;      // 게시글 내용
    private Date registDate;         // 등록 날짜
    private boolean fileStatus;      // 파일 첨부 여부
    private int count;               // 조회수
    private boolean postTop;         // 상단 고정 여부
    private Date modifyDate;         // 수정 날짜
    private int modifyUser;          // 수정 사용자 번호
    
    
}
