package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;
import com.br.gdcampus.util.FileUtil;
import com.br.gdcampus.util.PagingUtil;

import ch.qos.logback.core.model.Model;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
/**
 * 게시글 관련 
 */


@Slf4j
@RequestMapping("/post")
@RequiredArgsConstructor
@Controller
public class PostController {
//
//		private final PostController postController;
//		private final PagingUtil pagingUtil;
//		private final FileUtil fileUtil;
//		
//		// 메뉴바에있는 메뉴 클릭시       /board/list.do    		=> 1번페이지 요청
//		// 페이징바에 있는 페이지 클릭시  /board/list.do?page=xx
//		@GetMapping("/list.do")
//		public void list(@RequestParam(value="page", defaultValue="1") int currentPage
//						, Model model) {
//			
//			int listCount = postService.selectBoardListCount();
//			
//			PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
//			List<PostDto> list = postService.selectBoardList(pi);
//			
//			model.addAttribute("pi", pi);
//			model.addAttribute("list", list);
//			
//			//return "board/list";
//			
//		}		
		
}
