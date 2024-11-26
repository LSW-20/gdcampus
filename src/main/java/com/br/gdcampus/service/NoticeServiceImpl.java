package com.br.gdcampus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.NoticeDao;
import com.br.gdcampus.dto.NoticeDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	 private final NoticeDao noticeDao;
	 
	@Override
	public List<NoticeDto> selectNoticeList() {
		return noticeDao.selectNoticeList();
	}


	@Override
	public int insertNotice(NoticeDto n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(NoticeDto n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(String[] deleteNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeDto selectNotice(String noticeNo) {
		return noticeDao.selectNotice(noticeNo);
	}

}
