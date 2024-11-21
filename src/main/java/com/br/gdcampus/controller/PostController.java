package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.gdcampus.dto.PostDto;
import com.br.gdcampus.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
	 * 게시글 목록 조회 요청
	 */

@Slf4j
@RequestMapping("/board/post")
@RequiredArgsConstructor
@Controller
public class PostController {

	private final PostService postService; 
	
	/**
	 * 
	 * 게시글 조회 페이지
	 * @param currentPage
	 * 
	 */
	
	@GetMapping("/list")
	public void postList(Model model) {
		
		
		
		List<PostDto> list = postService.selectPostList(); 
		model.addAttribute("postList", list);
		
		
	}
	/*
	 * @PostMapping("/list/insert") public String insertPost(@ModelAttribute
	 * StudentDto p, RedirectAttributes rdAttributes) {
	 * 
	 * int result = postInsert(PostDto p);
	 * 
	 * return null;
	 * 
	 * 
	 * }
	 */

	
	

	 
		
}
		