package com.br.gdcampus.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.gdcampus.service.MailService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MailController {

    @Autowired
    private MailService mailService;

    @PostMapping("/mailSend")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> sendMail(@RequestParam("email") String email,
                                                         @RequestParam("userName") String userName) {
        Map<String, Object> response = new HashMap<>();

        try {
            int verificationCode = mailService.sendMail(email);
            response.put("verificationCode", verificationCode); // 응답에 verificationCode 추가
            response.put("alertMsg", "인증번호가 발송되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("alertMsg", "인증번호 발송 실패");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
    
    @PostMapping("/mailSendPwd")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> sendMailPwd(@RequestParam("email") String email,
                                                         @RequestParam("userId") String userId,
                                                         HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        try {
            int verificationCode = mailService.sendMail(email);
            session.setAttribute("verificationCode", verificationCode);
            
            response.put("verificationCode", verificationCode); // 응답에 verificationCode 추가
            response.put("alertMsg", "인증번호가 발송되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("alertMsg", "인증번호 발송 실패");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
}
