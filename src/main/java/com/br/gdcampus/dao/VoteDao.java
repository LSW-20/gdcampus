package com.br.gdcampus.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class VoteDao {

	private final SqlSessionTemplate sqlSession;
	
	public int selectVoteListCount() {
		return sqlSession.selectOne("voteMapper.selectVoteListCount");
	}
	
	/*
	 * 요청한 게시판에 일부데이터만 조회해가야한다
	 * 마이바티스에서 로우바운즈를 일부데이터만 조회할수 있도록 해줌 
	 */
	public list<VoteDto> selectVoteList(PageInfoDto pi){
		
	}
}

