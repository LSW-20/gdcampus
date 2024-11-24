package com.br.gdcampus.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.gdcampus.dao.NoticeDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/notice")
@RequiredArgsConstructor
@Controller
public class NoticeController {
	
	@GetMapping("list")
	public void noticeList() {
		List<NoticeDao> list = NoticeService.selectNoticeList();
		log.debug("list:{}", list);
		model.addAttribute("list", list);
		
	}
	
}
