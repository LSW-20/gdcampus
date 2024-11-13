package com.br.gdcampus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.gdcampus.dto.ChatRoomDto;
import com.br.gdcampus.dto.UserChatRoomDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.ChatService;
import com.br.gdcampus.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequestMapping("/chat")
@RequiredArgsConstructor
@Controller
public class ChatController {
	
	private final ChatService chatService;
	private final UserService userService;
	

	/**
	 * 메신저 페이지(roomList.jsp)로 이동시키는 메소드
	 * author : 상우
	 */
	@GetMapping("/roomList")
	public void chatRoomPage(HttpSession session, Model model) {
		
		// 1. 로그인한 회원의 사번 type에 따라 이름 아래 설명 출력.
		// 사번이 A시작이면 그냥 "관리자", C시작이면 소속학과 + "교수", B시작이면 직책 + 직급
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		if(userNo.charAt(0) == 'A') {
			
			model.addAttribute("description", "관리자");
			
		} else if(userNo.charAt(0) == 'C') {
			
			// stDeptNo로 소속학과 알아오기
			String stDeptName = userService.selectStDeptName(((UserDto)session.getAttribute("loginUser")).getStDeptNo());
			model.addAttribute("description", stDeptName + " 교수");
			
		} else if(userNo.charAt(0) == 'B') {
			
			// deptNo로 부서 알아오기
			String deptName = userService.selectDeptName(((UserDto)session.getAttribute("loginUser")).getDeptNo());
			// rankNo로 직책 알아오기
			String rankName = userService.selectRankName(((UserDto)session.getAttribute("loginUser")).getRankNo());		
			model.addAttribute("description", deptName + " - " + rankName);
			
		}
		
		
		// 2. 채팅방 전체 리스트 조회하기.
		List<ChatRoomDto> list = chatService.selectChatRoomList(); // 전체 채팅방 DTO가 list로 담김.
		
		List<Map<String, Object>> list2 = new ArrayList<>(); // 응답 페이지로 넘길 list.
		
		
		for(ChatRoomDto c : list) {
			Map<String, Object> map = new HashMap<>();
			map.put("chatRoomDto", c);
			map.put("count", chatService.selectChatRoomPeopleCount(c.getRoomNo()) ); // 3. 채팅방 번호로 채팅방 인원수 구하기.
			
			List<UserChatRoomDto> list40 = chatService.selectUserChatRoomList(c.getRoomNo());  // 4. 채팅방 번호로 유저-채팅방 매핑 테이블에서 user_no, join_time, join_yn 조회. 
			for(UserChatRoomDto u : list40) {
				if(u.getUserNo() != userNo) {
					map.put("counterpart", u.getUserNo());
				}
			}
					
			list2.add(map);
		}
		
		model.addAttribute("list2", list2);
	}  
	
	
	
	/**
	 * 그룹채팅방 생성
	 * author : 상우
	 */
	@PostMapping("/makeGroupChat")
	public String makeGroupChat(HttpSession session, String title, String userId1, String userId2) {

		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, String> map = new HashMap<>();
		map.put("createUser", userNo);
		map.put("title", title);
		map.put("invite1", userId1);
		map.put("invite2", userId2);
		
		int result = chatService.makeGroupChat(map);
		

		return "redirect:/chat/roomList";
		
	}
	
	
	/*
    @PostMapping("/update.do")
    public String noticeUpdate(MessageDto n, RedirectAttributes ra) { // 1) 요청시 전달값 처리 - 커맨드 객체
       
        // 2) 요청처리를 위한 서비스 호출
        int result = chatService.updateNotice(n);
       
        // 3) 응답
        if(result > 0) {
        	
            //model.addAttribute("alertMsg", "성공적으로 수정되었습니다.");
            ra.addFlashAttribute("alertMsg", "성공적으로 수정되었습니다.");
            
               
            // return "notice/detail"; 이건 포워딩이다.

            return "redirect:/notice/detail.do?no=" + n.getNo();
            // - detail.jsp를 보면 notice 객체에서 값을 뽑는데 notice객체를 우리가 넘기지 않았다.
            // 포워딩을 하고 싶다면 model 객체를 만들어서 notice라는 key값으로 notice 객체가 담겨있어야 한다.
            // - NoticeController의 noticeDetail 메소드를 보면 no만 넘기면 그 게시글을 조회해서 notice로 담아서 넘기는 메소드가 이미 정의되어 있다.

            

        }else {

            // return "main"; 이렇게 하면 메인페이지가 뜨긴 하는데 url이 메인 페이지가 아니라 /update.do다.

            // MvcController 가보면 이미 메인페이지로 이동하는 메소드가 정의되어 있음.
            return "redirect:/";

        }
       
    }
    */
	
}
