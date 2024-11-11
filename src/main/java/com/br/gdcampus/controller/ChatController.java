package com.br.gdcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/chat")
//@RequiredArgsConstructor
@Controller
public class ChatController {
	
	//private final ChatService chatService;

	
	@GetMapping("/chat.do")
	public void chatRoomPage() {}
	
}
