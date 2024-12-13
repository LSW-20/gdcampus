package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dao.VoteDao;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.VoteDto;

public class VoteServiceImpl implements VoteService {

	private final VoteDao voteDao;

	@Override
	public int selectVoteListCount() {
		
		return voteDao.selectVoteListCount();
	}

	@Override
	public List<VoteDto> selectVoteList(PageInfoDto pi) {
		return voteDao.selectVoteList(pi);
	}

	@Override
	public int selectSearchListCount(Map<String, String> search) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<VoteDto> selectSearchListCount(Map<String, String> search, PageInfoDto pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertVote(VoteDto v) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateIncreaseCount(int voteId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public VoteDto selectVote(int voteId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VoteDto selectVoteById(String voteId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteVote(int voteId) {
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
	
	
}
