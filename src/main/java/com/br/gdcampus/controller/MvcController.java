package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import io.swagger.v3.oas.annotations.Operation;

@Controller
public class MvcController {

    /**
     * 루트 경로 요청 시 main.jsp 페이지를 반환
     * author : 상우
     * @return 메인페이지
     */
    @Operation(summary = "Main page endpoint") // Swagger 문서에 설명 추가. 이 어노테이션 덕분에 localhost:9999/ 경로가 Swagger 문서에 표시됩니다.
    @GetMapping("/")
    public String mainPage() {
        return "main"; // main.jsp를 반환
    }
    
}