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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			
			List<UserChatRoomDto> list40 = chatService.selectUserChatRoomList(c.getRoomNo());  // 4. 채팅방 번호로 유저-채팅방 매핑 테이블에서 user_no, join_time, join_yn 조회. (1대1 채팅방에 상대 보여줌)
			for(UserChatRoomDto u : list40) {
				if(u.getUserNo() != userNo) {
					map.put("counterpart", u.getUserNo());
				}
			}
					
			list2.add(map);
		}
		
		model.addAttribute("list2", list2);
		
		
		
		
		// 3. 채팅방 초대를 위해 (1) 관리자 유저 담기, (2) 교수 학과명 조회해서 담기, (3) 부서 카테고리 조회,  (4) 각 부서별 유저의 사번, 이름, 부서(직책), 직급 조회해서 담기

		
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
		//  컬렉션 타입(List, Set 등)을 받을 때는 @RequestParam을 명시하는 것이 권장됩니다. 이때 @RequestParam을 명시하지 않으면 Spring이 파라미터 바인딩을 제대로 처리하지 못할 수 있습니다.

		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, Object> map = new HashMap<>();
		map.put("createUser", userNo);
		map.put("title", title);
		map.put("selectedUsers", selectedUsers);
		map.put("type", "G");

		
		int result = chatService.makeGroupChat(map);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "성공적으로 그룹 채팅방이 생성되었습니다.");
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
	public String makeOneToOneChat(HttpSession session, String title, String selectedUser, RedirectAttributes ra) {

		String userNo = ((UserDto)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, Object> map = new HashMap<>();
		map.put("createUser", userNo);
		map.put("title", title);
		map.put("selectedUser", selectedUser);
		map.put("type", "O");

		
		int result = chatService.makeOneToOneChat(map);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "성공적으로 1대1 채팅방이 생성되었습니다.");
			return "redirect:/chat/roomList";
		}else {
			ra.addFlashAttribute("alertMsg", "1대1 채팅방 생성에 실패하였습니다.");
			return "redirect:/";
		}
		
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
