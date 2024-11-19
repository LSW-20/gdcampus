package com.br.gdcampus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@RequestMapping("/Board")
@RequiredArgsConstructor
@Controller
public class PostController {
	
		private final PostService postService; 
		
		
		@GetMapping("/post/list.do")
		public void postList(Model model) {
			
			List<PostDto> postList =  postService.selectPostList(null);
			
			
			Map<String, Object> map = new HashMap<>();
		    map.put("postist", postList);
		    
		    model.addAllAttributes(map);
		    
		   
		}
}
		