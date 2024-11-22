package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.gdcampus.dto.WorkStatusDto;
import com.br.gdcampus.service.HoliService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("/holiday")
@RequiredArgsConstructor
@Controller
public class HoliController {
	
	private final HoliService holiService;
	
	@GetMapping("/workstatus.do")
	public void workStatus() {}
	
	
	@ResponseBody
	@GetMapping("/works.do")
	public WorkStatusDto workstatus(@RequestParam("userNo") String userNo) {
		WorkStatusDto status = holiService.selectworkStatus(userNo);
		System.out.println(userNo);
		return status;
		}
		
}
