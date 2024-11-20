package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;
import com.br.gdcampus.service.PostService;
import com.br.gdcampus.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

		/**
		 * 게시글 목록 조회 요청
		 */

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class PostController {

	private final PostService postService; 
	private final PagingUtil pageUtil;
	
	
	@GetMapping("/post/list.do")
	public void postList(@RequestParam(value="page", defaultValue="1") int currentPage) {
		
		int listCount = postService.selectPostList();
		
		PageInfoDto pi = pageUtil.getPageInfoDto(listCount, currentPage, 5,5);
		List<PostDto> list = postService.selectPostList(pi);
		
		// 페이징바에 5개씩 보이게 할거임
		// 페이징바에 시작수/마지막 끝수 모든것들이 담겨있는페이지 infodto 필요함
		
		
		}
		  
		
}
		