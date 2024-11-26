package com.br.gdcampus.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.NoticeDto;
import com.br.gdcampus.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class NoticeDao {

	private final SqlSessionTemplate sqlSession;
	
	// 공지사항 목록 조회
	public List<NoticeDto> selectNoticeList(){
		return sqlSession.selectList("noticeMapper.selectNoticeListCount");
		
	}
	
	public NoticeDto selectNotice(String noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice",noticeNo);
	}
	
	public List<NoticeDto> selectNoticeList(PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("noticeMapper.selectNoticeList",null, rowBounds);
	}

	public int insertNotice(NoticeDto n) {
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}

	public int insertAttach(AttachDto attach) {
		return sqlSession.insert("noticeMapper.insertAttach",attach);
	}

	
}
