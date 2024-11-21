package com.br.gdcampus.service;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.HoliDao;
import com.br.gdcampus.dao.UserDao;
import com.br.gdcampus.dto.WorkStatusDto;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class HoliServiceImpl implements HoliService {

	private final HoliDao holiDao;
	
	@Override
	public WorkStatusDto selectworkStatus(String userNo) {
		return holiDao.selectworkStatus(userNo);
		
		
	}

}
