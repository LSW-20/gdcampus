package com.br.gdcampus.service;

import com.br.gdcampus.dto.CommuteDto;

public interface CommuteService {
	
	 int insertCheckIn(String userNo, String userName);
	 int updateCheckOut(String userNo);
}
