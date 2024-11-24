package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.gdcampus.dto.NoticeDto;
import com.br.gdcampus.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/notice")
@RequiredArgsConstructor
@Controller 
public class NoticeController {
  
	@Autowired
	private final NoticeService noticeService; 
	
  @GetMapping("/list") 
  public void noticeList(Model model){ 
	  List<NoticeDto> list = noticeService.selectNoticeList(); 
	  model.addAttribute("noticeList", list);
  
  }
  
  
 }
 