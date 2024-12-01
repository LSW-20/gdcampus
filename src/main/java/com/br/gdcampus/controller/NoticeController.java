
package com.br.gdcampus.controller;

import java.io.File;
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
import com.br.gdcampus.dto.NoticeDto;
import com.br.gdcampus.dto.PostDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.NoticeService;
import com.br.gdcampus.service.PostService;
import com.br.gdcampus.util.FileUtil;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/notice")
@RequiredArgsConstructor
@Controller
public class NoticeController {

	private final NoticeService noticeService;
	private final PostService postService; 
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
//	  //메인페이지 게시글 목록
//    @ResponseBody
//	@GetMapping("/noticeMainList")
//	public List<NoticeDto> noticeMain() {
//		return noticeService.selectNoticeList();
//	}
    
    // 공지사항 목록 조회
	@GetMapping("/list")
	public void noticeList(Model model) {
		
		List<NoticeDto> list = noticeService.selectNoticeList();
		model.addAttribute("noticeList", list);
	}
	
	// 공지사항 게시글 조회수 증가
		@GetMapping("/increase") // 조회수 증가용 (타인의 글일 경우 호출) => /post/detail 재요청
		public String increaseCount(String no) {
		noticeService.noticeUpdateIncreaseCount(no);
			return "redirect:/board/notice/detail?no=" + no; // 상세페이지로 
		}
	
