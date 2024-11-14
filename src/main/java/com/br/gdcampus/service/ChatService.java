package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.ChatRoomDto;
import com.br.gdcampus.dto.UserChatRoomDto;

public interface ChatService {

    // 채팅방 전체 리스트 조회 - 상우
	List<ChatRoomDto> selectChatRoomList();
   
    // 채팅방 번호로 채팅방 인원수 조회 - 상우
    int selectChatRoomPeopleCount(String chatRoomNo);
    
    // 채팅방 번호로 유저-채팅방 매핑 테이블에서 user_no, join_time, join_yn 조회 - 상우
	List<UserChatRoomDto> selectUserChatRoomList(String chatRoomNo);

	// 그룹 채팅방 생성 - 상우
	int makeGroupChat(Map<String, Object> map);

	// 1대1 채팅방 생성 - 상우
	int makeOneToOneChat(Map<String, Object> map);
    
    // 채팅방 과거 메세지 조회 - 상우
    // List<MessageDto> selectChatMessage(String chatRoomNo);
    
    // 채팅방 메세지 보내기 (db에 기록) - 상우
    // int insertChatMessage(String chatMessage);
    
    // 채팅방 생성 - 상우
    // int createChatRoom(String[] userNo);
    
    // 채팅방 초대 - 상우
    // int inviteChatRoom(String[] userNo);
    
    // 채팅방 나가기 (T_USER_CHAT_ROOM에 상태를 N으로) - 상우
    // int exitChatRoom(String userNo);


    
}
