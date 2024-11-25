package com.br.gdcampus.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.br.gdcampus.service.CommuteService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/commute")
public class CommuteController {

    private final CommuteService commuteService;

    @PostMapping("/checkIn")
    public int checkIn(@RequestParam("userNo") String userNo, 
                                           @RequestParam("userName") String userName) {
        int result = commuteService.insertCheckIn(userNo, userName);
        return result;
    }

    @PostMapping("/checkOut")
    public int checkOut(@RequestParam("userNo") String userNo) {
        int result = commuteService.updateCheckOut(userNo);
        return result;
    }
}
