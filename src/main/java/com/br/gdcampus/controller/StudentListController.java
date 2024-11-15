package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.StudentDto;
import com.br.gdcampus.service.StudentService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/student")
@RequiredArgsConstructor
@Controller
public class StudentListController {

	private final StudentService stuService;
	
	/**
	 * 학적조회페이지
	 * 박정언
	 */
	@GetMapping("/student.do")
	public void student(Model model) { 
		List<StudentDto> stuList =  stuService.selectStu();
		model.addAttribute("stuList", stuList);
	}
	
	/**
	 * 학생추가
	 */
	@PostMapping("/insertStu")
	public String insertStu(StudentDto s, RedirectAttributes rdAttributes) {
		
		int result = stuService.insertStu(s);

		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 저장되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg","수정사항 저장에 실패하였습니다.");
		}
		return "redirect:/student";
	}
}
