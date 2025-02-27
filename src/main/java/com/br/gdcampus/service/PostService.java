package com.br.gdcampus.service;

import java.util.List;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;

public interface PostService {

    /**
     * 게시글 기능 관련 작성
     * @author 박한나
     */
	// 게시글 목록 조회
    List<PostDto>selectPostList();
    
    // 게시글 상세 - 게시글 조회
    PostDto selectPostDetail(String postNo);

   // 게시글 상세 - 조회수 증가
 	int updateIncreaseCount(String postNo);
    
    // 게시글 등록
    int insertPost(PostDto p);
    
    // 첨부파일 등록 후 조회
    List<AttachDto> selectAttachList(String no);

    // 게시글 삭제
    int deletePost(String postNo); /*삭제할 글 번호 넘겨 받을거임*/

    // 첨부파일 게시글 삭제
    List<AttachDto> selectDelAttach(String[] delFileNo);
    
    //게시글 수정
    int updatePost(PostDto post, String[] delFileNo);

//=============== 댓글 기능======================
    // 댓글 목록 조회
    List<CommentDto> selectCommentList(String postNo); // 내가 선택할 게시글의 글 번호만 넘겨 받게 하기

    // 댓글 등록
    int insertComment(CommentDto c); /*commet 객체 넘겨 받기*/

    // 댓글 완전 삭제 (스케줄러)
    int deleteCommentCompletely();

	
	
}
