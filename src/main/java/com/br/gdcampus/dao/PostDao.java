package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class PostDao {
	
	private final SqlSessionTemplate sqlSession;
	
	public int test2(){
		return sqlSession.selectOne("postMapper.test2");
	}	
	
	public int test(int num1, int num2) {
		return num1+num2;
	}
	
	public int selectPostListCount() {
		return sqlSession.selectOne("postMapper.selectPostListCount");
	}

	public List<PostDto> selectPostList(PageInfoDto pi){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getPageLimit() , pi.getPageLimit());
		return sqlSession.selectList("postMapper.selectPostList", null, rowBounds);
	}
	
	public int selectSearchListCount(Map<String, String> search) {
		return sqlSession.selectOne("postMapper.selectSearchListCount", search);
	}
	
	public List<PostDto> selectSearchList(Map<String, String> search, PageInfoDto pi){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getPageLimit() , pi.getPageLimit());
		return sqlSession.selectList("postMapper.selectSearchList", search, rowBounds);
	}
	
	public int insertPost(PostDto b) {
		return sqlSession.insert("postMapper.insertPost", b);
	}
	

	 public int insertAttach(AttachDto at) { 
		 return sqlSession.insert("postMapper.insertAttach", at); 
	 }

	
	public PostDto selectPost(int postNo) {
		return sqlSession.selectOne("postMapper.selectPost", postNo);
	}
	
	public int updateIncreaseCount(int postNo) {
		return sqlSession.update("postMapper.updateIncreaseCount", postNo);
	}


}
