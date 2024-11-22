package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.DeptDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.DeptService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class DeptController {

	 private final DeptService deptService;
 
    // 부서 목록 조회
    @GetMapping("/dept/list")
    public String listDept(Model model) {
        List<DeptDto> deptList = deptService.selectCategoryDeptDto();
        model.addAttribute("deptList", deptList);
        return "/board/dept/list"; 
    }
    
    /*
    // 부서 목록 조회
    @GetMapping("/dept/list")
    public void listDept(Model model) {
        List<DeptDto> deptList = deptService.selectCategoryDeptDto();
        model.addAttribute("deptList", deptList);
    }
    */

    
    // 부서 추가
    @PostMapping("/dept/add")
    public String insertCategoryDept(String deptName, HttpSession session, RedirectAttributes ra) {
    	
        log.info("추가한 부서 이름: {}", deptName); // 확인용 콘솔 출력 
        System.out.println("추가한 부서 이름: " + deptName); // 확인용 콘솔 출력
    	
    	DeptDto deptDto = new DeptDto(); // (1) DeptDto 객체 생성
    	deptDto.setDeptName(deptName); // (2) deptDto에 부서 이름 담았음.
    	
    	UserDto loginUser = (UserDto)session.getAttribute("loginUser"); // 세션에서 로그인한 UserDto를 가져온다.
    	String userName = loginUser.getUserName();
    	// String userName = ((UserDto)session.getAttribute("loginUser")).getUserName(); // 로그인한 유저 이름	
    	// String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();  // 로그인한 유저의 사번
    	
    	deptDto.setCreateUser(userName); // (3) deptDto에 로그인한 유저 이름 담았음.

    	///////////////
    	
    	int result = deptService.insertCategoryDept(deptDto);
    	
    	if(result > 0) { // 쿼리 성공시
    		ra.addFlashAttribute("alertMsg", "성공적으로 부서가 추가되었습니다."); // header에서 alertMsg를 띄워주는 구문이 있음.
    		return "redirect:/board/dept/list"; // 부서 관리 페이지로 리다이렉트.
    		
    	}else { // 실패시
    		ra.addFlashAttribute("alertMsg", "부서 추가에 실패하였습니다.");
    		return "redirect:/"; // 메인페이지로 리다이렉트.
    	}
    	
       
        
    }

    // 부서 수정
    @PostMapping("/dept/modify")
    public ResponseEntity<String> modifyDept(@RequestParam String deptNo, @RequestParam String deptName) {
        DeptDto updatedDept = DeptDto.builder()./*시퀀스작성*/deptNo(deptNo).deptName(deptName).modifyUser("admin").build();
        deptService.updateCategoryDept(updatedDept);
        log.info("부서 수정: ID={}, 이름={}", deptNo, deptName);
        return ResponseEntity.ok("부서 카테고리가 성공적으로 수정되었습니다.");
    }

    // 부서 삭제
    @PostMapping("/dept/delete")
    public String deleteCategoryDept(String deptNo, RedirectAttributes ra) {
    	
        log.info("부서 삭제: ID={}", deptNo);
        
        int result = deptService.deleteCategoryDept(deptNo);
        

    	if(result > 0) { // 쿼리 성공시
    		ra.addFlashAttribute("alertMsg", "성공적으로 부서가 삭제되었습니다."); // header에서 alertMsg를 띄워주는 구문이 있음.
    		return "redirect:/board/dept/list"; // 부서 관리 페이지로 리다이렉트.
    		
    	}else { // 실패시
    		ra.addFlashAttribute("alertMsg", "부서 삭제에 실패하였습니다.");
    		return "redirect:/"; // 메인페이지로 리다이렉트.
    	}
    }
    
    
}
