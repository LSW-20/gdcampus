package com.br.gdcampus.service;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.MemberDao;
import com.br.gdcampus.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {
	private final MemberDao memberDao;

	public MemberDto selectMember(MemberDto m) {
		return memberDao.selectMember(m);
	}
	
}
