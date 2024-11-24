package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PostDto;
import com.br.gdcampus.service.PostService;
import com.br.gdcampus.util.FileUtil;

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

	@Autowired
	private final PostService postService; 
	private final FileUtil fileUtil;
	
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
	 * @GetMapping("/detail") public String insertPost(@ModelAttribute StudentDto p,
	 * RedirectAttributes rdAttributes) {
	 * 
	 * int result = postInsert(PostDto p);
	 * 
	 * return null;
	 * 
	 * 
	 * }
	 */ 

	/**
	 * 게시글 상세 페이지
	 * @param no
	 * @param model
	 */
	@GetMapping("/detail") 
	 public void selectPostDetail(String no, Model model) {
		
		PostDto postDto = postService.selectPostDetail(no);
		
		model.addAttribute("postDto", postDto);
		
	}	
	/**
	 * 
	 * 
	 */
	/*
	 * @GetMapping("/수정페이지") public
	 */
	@ResponseBody
	@GetMapping(value="/clist", produces="application/json")
	public List<CommentDto> commentList(int no) {
		return postService.selectCommentList(no);
	}
	
	
}
		