package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/chat")
//@RequiredArgsConstructor
@Controller
public class ChatController {
	
	//private final ChatService chatService;
	

	/**
	 * 메신저 페이지(roomList.jsp)로 이동시키는 메소드
	 * author : 상우
	 */
	@GetMapping("/roomList")
	public void chatRoomPage() {}  
	
	
	
}
