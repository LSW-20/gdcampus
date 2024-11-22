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
    private String userNo;              // 사번 : 사용자 번호
    private String postTitle;        // 게시글 제목
    private String postContent;      // 게시글 내용
    private Date registDate;         // 등록 날짜
    private String fileStatus;      // 파일 첨부 여부
    private int count;               // 조회수
    private String postTop;         // 상단 고정 여부
    private Date modifyDate;         // 수정 날짜
    private String modifyUser;          // 수정 사용자 번호
    
    private List<AttachDto> attachList; // has many 관계 
}
