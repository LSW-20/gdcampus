package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.PostDto;
import com.br.gdcampus.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
/**
 *  post 게시글 관련 메소드
 *  
 *   @author 박한나
 *   
 */


@Slf4j
@RequestMapping("/post")
@RequiredArgsConstructor
@Controller
public class PostController {
	
//	private final PostService postService;
//	
	// 페이지 라는 변수에 담아두기 > 
	// 메뉴바에 있는 메뉴클릭시 /board/list
	// 페이징바에 있는 페이지 클릭시 /board/list.do?page=xx
/*	@RestController
	@GetMapping("/list.do") // url 매핑값이랑 같으면 굳이 써줄필요없다.
	public void list(@RequestParam(value="page", defaultValue="1") int currentPage // 넘어온 데이터가 없고 폼에도 데이터 없으면 400 에러가 뜸
			, Model model) {
	// 사용자가 몇번페이지를 클릭할지 모르니까 얼른 설정 해준거고
		
		// 해당 메소드를 호출하면 
	int listCount = postService.selectPostListCount();
	
	PageInfoDto pi = PagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
	List<PostDto> list = PostService.selectPostList(pi);
	
	model.addAttribute("pi", pi);
	model.addAttribute("list", list);
	*/
	//return "board/list";

	
	
}
