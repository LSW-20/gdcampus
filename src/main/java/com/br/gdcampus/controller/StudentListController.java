package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.RequiredArgsConstructor;
@RequestMapping("/student")
@RequiredArgsConstructor
@Controller
public class StudentListController {

	@GetMapping("/student.do")
	public void student() { 
	}
}
