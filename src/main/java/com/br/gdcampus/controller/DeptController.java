package com.br.gdcampus.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.br.gdcampus.dto.DeptDto;
import com.br.gdcampus.service.DeptService;

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
    public void listDept(Model model) {
        List<DeptDto> deptList = deptService.selectCategoryDeptDto();
        model.addAttribute("deptList", deptList);
//        return "dept/deptList"; // JSP 템플릿
    }

    // 부서 추가
    @PostMapping("dept/add")
    public ResponseEntity<String> insertDept(@RequestParam String deptName) {
        DeptDto newDept = DeptDto.builder().deptName(deptName).createUser("/*로그인세션user*/").build();
        deptService.insertCategoryDept(newDept);
        log.info("부서 추가: {}", deptName);
        return ResponseEntity.ok("부서 카테고리가 성공적으로 추가되었습니다.");
        // 관리자 두명이기떄문에 관리자 아이디 넣어야 하고 어드민 으로 작성하면 안됨 
        
    }

    // 부서 수정
    @PostMapping("/deptmodify")
    public ResponseEntity<String> modifyDept(@RequestParam String deptNo, @RequestParam String deptName) {
        DeptDto updatedDept = DeptDto.builder()./*시퀀스작성*/deptNo(deptNo).deptName(deptName).modifyUser("admin").build();
        deptService.updateCategoryDept(updatedDept);
        log.info("부서 수정: ID={}, 이름={}", deptNo, deptName);
        return ResponseEntity.ok("부서 카테고리가 성공적으로 수정되었습니다.");
    }

    // 부서 삭제
    @PostMapping("/delete")
    public ResponseEntity<String> deleteDept(@RequestParam String deptNo) {
        deptService.deleteCategoryDept(deptNo);
        log.info("부서 삭제: ID={}", deptNo);
        return ResponseEntity.ok("부서 카테고리가 성공적으로 삭제되었습니다.");
    }
    
    
}
