package com.br.gdcampus.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.br.gdcampus.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Component // serlvet-context.xml에 빈등록 구문 작성 대체.
@Slf4j // 로그를 출력해보기 위해 롬복의 @Slf4j 어노테이션 작성.
public class ChatEchoHandler extends TextWebSocketHandler {

	// 웹소켓 세션 객체(클라이언트)들을 저장하는 리스트
	private List<WebSocketSession> sessionList = new ArrayList<>();
	
	
	/**
	 * 1) afterConnectionEstablished : 웹소켓에 클라이언트가 연결되었을 때 처리할 내용 정의
	 * 
	 * @param session - 현재 웹소켓과 연결된 클라이언트 객체 (즉, 채팅방에 접속된 클라이언트) 
	 * // param이 매개변수에 대한 설명을 작성하는 키워드다.
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 이 session이 바로 이 웹소켓과 연결된 클라이언트 객체다. 
		// 다수의 클라이언트들이 연결될거고 각각의 클라이언트들 마다 고유한 id 정보가 session에 담겨있을 것이다.
		
		/*
		log.debug("====== websocket 연결됨 =====");
		log.debug("WebSocketSession 객체: {}", session);
		log.debug("session id: {}", session.getId());
		log.debug("session Attributes 목록: {}", session.getAttributes()); // {sessionId=xxxx, loginUser=MemberDto객체}
		log.debug("현재 채팅방에 참가한 로그인한 회원: {}", session.getAttributes().get("loginUser")); // MemberDto 객체 뽑기
		*/
		
		sessionList.add(session);
		
		for(WebSocketSession sss : sessionList) {
			String msg = "entry|" + ((MemberDto)session.getAttributes().get("loginUser")).getUserId() + "님이 입장하였습니다.";
			sss.sendMessage(new TextMessage(msg));
		}
		
	}
	
	
	

	/**
	 * 2) handleMessage : 웹소켓으로 데이터(텍스트, 파일 등)가 전송되었을 경우 처리할 내용 정의
	 * 
	 * @param session - 현재 웹소켓으로 데이터를 전송한 클라이언트 객체
	 * @param message - 전송된 데이터에 대한 정보를 가지고 있는 객체
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
		/*
		log.debug("====== 메세지 들어옴 =====");
		log.debug("WebSocketSession 객체: {}", session);
		log.debug("WebSocketMessage 객체: {}", message);
		log.debug("메세지 내용: {}", message.getPayload());
		*/
		
		// 현재 해당 웹소켓에 연결되어있는 모든 클라이언트들(작성자본인포함)에게 현재 들어온 메세지 재발송
		for(WebSocketSession sss : sessionList) {
			
			// 메세지유형(chat/entry/exit) | 채팅방에띄워주고자하는메세지내용 | 발신자아이디 | ...(프로필이미지경로 등) <- 나중에 |으로 split.
			String msg = "chat|" + message.getPayload() + "|" + ((MemberDto)session.getAttributes().get("loginUser")).getUserId();
			sss.sendMessage(new TextMessage(msg)); // 웹소켓에서 클라이언트로 메세지를 보냄. 그냥 보내면 안되고 TextMessage 객체로 보내야 한다.
			// room.jsp에서 onMesage 함수가 자동 실행
			
		}
		
		// 특정 회원과 채팅방을 만든다거나 해당 회원과 나눈 채팅 내역을 보존하려면 메세지를 발송할 때 마다 db에 기록해야 한다.
		// 그때 실행되는 메소드가 handleMessage 메소드다. 
		// insert 해주는 서비스측 메소드를 여기서 실행시키면 된다.
		// 해당 클래스에 Service 클래스를 DI(의존성주입)해서 채팅메세지를 insert하는 메소드를 여기서 실행하면 됨.
	}
	
	
	
	
	 
	/**
	 * 3) afterConnectionClosed : 웹소켓에 클라이언트가 연결이 끊겼을 때 처리할 내용 정의
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		/*
		log.debug("====== websocket 연결됨 =====");
		log.debug("WebSocketSession 객체: {}", session);
		log.debug("session id: {}", session.getId());
		log.debug("현재 채팅방에서 나간 회원: {}", session.getAttributes().get("loginUser")); // MemberDto 객체 뽑기
		*/
		
		sessionList.remove(session);
		
		for(WebSocketSession sss : sessionList) {
			String msg = "exit|" + ((MemberDto)session.getAttributes().get("loginUser")).getUserId() + "님이 퇴장하였습니다.";
			sss.sendMessage(new TextMessage(msg));
		}
	}
	
}
