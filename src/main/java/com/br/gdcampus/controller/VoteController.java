/*
package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.gdcampus.service.PostService;
import com.br.gdcampus.util.FileUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

public class VoteController {

	@Slf4j
	@RequestMapping("/board/vote")
	@RequiredArgsConstructor
	@Controller
	public class PostController {

		@Autowired
		private final PostService postService; 
		private final FileUtil fileUtil;
		
		// 게시글 목록 조회
		@GetMapping("/vlist")
		public void postList(Model model) {
			
			List<voteDto> list = postService.selectVoteList(); 
			model.addAttribute("voteList", list);
			
		}
}
*/