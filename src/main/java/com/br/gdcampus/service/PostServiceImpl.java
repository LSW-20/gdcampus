package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dao.PostDao;
import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;

public class PostServiceImpl implements PostService {

	@Override
	public int selectPostListCount() {
		return PostDao.selectPostListCount();
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
	public List<PostDto> selectSerchList(Map<String, String> search, PageInfoDto pi) {
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
	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePost(PostDto p, String[] delFileNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePost(PostDto b, String[] delFileNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePost(PostDto b, String[] delFileNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectPostListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PostDto> selectPostList(PageInfoDto pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deletePost(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