	// 공지사항 상세 페이지
	@GetMapping("/detail")
    public void selectNoticeDetail(String no, Model model) {
        PostDto postDto = postService.selectPostDetail(no);
        List<CommentDto> commentList = postService.selectCommentList(no);
     
        model.addAttribute("n", postDto);
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
	  	public String regist(NoticeDto notice
	  						, List<MultipartFile> uploadFiles
	  						, HttpSession session
							, RedirectAttributes rdAttributes) {
	  		
		  	// post테이블에 insert할 데이터 
	  		notice.setUserNo(String.valueOf( ((UserDto)session.getAttribute("loginUser")).getUserNo() ) );
		  	
			// 첨부파일 업로드 후에 
			// attachment테이블에 insert할 데이터
		 
		  	List<AttachDto> attachList = new ArrayList<>();
		  	for(MultipartFile file : uploadFiles) {
		  		if(file != null && !file.isEmpty()) {
		  			Map<String, String> map = fileUtil.fileupload(file, "notice");
		  			attachList.add(AttachDto.builder()
											.filePath(map.get("filePath"))
											.originalName(map.get("originalName"))
											.filesystemName(map.get("filesystemName"))
											.refType("B")
											.build());
				}
			}
		  	
		  	notice.setAttachList(attachList); // 제목,내용,작성자회원번호,첨부파일들정보
			
			
			int result = noticeService.insertNotice(notice);
			
			if(attachList.isEmpty() && result == 1 
					|| !attachList.isEmpty() && result == attachList.size()) {
				rdAttributes.addFlashAttribute("alertMsg", "공지사항 등록 성공");
			}else {
				rdAttributes.addFlashAttribute("alertMsg", "공지사항 등록 실패");			
			}
				
			return "redirect:/board/notice/list";
				
		}
	  	
		 // 게시글 삭제
		
		  @PostMapping("/delete") 
		  public String remove(String no, RedirectAttributes rdAttributes) { 
			  int result = noticeService.deleteNotice(no);
		  
		  if(result > 0) { rdAttributes.addFlashAttribute("alertMsg","성공적으로 삭제되었습니다."); }
		  else { rdAttributes.addFlashAttribute("alertMsg",
		  "게시글 삭제에 실패하였습니다."); }
		  
		  return "redirect:/board/notice/list"; }
		 		
	  	
	  
	  	// 게시글 수정하기
		@PostMapping("/modify")
		public void modifyPage(String no, Model model) {
			model.addAttribute("notice", noticeService.selectNoticeDetail(no));
		}
		
		// 첨부파일 게시글 수정 하기
		@PostMapping("/update")
		public String modify(NoticeDto n 		// 번호,제목,내용
						   , String[] delFileNo   // null | 삭제할첨부파일번호들
						   , List<MultipartFile> uploadFiles // 새로넘어온첨부파일들
						   , RedirectAttributes rdAttributes ) {
			
			/*
			 * log.debug("수정할p : {}",p); log.debug("수정할delFileNo : {}",delFileNo);
			 * log.debug("수정할uploadFiles : {}",uploadFiles);
			 */
			// 후에 db에 반영 성공시 삭제할 파일들 삭제 위해 미리 조회
			List<AttachDto> delAttachList = noticeService.selectDelAttach(delFileNo);
			
			List<AttachDto> attachList = new ArrayList<>();
			for(MultipartFile file : uploadFiles) {
				if(file != null && !file.isEmpty()) {
					Map<String, String> map = fileUtil.fileupload(file, "notice");
					attachList.add(AttachDto.builder()
											.filePath(map.get("filePath"))
											.originalName(map.get("originalName"))
											.filesystemName(map.get("filesystemName"))
											.refType("B")
											.postNo(n.getNoticeNo())
											.build());	
				}
			}
			n.setAttachList(attachList);
			
			int result = noticeService.updateNotice(n);
			
			if(result > 0) { // 성공
				rdAttributes.addFlashAttribute("alertMsg", "성공적으로 수정되었습니다.");
				for(AttachDto a : delAttachList) {
					new File(a.getFilePath() + "/" + a.getFilesystemName()).delete();
				}
			}else { // 실패
				rdAttributes.addFlashAttribute("alertMsg", "게시글 수정에 실패했습니다.");
			}
			
			return "redirect:/board/notice/detail?no=" + n.getNoticeNo();
			
		}
	  	
	  	
		/*
		 * // ---------------------------- 댓글
		 * --------------------------------------------
		 * 
		 * // 게시글 댓글 목록
		 * 
		 * @ResponseBody
		 * 
		 * @GetMapping(value = "/clist", produces = "application/json") public
		 * List<CommentDto> commentList(String no) { return
		 * noticeService.selectCommentList(no); }
		 * 
		 * 
		 * // 게시글 댓글 등록
		 * 
		 * @ResponseBody
		 * 
		 * @PostMapping("/cinsert") public String CommentInsert(CommentDto c,
		 * HttpSession session) {
		 * c.setUserNo(((UserDto)session.getAttribute("loginUser")).getUserNo());
		 * c.setCommentWriter(((UserDto)session.getAttribute("loginUser")).getUserId());
		 * 
		 * int result = noticeService.selectCommentList(no); return result > 0 ?
		 * "SUCCESS" : "FAIL"; }
		 * 
		 * 
		 * 
		 * 
		 * }
		 * 
		 * 
		 */

	
	
	
//  @GetMapping("/list")
//	public void list(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
//		
//		List<NoticeDto> listCount = noticeService.selectNoticeListCount();
//		
//		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
//		List<NoticeDto> list = noticeService.selectNoticeListCount();
//		
//		model.addAttribute("pi",pi);
//		model.addAttribute("list",list);
//
//	}
//
//	@PostMapping("/insert")
//	public String regist(NoticeDto n, List<MultipartFile> uploadFiles, HttpSession session
//						,RedirectAttributes rdAttribute) {
//		
//		n.setNoticeWriter(String.valueOf( ((MemberDto)session.getAttribute("loginUser")).getUserNo()));
//		
//		// 첨부파일 업로드 후에
//		List<AttachmentDto> attachList = new ArrayList<>();
//		for(MultipartFile file: uploadFiles) {
//			if(file != null && !file.isEmpty()) {
//				Map<String, String> map = fileUtil.fileupload(file, "notice");
//				attachList.add(AttachmentDto.builder()
//											.filePath(map.get("filePath"))
//											.originalName(map.get("originalName"))
//											.filesystemName(map.get("filesystemName"))
//											.refType("N")
//											.build());		
//			}
//		}
//		n.setAttachList(attachList); // 제목,내용,작성자회원번호,첨부파일들정보
//		
//		int result = noticeService.insertNotice(n);
//		
//		if(attachList.isEmpty() && result ==1 
//				|| !attachList.isEmpty() && result == attachList.size()) {
//			rdAttribute.addFlashAttribute("alertMsg","공지 등록 성공");
//		}else {
//			rdAttribute.addFlashAttribute("alertMsg","공지 등록 실패");
//		}
//		
//		return "redirect:/notice/list";
//	}

}
