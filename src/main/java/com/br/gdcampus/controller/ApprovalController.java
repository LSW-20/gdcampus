package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.gdcampus.util.PagingUtil;

import lombok.RequiredArgsConstructor;

@RequestMapping("/approval")
@RequiredArgsConstructor
@Controller
public class ApprovalController {
//	private final 
	private final PagingUtil pagingUtil;
	
	//결재대기함 list 단순 페이지요청
	@GetMapping("/todo.do")
	public void todoPage() {}
	
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
