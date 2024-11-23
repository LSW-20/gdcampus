package com.br.gdcampus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.PostDao;
import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PostDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService {
	
	private final PostDao postDao;


	@Override
	public List<PostDto> selectPostList() {
		return postDao.selectPostList();
	}

	/*
	 * @Override public List<PostDto> selectSearchList(Map<String, String> search,
	 * PageInfoDto pi) { // TODO Auto-generated method stub return null; }
	 */

	@Override
	public int insertPost(PostDto p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateIncreaseCount(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PostDto selectPostDetail(int postNo) {
		return postDao.selectPostDetail(postNo);
	}

	@Override
	public int deletePost(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePost(PostDto b, String[] delFileNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommentDto> selectCommentList(int postNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertComment(CommentDto c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCommentCompletely() {
		// TODO Auto-generated method stub
		return 0;
	}



}
