package com.br.gdcampus.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PostDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.PostService;
import com.br.gdcampus.util.FileUtil;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/post")
@RequiredArgsConstructor
@Controller
public class PostController {

	private final PostService postService; 
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	
	// 게시글 목록 조회
	@GetMapping("/list")
	public void postList(Model model) {
		
		List<PostDto> list = postService.selectPostList(); 
		model.addAttribute("postList", list);
		
	}
	
	@GetMapping("/increase") // 조회수 증가용 (타인의 글일 경우 호출) => /post/detail 재요청
	public String increaseCount(String no) {
		postService.updateIncreaseCount(no);
		return "redirect:/board/post/detail?no=" + no; // 상세페이지로 
	}
	
	
	// 게시글 상세 페이지
    @GetMapping("/detail")
    public void selectPostDetail(String no, Model model) {
        PostDto postDto = postService.selectPostDetail(no);
        List<CommentDto> commentList = postService.selectCommentList(no);
     
        model.addAttribute("p", postDto);
        model.addAttribute("c", commentList);
        
        // 첨부파일 테이블에서 조회
        List<AttachDto> attachList = postService.selectAttachList(no);
        model.addAttribute("attachList", attachList);
        
    }


	
	
	// 게시글 추가
	@GetMapping("/regist")
	public void registPage() {}
	
	// 게시글 등록 
  	@PostMapping("/insert") 
  	public String regist(PostDto post
  						, List<MultipartFile> uploadFiles
  						, HttpSession session
						, RedirectAttributes rdAttributes) {
  		
	  	// post테이블에 insert할 데이터 
	  	post.setWriterName(String.valueOf( ((UserDto)session.getAttribute("loginUser")).getUserNo() ) );
	  	
		// 첨부파일 업로드 후에 
		// attachment테이블에 insert할 데이터
	 
	  	List<AttachDto> attachList = new ArrayList<>();
	  	for(MultipartFile file : uploadFiles) {
	  		if(file != null && !file.isEmpty()) {
	  			Map<String, String> map = fileUtil.fileupload(file, "post");
	  			attachList.add(AttachDto.builder()
										.filePath(map.get("filePath"))
										.originalName(map.get("originalName"))
										.filesystemName(map.get("filesystemName"))
										.refType("B")
										.build());
				}
		}
	  	
		post.setAttachList(attachList); // 제목,내용,작성자회원번호,첨부파일들정보
		
		
		int result = postService.insertPost(post);
		
		if(attachList.isEmpty() && result == 1 
				|| !attachList.isEmpty() && result == attachList.size()) {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 실패");			
		}
			
		return "redirect:/board/post/regist";
			
	}
  	

    // 게시글 댓글 목록 조회
    @ResponseBody
    @GetMapping(value = "/clist", produces = "application/json")
    public List<CommentDto> commentList(String no) {
        return postService.selectCommentList(no);
    }


    // 게시글 댓글 등록
    @ResponseBody
    @PostMapping("/cinsert")
    public String CommentInsert(CommentDto c, HttpSession session) {
    	c.setUserNo(((UserDto)session.getAttribute("loginUser")).getUserNo());
        c.setCommentWriter(((UserDto)session.getAttribute("loginUser")).getUserId());
        
        int result = postService.insertComment(c);
        return result > 0 ? "SUCCESS" : "FAIL";
    }
    
    //메인페이지 게시글 목록
    @ResponseBody
	@GetMapping("/mainList")
	public List<PostDto> noticeMain() {
		return postService.selectPostList();
	}
}


		