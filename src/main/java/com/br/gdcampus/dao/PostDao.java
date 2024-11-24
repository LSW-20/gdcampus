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
	

	public List<PostDto> selectPostList(){
		return sqlSession.selectList("postMapper.selectPostList");
	}
	
	
	public PostDto selectPostDetail(String postNo) {
		return sqlSession.selectOne("postMapper.selectPostDetail", postNo);
	}


	public List<CommentDto> selectCommentList(int postNo) {
		return sqlSession.selectOne("postMapper.selectCommentList", postNo);
	}


	public int insertComment(CommentDto c) {
		return sqlSession.insert("postMapper.insertComment",c);
	}

	public int insertAttach(AttachDto at) {
		return sqlSession.insert("postMapper.insertAttach", at);
	} 
	

	public int updatePost(PostDto p) {
		return sqlSession.update("postMapper.updateComment", p);
	}


	public int deleteAttach(String[] delFileNo) {
		return sqlSession.delete("postMapper.deleteAttach", delFileNo);
	}



	
	

}
