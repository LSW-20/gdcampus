package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;

public interface PostService {

    /**
     * 게시글 기능 관련 작성
     * @author 박한나
     */

    // 게시글 목록 조회 (페이징 처리)
    int selectPostList();
    List<PostDto> selectPostList(PageInfoDto pi);
	

    // 게시글 검색 조회 (키워드/부서/직급별 조회 - 페이징 처리)
    int selectSearchListCount(Map<String, String> search);
    List<PostDto> selectSearchList(Map<String, String> search, PageInfoDto pi);

    // 게시글 등록
    int insertPost(PostDto p);

    // 게시글 상세 - 조회수 증가
    int updateIncreaseCount(int postNo);

    // 게시글 상세 - 게시글 조회
    PostDto selectPost(int postNo);

    // 게시글 삭제
    int deletePost(int postNo);

    // 게시글 수정
    List<AttachDto> selectDelAttach(String[] delFileNo);
    int updatePost(PostDto b, String[] delFileNo);

//=============== 댓글 기능======================
    // 댓글 목록 조회
    List<CommentDto> selectCommentList(int postNo);

    // 댓글 등록
    int insertComment(CommentDto c);

    // 댓글 완전 삭제 (스케줄러)
    int deleteCommentCompletely();
}
