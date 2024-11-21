package com.br.gdcampus.service;

import com.br.gdcampus.dto.WorkStatusDto;

public interface HoliService {
		
	WorkStatusDto selectworkStatus(String userNo);
	
}
