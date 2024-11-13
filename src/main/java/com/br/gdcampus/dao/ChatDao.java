package com.br.gdcampus.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.ChatRoomDto;
import com.br.gdcampus.dto.UserChatRoomDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ChatDao {

	private final SqlSessionTemplate sqlSession;
	
	/**
	 * 채팅방 전체 리스트 조회
	 * author : 임상우
	 * return 채팅방 dto 객체 list.
	 */
	public List<ChatRoomDto> selectChatRoomList() {
		return sqlSession.selectList("chatMapper.selectChatRoomList");
	}

	
	/**
	 * 채팅방 번호로 채팅방 인원수 조회
	 * author : 임상우
	 * @param chatRoomNo 채팅방 번호
	 * return 그 채팅방의 인원 수
	 */
	public int selectChatRoomPeopleCount(String chatRoomNo) {
		return sqlSession.selectOne("chatMapper.selectChatRoomPeopleCount", chatRoomNo);
	}

	
	/**
	 * 채팅방 번호로 유저-채팅방 매핑 테이블에서 user_no, join_time, join_yn 조회
	 * author : 임상우
	 * @param roomNo 채팅방 번호
	 * return List<UserChatRoomDto>
	 */
	public List<UserChatRoomDto> selectUserChatRoomList(String chatRoomNo) {
		return sqlSession.selectList("chatMapper.selectUserChatRoomList", chatRoomNo);
	}

	
	/**
	 * 그룹 채팅방 생성
	 * author : 임상우
	 * @param map 방장, 방제목, 초대인원이 담겨있음
	 * return 성공시 1 , 실패시 0
	 */
	public int makeGroupChat(Map<String, String> map) {
		return sqlSession.insert("chatMapper.makeGroupChat", map);
	}

}
