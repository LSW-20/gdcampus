package com.br.gdcampus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.gdcampus.dto.ChatRoomDto;
import com.br.gdcampus.dto.MessageDto;
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
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	
	
    // 1) 요청시 전달값 처리 - 매개변수
    // 2) 요청처리를 위한 서비스 호출
    // 3) 응답
	
	

	/**
	 * 메신저 페이지(roomList.jsp)로 이동시키는 메소드
	 * author : 상우
	 */
	@GetMapping("/roomList")
	public void chatRoomPage(HttpSession session, Model model) {
		
		
		// 1. 로그인한 회원의 사번 첫글자에 따라서 설명을 출력한다.
		// 사번이 A시작이면 그냥 "관리자", C시작이면 소속학과 + "교수", B시작이면 직책 + 직급
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();  
		
		//logger.debug("현재 로그인한 회원의 사번 : {}", userNo);
		
		
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
		
		
		
		// 2. 로그인한 유저가 속한 채팅방 리스트 조회하기.
		List<ChatRoomDto> list = chatService.selectChatRoomList(userNo); // 로그인한 유저가 속한 채팅방 DTO가 list로 담김.
		
		List<Map<String, Object>> chatRoomList = new ArrayList<>(); // 응답 페이지로 넘길 list.
		
		
		for(ChatRoomDto c : list) {
			Map<String, Object> map = new HashMap<>();
			map.put("chatRoomDto", c);
			map.put("count", chatService.selectChatRoomPeopleCount(c.getRoomNo()) ); // 3. 각 채팅방 마다 채팅방 번호로 채팅방 인원수 구하기.
			
			// 4. 채팅방 번호로 유저-채팅방 매핑 테이블에서 현재 채팅방에 있는 유저들의 정보 조회(user_no, user_name, room_no, join_time, join_yn)
			List<UserChatRoomDto> userChatRoomList = chatService.selectUserChatRoomList(c.getRoomNo());  
			map.put("userChatRoomList", userChatRoomList);
			
			/*
			for(UserChatRoomDto u : userChatRoomList) {
				if(!u.getUserNo().equals(userNo)) {
					map.put("counterpartNo", u.getUserNo()); // 상대방 사번이 "counterpart"라는 key값에 계속 덮어씌워지긴 하는데 1:1 채팅방에선 어차피 1개의 값만 담겨서 괜찮다.
					map.put("counterpartName", userService.selectUserNameByUserNo(u.getUserNo()) );
				}
			}
			*/
					
			chatRoomList.add(map);
		}
		
		model.addAttribute("chatRoomList", chatRoomList);
		
		
		// 5. 채팅방 별 최근 메세지 조회.
		List<MessageDto> recentMessageList = chatService.recentMessage();
		model.addAttribute("recentMessageList", recentMessageList);
		
		
		
		// 6. 채팅방 초대를 위해 (1) 관리자 유저 담기, (2) 교수 학과명 조회해서 담기, (3) 부서 카테고리 조회,  (4) 각 부서별 유저의 사번, 이름, 부서(직책), 직급 조회해서 담기

		
		// (1) 관리자 유저의 사번, 이름 담기
		List<UserDto> adminList = userService.selectAdminList();
		
		// (2) 교수 유저의 사번, 이름, 학과명 담기
		List<UserDto> professorList = userService.selectProfessorList();

		
		// (3) 부서 카테고리 조회
		List<String> deptList = userService.selectDeptList();
		
		
		// (4) 각 부서별 유저의 사번, 이름, 부서, 직급 담기
		
		Map<String, List<UserDto>> deptMap = new HashMap<>(); // key=부서명, value=그 부서의 유저들의 사번, 이름, 부서, 직급이 담긴 UserDto 객체.
		
		for(String dept : deptList) {
			List<UserDto> chatUserList = userService.selectChatUserList(dept);
			deptMap.put(dept, chatUserList);
		}
		
		

		model.addAttribute("adminList", adminList);
		model.addAttribute("professorList", professorList);		
		model.addAttribute("deptList", deptList);		
		model.addAttribute("deptMap", deptMap);
		

	}  
	
	
	
	/**
	 * 그룹 채팅방 생성
	 * author : 상우
	 */
	@PostMapping("/makeGroupChat")
	public String makeGroupChat(HttpSession session, String title, @RequestParam("selectedUsers")  List<String> selectedUsers, RedirectAttributes ra) {
		// 컬렉션 타입(List, Set 등)을 받을 때는 @RequestParam을 명시하는 것이 권장됩니다. 이때 @RequestParam을 명시하지 않으면 Spring이 파라미터 바인딩을 제대로 처리하지 못할 수 있습니다.

		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, Object> map = new HashMap<>();
		map.put("createUser", userNo);
		map.put("title", title);
		map.put("selectedUsers", selectedUsers);
		map.put("type", "G");

		
		int result = chatService.makeGroupChat(map);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "성공적으로 그룹 채팅방이 생성되었습니다.\\n왼쪽의 채팅방 목록에서 입장해 주십시오.");
			return "redirect:/chat/roomList";
		}else {
			ra.addFlashAttribute("alertMsg", "그룹 채팅방 생성에 실패하였습니다.");
			return "redirect:/";
		}
		
	}
	
	
	/**
	 * 1대1 채팅방 생성
	 * author : 상우
	 */
	@PostMapping("/makeOneToOneChat")
	public String makeOneToOneChat(HttpSession session, String selectedUser, RedirectAttributes ra) {

		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, Object> map = new HashMap<>();
		map.put("createUser", userNo);
		map.put("selectedUser", selectedUser);
		map.put("type", "O");

		
		int result = chatService.makeOneToOneChat(map);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "성공적으로 1대1 채팅방이 생성되었습니다. \\n왼쪽의 채팅방 목록에서 입장해 주십시오.");
			return "redirect:/chat/roomList";
		}else {
			ra.addFlashAttribute("alertMsg", "1대1 채팅방 생성에 실패하였습니다.");
			return "redirect:/";
		}
		
	}	
	
	
	/**
	 * 현재 채팅방의 과거 메세지 내역, 채팅방 이름, 채팅방 참여 인원 목록 조회
	 * author : 상우
	 */
	@ResponseBody
	@GetMapping(value="/getChatRoomData", produces="application/json")
	public Map<String, Object> getChatRoomData(HttpSession session, String roomNo) {
		
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, String> map = new HashMap<>();
		map.put("roomNo", roomNo);
		map.put("userNo", userNo);
		
		
		// (1) 현재 채팅방의 과거 메세지 내역 조회
		List<MessageDto> chatMessageList = chatService.selectChatMessage(map);
		
		// (2) 현재 채팅방 이름 조회
		ChatRoomDto chatRoomDto = chatService.selectChatRoomOne(roomNo);
		String roomName = chatRoomDto.getRoomName();
		
		// (3) 현재 채팅방 참여 인원 목록 조회 (메소드 재사용)
		List<UserChatRoomDto> userChatRoomList = chatService.selectUserChatRoomList(roomNo);
		

		Map<String, Object> resdataMap = new HashMap<>();
		resdataMap.put("chatMessageList", chatMessageList);
		resdataMap.put("roomName", roomName);
		resdataMap.put("userChatRoomList", userChatRoomList);
		
		return resdataMap;
	}
	
	/**
	 * 채팅방 나가기
	 * author : 상우
	 */
	@GetMapping("/exitRoom")
	public String exitRoom(HttpSession session, String roomNo, RedirectAttributes ra) {
		
		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, String> map = new HashMap<>();
		map.put("roomNo", roomNo);
		map.put("userNo", userNo);
		
		int result = chatService.exitRoom(map);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "채팅방 나가기 성공");
		}else {
			ra.addFlashAttribute("alertMsg", "채팅방 나가기 실패");
		}
		
		return "redirect:/chat/roomList";
	}


	
}
