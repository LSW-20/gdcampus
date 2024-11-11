package com.br.gdcampus.service;

import com.br.gdcampus.dto.MemberDto;

public interface MemberService {

	//로그인
	MemberDto selectMember(MemberDto m);
}
