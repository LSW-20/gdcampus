package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.br.gdcampus.dto.ApprovalDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.ApprovalService;
import com.br.gdcampus.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequestMapping("/approval")
@RequiredArgsConstructor
@Controller
public class ApprovalController {
	private final ApprovalService apprService;
	private final PagingUtil pagingUtil;
	
	//결재대기함 list 단순 페이지요청
	@GetMapping("/todo.do")
	public void todoPage(@RequestParam(value="page",defaultValue="1") int currentPage
							, Model model
							, HttpSession session) {
		int listCount = apprService.selectApprTodoListCount();
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<ApprovalDto> apprList = apprService.selectApprTodoList(pi, userNo);
		
		model.addAttribute("pi",pi);
		model.addAttribute("apprList",apprList);
	}
	
	//기안서페이지 단순 페이지요청
	@GetMapping("/simpleDraft.do")
	public void simpleDraftPage() {}
	
	//품의서 단순 페이지요청
	@GetMapping("/purchaseDraft.do")
	public void purchaseDraftPage() {}
	
	//작성페이지 요청
	@GetMapping("/regist.do")
	public void registPage() {}
	

	
	
}
