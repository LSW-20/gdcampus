
package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.gdcampus.dto.NoticeDto;
import com.br.gdcampus.service.NoticeService;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/notice")
@RequiredArgsConstructor
@Controller
public class NoticeController {

	private final NoticeService noticeService;
 
    
	@GetMapping("/list")
	public void noticeList(Model model) {
		List<NoticeDto> list = noticeService.selectNoticeList();
		model.addAttribute("noticeList", list);

	}
	
	@GetMapping("/detail")
	public void noticeDetail(String no, Model model) {
		NoticeDto n = noticeService.selectNotice(no);
		model.addAttribute("noticeDetail", n);
		log.debug("notice????!?!??:{}",n);
	}
	
	
	
	@ResponseBody
	@GetMapping("/mainList")
	public List<NoticeDto> noticeMain() {
		System.out.println("컨트롤러: " + noticeService.selectNoticeList());
		return noticeService.selectNoticeList();
	}
	
	
	
	
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
