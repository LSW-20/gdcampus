package com.br.gdcampus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.PostDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class PostDao {
	
	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public List<PostDto> selectPostList(){
		return sqlSession.selectList("postMapper.selectPostList");
	}
	
	@Override
	public PostDto selectPostDetail(int postNo) {
		return sqlSession.selectOne("PostMapper.selectPostDetail", postNo);
	} 
	

}
