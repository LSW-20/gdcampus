package com.br.gdcampus.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.NoticeDto;
import com.br.gdcampus.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class NoticeDao {

	private final SqlSessionTemplate sqlSession;
	
	// 공지사항 목록 조회
	public List<NoticeDto> selectNoticeList(){
		return sqlSession.selectList("noticeMapper.selectNoticeList");
	}
	
	// 공지사항 게시글 번호 조회
	public NoticeDto selectNotice(String noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice",noticeNo);
	}
	
	// 공지사항 게시글 페이지이동 번호
	public List<NoticeDto> selectNoticeList(PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("noticeMapper.selectNoticeList",null, rowBounds);
	}

	// 공지사항 게시글 등록
	public int insertNotice(NoticeDto n) {
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}
	
	// 공지사항 첨부파일 게시글 등록
	public int insertAttach(AttachDto attach) {
		return sqlSession.insert("noticeMapper.insertAttach",attach);
	}

	public NoticeDto selectNoticeDetail(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateNotice(NoticeDto n) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteNotice(String[] deleteNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteAttach(String[] delFileNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<CommentDto> selectCommentList(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public int noticeUpdateIncreaseCount(String noticeNo) {
		return sqlSession.update("noticeMapper.updateIncreaseCount",noticeNo);
	}
		
	
	
	
}
