package com.br.gdcampus.controller;

import java.util.List;

import com.br.gdcampus.dao.NoticeDao;
import com.br.gdcampus.dto.NoticeDto;
import com.br.gdcampus.service.NoticeService;

public class noticeService implements NoticeService {

	@Override
	public List<NoticeDao> selectNoticeList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeDto selectNoticeByNo(int noticeNo) {
		// TODO Auto-generated method stub
		return null;
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

}
