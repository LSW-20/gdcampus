package com.br.gdcampus.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.br.gdcampus.service.PostService;
import com.br.gdcampus.util.FileUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@RequestMapping("/board/post")
@RequiredArgsConstructor
@Controller
public class PostController {

	@Autowired
	private final PostService postService; 
	private final FileUtil fileUtil;
	
	// 게시글 목록 조회
	@GetMapping("/list")
	public void postList(Model model) {
		
		List<PostDto> list = postService.selectPostList(); 
		model.addAttribute("postList", list);
		
	}
	
	

	// 게시글 상세 페이지
	@GetMapping("/detail") 
	 public void selectPostDetail(String no, Model model) {
		
		PostDto postDto = postService.selectPostDetail(no);
		
		model.addAttribute("p", postDto);
		
	}	
	
	
	@GetMapping("/increase") // 조회수 증가용 (타인의 글일 경우 호출) => /post/detail 재요청
	public String increaseCount(int no) {
		postService.updateIncreaseCount(no);
		return "redirect:/board/post/detail?no=" + no; // 상세페이지로 
	}
	

	
	// 게시글 추가
	@GetMapping("/regist")
	public void registPage() {}
	
	// 게시글 등록 
  	@GetMapping("/insert") 
  	public String regist(PostDto post
  						, List<MultipartFile> uploadFiles
  						, HttpSession session
						, RedirectAttributes rdAttributes) {
  		
  	// post테이블에 insert할 데이터 
  	post.setWriterName( String.valueOf( ((PostDto)session.getAttribute("loginUser")).getUserNo() ) );

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

return "redirect:/board/post/list";

}
  	
	
	// 게시글 댓글목록조회
	@ResponseBody
	@GetMapping(value="/clist", produces="application/json")
	public List<CommentDto> commentList(String no) {
		/* log.debug("no??????? : {}",no); */
		return postService.selectCommentList(no);
		
	}
	
	

	// 게시글 댓글 등록
	
    @PostMapping("/cinsert")
    public String CommentInsert(CommentDto c, HttpSession session) {
    	c.setCommentWriter( String.valueOf( ((CommentDto)session.getAttribute("loginUser")).getUserNo() ) );
		int result = postService.insertComment(c);
		return result > 0 ? "SUCCESS" : "FAIL";
    }
    
	
	
//	@ResponseBody
//	@PostMapping("/cinsert")
//	public String commentInsert(CommentDto c, HttpSession session) {
//		c.setCommentWriter( String.valueOf( ((PostDto)session.getAttribute("loginUser")).getUserNo() ) );
//		int result = postService.insertComment(c);
//		return result > 0 ? "SUCCESS" : "FAIL";
	
}
		