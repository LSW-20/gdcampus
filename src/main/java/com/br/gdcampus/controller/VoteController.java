package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.VoteDto;
import com.br.gdcampus.service.VoteService;
import com.br.gdcampus.util.PagingUtil;

import ch.qos.logback.core.util.FileUtil;
import lombok.RequiredArgsConstructor;

@RequestMapping("/board/vote")
@RequiredArgsConstructor
@Controller
public class VoteController {
		
	private final VoteService voteService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	// 메뉴바에 있는 메뉴 클릭시 			/vote/list			=> 1번 페이지 요청 
	// 페이징바에 있는 페이지 클릭시  		/vote/list?page=xx	
	/*
	 * page라는 키값으로 요청시 키값이 없을경우 defaltValue="1" 으로 설정한다는 뜻
	 * 사용자가 요청한 페이지수는 커런트 페이지에 이미 담겨있을거고 시의 총 개수 리스트로 조회 했다,
	 * */ 
	
	@GetMapping("/list")
	public void list(@RequestParam(value="page", defaultValue="1")int currentPage){
		
		// 현재게시글의 총 갯수가 몇개인지 궁금
		int listCount = voteService.selectVoteListCount();
		
		// 생성된 객체를 주입 받아야 하기때문에 final로 생성함
		// 페이징 처리가 자주 사용되다 보니까 공통 모듈화 작업 해둔거임
		// 리스트 페이지에서 페이징 
		// 조회할 게시글의 갯수도 담겨있다. 
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5); 
		List<VoteDto> list = voteService.selectVoteList(pi);
		
		
	}
}