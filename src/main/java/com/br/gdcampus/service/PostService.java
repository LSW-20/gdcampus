package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;

public interface PostService {
/**
 * 
 *  게시글 기능 관련 작성해두기
 *  @author 박한나
 *  
 */
	
	// 게시글 목록 조회(페이징 처리)
	int selectPostListCount();
	List<PostDto> selectPostList(PageInfoDto pi);
	
	// 게시글 이름으로 키워드 / 부서/직급별 조회 검색조회(페이징처리)
	int selectSearchListCount(Map<String, String> search);
	List<PostDto> selectSerchList(Map<String, String> search, PageInfoDto pi);
	
	// 게시글 등록
	int insertPost(PostDto p);
	
	// 게시글 상세 - 조회수 증가
	int updateIncreaseCount(int postNo);
	
	// 게시글 상세 - 게시글 조회
	PostDto selectPost(int postNo);
	
	// 게시글 좋아요 기능
	// like 좋아요 기능
	
	// 게시글 삭제
	int deletePost(int postNo);
	
	// 게시글 수정
	/*
	 * List<AttachDto> selectDelAttach(String[] delFileNo); int updatePost(PostDto
	 * b, String[] delFileNo);
	 */
	// --------------------------- 댓글 기능관련 -----------------------------------------
	
	
	// 댓글 추가 기능
	
	
	// 게시글 상세 - 게시글 조회
	
	
	// 게시글 삭제
	
	
	// 게시글 수정
	
	
	// 댓글 목록 조회
	
	
	// 댓글 등록
	
	
	// 댓글 완전 삭제 ( 스케줄러에 의해 작동) 
	
}
