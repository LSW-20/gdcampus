package com.br.gdcampus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.NoticeDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class NoticeDao {

	private final SqlSessionTemplate sqlSession;
	
	public List<NoticeDto> selectNoticeList(){
		return sqlSession.selectList("noticeMapper.selectNoticeList");
		
	}
}
