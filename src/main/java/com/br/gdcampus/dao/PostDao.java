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


	

	// 첨부파일 포함 게시글 삭제
	public int deleteAttach(String[] delFileNo) {
		return sqlSession.delete("postMapper.deleteAttach", delFileNo);
	}

	// 첨부파일 목록 조회
	public List<AttachDto> selectAttachList(String no) {
		return sqlSession.selectList("postMapper.selectAttachList", no);
	}
	
	// 게시글 수정
		public int updatePost(PostDto postDto) {
			return sqlSession.update("postMapper.updatePost", postDto);
		}
		
	
	// 게시글 삭제
	public int deletePost(String postNo) {
		return sqlSession.delete("postMapper.deletePost", postNo);
	}
	
	

	//----------------- 댓글 관련 Dao -------------------------
	
	// 댓글 목록 조회
	public List<CommentDto> selectCommentList(String postNo) {
		return sqlSession.selectList("postMapper.selectCommentList", postNo);
	}

	// 댓글 등록
	public int insertComment(CommentDto c) {
		return sqlSession.insert("postMapper.insertComment",c);
	}
	
	
	// 댓글 수정
	public int updateCommentPost(PostDto p) {
		return sqlSession.update("postMapper.updateComment", p);
	}
	
	// 댓글 삭제
	public int deleteCommentCompletely() {
		return 0;
	}

	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		return sqlSession.selectList("postMapper.selectDelAttach", delFileNo);
	}
	


	
	

}
