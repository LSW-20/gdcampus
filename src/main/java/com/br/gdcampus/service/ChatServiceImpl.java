package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.br.gdcampus.dao.ChatDao;
import com.br.gdcampus.dto.ChatRoomDto;
import com.br.gdcampus.dto.MessageDto;
import com.br.gdcampus.dto.UserChatRoomDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {

	private final ChatDao chatDao;

	
	/**
	 * 로그인한 유저가 속한 채팅방 리스트 조회
	 * author : 임상우
	 * return 채팅방 dto 객체 list.
	 */
	@Override
	public List<ChatRoomDto> selectChatRoomList(String userNo) {
		return chatDao.selectChatRoomList(userNo);
	}
	

	/**
	 * 채팅방 번호로 채팅방 인원수 조회
	 * author : 임상우
	 * @param chatRoomNo 채팅방 번호
	 * return 그 채팅방의 인원 수
	 */
	@Override
	public int selectChatRoomPeopleCount(String roomNo) {
		return chatDao.selectChatRoomPeopleCount(roomNo);
	}
	

	/**
	 * 채팅방 번호로 유저-채팅방 매핑 테이블에서 user_no, join_time, join_yn 조회
	 * author : 임상우
	 * @param roomNo 채팅방 번호
	 * return List<UserChatRoomDto>
	 */
	@Override
	public List<UserChatRoomDto> selectUserChatRoomList(String roomNo) {
		return chatDao.selectUserChatRoomList(roomNo);
	}

	
	/**
	 * 그룹 채팅방 생성
	 * author : 임상우
	 * @param map 방장, 방제목, 초대인원이 담겨있음
	 * return 성공시 1 , 실패시 0
	 */
	@Transactional
	@Override
	public int makeGroupChat(Map<String, Object> map) {
		
		int result = chatDao.makeChatRoom(map);
		
		if(result > 0) {
			
			String createUser = (String) map.get("createUser");
			chatDao.insertChatMapping(createUser); // 매핑 테이블에 방장 추가
			
			
			List<String> selectedUsers = (List<String>) map.get("selectedUsers");
			
			for( String userNo : selectedUsers ) {
				result = chatDao.insertChatMapping(userNo); // 매핑 테이블에 초대인원들 추가
			}
			
		}
		
		return result;
		
	}

	/**
	 * 1대1 채팅방 생성
	 * author : 임상우
	 * @param map 방장, 방제목, 초대인원이 담겨있음
	 * return 성공시 1 , 실패시 0
	 */	
	@Transactional
	@Override
	public int makeOneToOneChat(Map<String, Object> map) {
		
		int result = chatDao.makeChatRoom(map);
		
		if(result > 0) {
			
			String createUser = (String) map.get("createUser");
			chatDao.insertChatMapping(createUser); // 매핑 테이블에 방장 추가
			
			
			String userNo = (String) map.get("selectedUser");
			result = chatDao.insertChatMapping(userNo); // 매핑 테이블에 초대인원 추가
			
		}
		
		return result;
	}


	/**
	 * 현재 채팅방의 과거 메세지 내역 조회
	 * author : 임상우
	 * @param roomNo 현재 채팅방 번호
	 * return 과거 메세지 내역
	 */
	@Override
	public List<MessageDto> selectChatMessage(Map<String, String> map) {
		
		return chatDao.selectChatMessage(map);
	}


	/**
	 * 채팅 메세지를 db에 insert
	 * author : 임상우
	 * @param map 메세지 내용, 발신자 사번, 채팅방 번호, 발신시간이 들어있다.
	 * return 성공시 1 , 실패시 0
	 */
	@Transactional
	@Override
	public int insertMessage(Map<String, String> map) {
		
		// (1) T_MESSAGE 테이블에 insert.
		int result = chatDao.insertMessage(map);
		
		// (2) T_MESSAGE_READ 테이블에 insert.
		if(result > 0) {
			List<UserChatRoomDto> list = chatDao.selectUserChatRoomList(map.get("roomNo")); // 이 채팅방의 모든 유저들의 userNo 알아옴.
			for(UserChatRoomDto dto : list) {
				map.put("targetUserNo", dto.getUserNo() );
				result = chatDao.insertMessageRead(map);
			}
		}
		return result;
	}


	/**
	 * 사용자가 채팅방에 이미 입장상태인지 조회
	 * author : 상우
	 * @param isFirstTime userNo, roomNo
	 * return UserChatRoomDto
	 */
	@Override
	public UserChatRoomDto selectMappingByUserAndRoom(Map<String, String> isFirstTime) {
		return chatDao.selectMappingByUserAndRoom(isFirstTime);
	}


	/**
	 * 채팅방 나가기
	 * author : 상우
	 * @param map userNo, roomNo
	 * return 성공시 1 , 실패시 0
	 */
	@Override
	public int exitRoom(Map<String, String> map) {
		return chatDao.exitRoom(map);
	}


	/**
	 * 채팅방 별 최근 메세지 조회
	 * author : 상우
	 * return 채팅방 별 최근 메세지가 담긴 List<MessageDto>
	 */
	@Override
	public List<MessageDto> recentMessage() {
		return chatDao.recentMessage();
	}


	/**
	 * 현재 채팅방(1개)에 대한 정보 조회
	 * author : 상우
	 * reutrn 현재 채팅방 객체
	 */
	@Override
	public ChatRoomDto selectChatRoomOne(String roomNo) {
		return chatDao.selectChatRoomOne(roomNo);
	}
	
	




	
	
}
