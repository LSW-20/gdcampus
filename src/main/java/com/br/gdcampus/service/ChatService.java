package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.ChatRoomDto;
import com.br.gdcampus.dto.MessageDto;
import com.br.gdcampus.dto.UserChatRoomDto;

public interface ChatService {

    // 로그인한 유저가 속한 채팅방 리스트 조회 - 상우
	List<ChatRoomDto> selectChatRoomList(String userNo);
   
    // 채팅방 번호로 채팅방 인원수 조회 - 상우
    int selectChatRoomPeopleCount(String roomNo);
    
    // 채팅방 번호로 유저-채팅방 매핑 테이블에서 user_no, join_time, join_yn 조회 - 상우
	List<UserChatRoomDto> selectUserChatRoomList(String roomNo);

	// 그룹 채팅방 생성 - 상우
	int makeGroupChat(Map<String, Object> map);

	// 1대1 채팅방 생성 - 상우
	int makeOneToOneChat(Map<String, Object> map);

    // 현재 채팅방의 과거 메세지 내역 조회 - 상우
    List<MessageDto> selectChatMessage(Map<String, String> map);

    // 채팅 메세지를 db에 insert - 상우
	int insertMessage(Map<String, String> map);

	// 사용자가 채팅방에 이미 입장상태인지 조회 - 상우
	UserChatRoomDto selectMappingByUserAndRoom(Map<String, String> isFirstTime);

	// 채팅방 나가기 - 상우
	int exitRoom(Map<String, String> map);

	// 채팅방 별 최근 메세지 조회 - 상우
	List<MessageDto> recentMessage();

	// 현재 채팅방(1개)에 대한 정보 조회 - 상우
	ChatRoomDto selectChatRoomOne(String roomNo);
    
    
    // 채팅방 초대 - 상우
    // int inviteChatRoom(String[] userNo);
    
}
