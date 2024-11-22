package com.br.gdcampus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@Transactional
	@PostMapping("/insertStu")
	public String insertStu(@ModelAttribute StudentDto s, RedirectAttributes rdAttributes) {
		
		int result = 0;
		
		try {
	        result = stuService.insertStu(s);
	    } catch (Exception e) {
	        // 예외 처리: 에러 발생 시 리다이렉트하면서 에러 메시지 전달
	        rdAttributes.addFlashAttribute("alertMsg", "오류, 정확한 값을 입력해주세요.");
	        return "redirect:/student/student.do"; // 리다이렉트
	    }
		 
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 저장되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg","수정사항 저장에 실패하였습니다.");
		}
		return "redirect:/student/student.do";
	}
	
	/**
	 * 학생수정
	 */
	@Transactional
	@PostMapping("/updateStu")
	public String updateStu(@ModelAttribute StudentDto s, RedirectAttributes rdAttributes) {
		
		int result = 0;
		
		try {
	        result = stuService.updateStu(s);
	    } catch (Exception e) {
	        // 예외 처리: 에러 발생 시 리다이렉트하면서 에러 메시지 전달
	        rdAttributes.addFlashAttribute("alertMsg", "오류가났습니다 정확한 값을 입력해주세요.");
	        return "redirect:/student/student.do"; // 리다이렉트
	    }
		 
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 저장되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg","수정사항 저장에 실패하였습니다.");
		}
		return "redirect:/student/student.do";
	}
	
	/**
	 * 학생삭제
	 */
	@Transactional
	@PostMapping("/deleteStu")
	public String deleteStu(int stuNo, RedirectAttributes rdAttributes) {
		
		System.out.println(stuNo);
		int result = 0;
		
		try {
	        result = stuService.deleteStu(stuNo);
	    } catch (Exception e) {
	        // 예외 처리: 에러 발생 시 리다이렉트하면서 에러 메시지 전달
	        rdAttributes.addFlashAttribute("alertMsg", "오류가났습니다 정확한 값을 입력해주세요.");
	        return "redirect:/student/student.do"; // 리다이렉트
	    }
		 
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg","성공적으로 저장되었습니다.");
		}else {
			rdAttributes.addFlashAttribute("alertMsg","수정사항 저장에 실패하였습니다.");
		}
		return "redirect:/student/student.do";
	}
	
	/**
	 * 학생여러행삭제
	 */
	@PostMapping("/deleteStus")
	@ResponseBody
	public Map<String, Object> deleteRanks(@RequestBody List<Integer> stuNos) {
	    Map<String, Object> response = new HashMap<>();
	    System.out.println("controller"+stuNos);
	    try {
	        boolean isDeleted = stuService.deleteStus(stuNos);
	        if (isDeleted) {
	            response.put("success", true);
	            response.put("message", "선택한 행이 삭제되었습니다.");
	        } else {
	            response.put("success", false);
	            response.put("message", "삭제 실패.");
	        }
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "삭제 중 오류 발생.");
	        e.printStackTrace();
	    }
	    return response;
	}
}
