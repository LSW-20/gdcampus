package com.br.gdcampus.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public PostDto selectPostDetail(String postNo) {
		return postDao.selectPostDetail(postNo);
	}
	
	/*
	 * public List<PostDto> selectSearchList(Map<String, String>search,PageInfoDto
	 * pi) { }
	 */
	 
	@Override
	public int updateIncreaseCount(String postNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int insertPost(PostDto p) {
		// TODO Auto-generated method stub
		return 0;
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

	

	// 댓글 목록 조회
	@Override
	public List<CommentDto> selectCommentList(String postNo) {

		return postDao.selectCommentList(postNo);
	}
	
	// 댓글 등록 
	@Override
	public int insertComment(CommentDto c) {
		return postDao.insertComment(c);
	}

	
	@Transactional
	@Override
	public int updatePost(PostDto p, String[] delFileNo) {
		
		// 1) board테이블에 update
		int result1 = postDao.updatePost(p);
		
		// 2) attachment테이블에 delete
		int result2 = 1;
		if(result1 > 0 && delFileNo != null) {
			result2 = postDao.deleteAttach(delFileNo);
		}
		
		// 3) attachment테이블에 insert
		List<AttachDto> list = p.getAttachList();
		int result3 = 0;
		for(AttachDto at : list) {
			result3 += postDao.insertAttach(at);
		}
		
		
		// 성공에 대한 조건
		// result1이 1이여야됨
		// result2가 0보다 커야됨
		// result3가 list의 사이즈와 동일
		
		return result1 == 1
					&& result2 > 0
						&& result3 == list.size()
							? 1 : -1;
		
		
	}

	@Override
	public int deleteCommentCompletely() {
		// TODO Auto-generated method stub
		return postDao.deleteCommentCompletely;
	}

	

	


}
