package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@RequestMapping("/approval")
@RequiredArgsConstructor
@Controller
public class ApprovalController {
	
	
	@GetMapping("/todo.do")
	public void todoPage() {}
	
	@GetMapping("/simpleDraft.do")
	public void simpleDraftPage() {}
	
	@GetMapping("/purchaseDraft.do")
	public void purchaseDraftPage() {}
	
	
}
