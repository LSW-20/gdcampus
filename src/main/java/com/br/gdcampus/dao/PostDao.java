package com.br.gdcampus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PostDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class PostDao {
	
	@Autowired
	private final SqlSessionTemplate sqlSession;
	

	public int deleteCommentCompletely;
	
	// 게시글 목록
	public List<PostDto>selectPostList(){
		return sqlSession.selectList("postMapper.selectPostList");
	}
	
	// 게시글 등록
	public int insertPost(PostDto p) {
		return sqlSession.insert("postMapper.insertPost", p);
	}

	// 첨부파일 등록
		public int insertAttach(AttachDto at) {
			return sqlSession.insert("postMapper.insertAttach", at);
		} 
	
	// 게시글 상세페이지
	public PostDto selectPostDetail(String postNo) {
		return sqlSession.selectOne("postMapper.selectPostDetail", postNo);
	}

	// 게시글 상세 페이지(조회수)
	public int updateIncreaseCount(String postNo) {
		return sqlSession.update("postMapper.updateIncreaseCount",postNo);
	}


	// 댓글 목록 조회
	
	public List<CommentDto> selectCommentList(String postNo) {
		return sqlSession.selectList("postMapper.selectCommentList", postNo);
	}

	// 댓글 등록
	public int insertComment(CommentDto c) {
		return sqlSession.insert("postMapper.insertComment",c);
	}
	
	
	// 게시글 수정
	public int updatePost(PostDto p) {
		return sqlSession.update("postMapper.updateComment", p);
	}

	// 게시글 삭제
	public int deleteAttach(String[] delFileNo) {
		return sqlSession.delete("postMapper.deleteAttach", delFileNo);
	}

	public List<AttachDto> selectAttachList(String no) {
		return sqlSession.selectList("postMapper.selectAttachList", no);
	}

	



	
	

}
