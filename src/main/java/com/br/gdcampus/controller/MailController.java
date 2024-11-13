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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.service.MailService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MailController {

    @Autowired
    private MailService mailService;

    @PostMapping("/mailSend")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> sendMail(@RequestParam("email") String email,
                           @RequestParam("userName") String userName,
                           RedirectAttributes redirectAttributes) {
        Map<String, Object> response = new HashMap<>();

        try {
            int verificationCode = mailService.sendMail(email);
            redirectAttributes.addFlashAttribute("alertMsg", "인증번호가 발송되었습니다.");
            // 인증번호를 세션이나 다른 곳에 저장하여 검증할 때 사용할 수 있습니다.
            redirectAttributes.addFlashAttribute("verificationCode", verificationCode);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("alertMsg", "인증번호 발송 실패");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
        
    }
}
