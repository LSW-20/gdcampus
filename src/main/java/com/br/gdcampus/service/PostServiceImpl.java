package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.PostDao;
import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService {
	
	private final PostDao postDao;
	
	@Override
	public int test(int num1, int num2) {
		return postDao.test(num1,num2);
	}
	@Override
	public int selectPostList() {
		return 0;
	}
	
	@Override
	public List<PostDto> selectPostList(PageInfoDto pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectSearchListCount(Map<String, String> search) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PostDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		// TODO Auto-generated method stub
		return null;
	}

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
	public PostDto selectPost(int postNo) {
		// TODO Auto-generated method stub
		return null;
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
