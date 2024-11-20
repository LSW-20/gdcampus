package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.ChatRoomDto;
import com.br.gdcampus.dto.MessageDto;
import com.br.gdcampus.dto.UserChatRoomDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ChatDao {

	private final SqlSessionTemplate sqlSession;
	
	/**
	 * 로그인한 유저가 속한 채팅방 리스트 조회
	 * author : 임상우
	 * return 채팅방 dto 객체 list.
	 */
	public List<ChatRoomDto> selectChatRoomList(String userNo) {
		return sqlSession.selectList("chatMapper.selectChatRoomList", userNo);
	}

	
	/**
	 * 채팅방 번호로 채팅방 인원수 조회
	 * author : 임상우
	 * @param chatRoomNo 채팅방 번호
	 * return 그 채팅방의 인원 수
	 */
	public int selectChatRoomPeopleCount(String roomNo) {
		return sqlSession.selectOne("chatMapper.selectChatRoomPeopleCount", roomNo);
	}

	
	/**
	 * 채팅방 번호로 유저-채팅방 매핑 테이블에서 user_no, join_time, join_yn 조회
	 * author : 임상우
	 * @param roomNo 채팅방 번호
	 * return List<UserChatRoomDto>
	 */
	public List<UserChatRoomDto> selectUserChatRoomList(String roomNo) {
		return sqlSession.selectList("chatMapper.selectUserChatRoomList", roomNo);
	}

	
	/**
	 * 채팅방 생성
	 * author : 임상우
	 * @param map 방장, 방제목, 초대인원이 담겨있음
	 * return 성공시 1 , 실패시 0
	 */
	public int makeChatRoom(Map<String, Object> map) {
		return sqlSession.insert("chatMapper.makeChatRoom", map);
	}

	/**
	 * 채팅방 생성 후 초대인원 사번을 매핑테이블에 담기
	 * author : 임상우
	 * @param userNo 초대인원의 사번
	 * return 성공시 1, 실패시 0
	 */
	public int insertChatMapping(String userNo) {
		return sqlSession.insert("chatMapper.insertChatMapping", userNo);
	}


	/**
	 * 현재 채팅방의 과거 메세지 내역 조회
	 * author : 임상우
	 * @param roomNo 현재 채팅방 번호
	 * return 과거 메세지 내역
	 */
	public List<MessageDto> selectChatMessage(Map<String, String> map) {
		return sqlSession.selectList("chatMapper.selectChatMessage", map);
	}
	

	/**
	 * 채팅 메세지를 db에 insert - (1/2) T_MESSAGE 테이블에 insert.
	 * author : 임상우
	 * @param map 메세지 내용, 발신자 사번, 채팅방 번호, 발신시간이 들어있다.		
	 * return 성공시 1 , 실패시 0
	 */
	public int insertMessage(Map<String, String> map) {
		return sqlSession.insert("chatMapper.insertMessage", map);
	}

	/**
	 * 채팅 메세지를 db에 insert - (2/2) T_MESSAGE_READ 테이블에 insert.
	 * author : 임상우
	 * @param map 메세지 내용, 발신자 사번, 채팅방 번호, 발신시간이 들어있다.		
	 * return 성공시 1 , 실패시 0
	 */
	public int insertMessageRead(Map<String, String> map) {
		return sqlSession.insert("chatMapper.insertMessageRead", map);
	}


	/**
	 * 사용자가 채팅방에 이미 입장상태인지 조회
	 * atuhor : 상우
	 * @param isFirstTime userNo, roomNo
	 * return UserChatRoomDto
	 */	
	public UserChatRoomDto selectMappingByUserAndRoom(Map<String, String> isFirstTime) {
		return sqlSession.selectOne("chatMapper.selectMappingByUserAndRoom", isFirstTime);
	}

	/**
	 * 채팅방 나가기
	 * author : 상우
	 * @param map userNo, roomNo
	 * return 성공시 1 , 실패시 0
	 */
	public int exitRoom(Map<String, String> map) {
		return sqlSession.update("chatMapper.exitRoom", map);
	}

}
