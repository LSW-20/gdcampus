package com.br.gdcampus.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.br.gdcampus.dto.UserDto;

import lombok.extern.slf4j.Slf4j;

@Component // serlvet-context.xml에 빈 등록 구문 대체
@Slf4j // 로그 출력을 위한 롬복 어노테이션
public class ChatEchoHandler extends TextWebSocketHandler {
	

    // roomNo를 key로 각 채팅방의 세션 리스트를 관리하는 맵
    private Map<String, List<WebSocketSession>> chatRooms = new ConcurrentHashMap<>();
    
    // 각 채팅방에 사용자가 참여하고 있는지 여부를 저장하는 맵 (roomNo와 userNo로 구성)
    private Map<String, Map<String, Boolean>> userStatusMap = new ConcurrentHashMap<>();
    

    
    /**
     * 웹소켓에 클라이언트가 연결되었을 때 처리할 내용 정의
     * @param session - 현재 웹소켓과 연결된 클라이언트 객체 (채팅방에 접속된 클라이언트)
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

        String roomNo = session.getUri().getQuery().split("roomNo=")[1];
        String userId = ((UserDto) session.getAttributes().get("loginUser")).getUserId(); 
        // log.debug("session Attributes 목록: {}", session.getAttributes()); // {sessionId=xxxx, loginUser=MemberDto객체}
        
        session.getAttributes().put("roomNo", roomNo); // roomNo 저장
        session.getAttributes().put("userId", userId); // userId 저장       
        

        // 채팅방이 없으면 새로 생성
        chatRooms.putIfAbsent(roomNo, new ArrayList<>());
        userStatusMap.putIfAbsent(roomNo, new ConcurrentHashMap<>());
        

        // 사용자가 채팅방에 없었던 경우에는 입장처리
        if (!userStatusMap.get(roomNo).getOrDefault(userId, false)) {  
        	// sessionList.contains(session) 조건 검사를 생략했는데, 이는 userStatusMap을 사용하여 해당 사용자가 이미 접속 상태인지 확인하는 방식으로 바뀌었기 때문입니다. 
        	// 이 경우, userStatusMap에 사용자의 상태가 true로 기록된 경우 이미 입장한 것으로 간주하고, 중복 메시지를 방지할 수 있습니다.
            
        	userStatusMap.get(roomNo).put(userId, true);
            chatRooms.get(roomNo).add(session); // 현재 roomNo를 key로 List<WebSocketSession>에 현재 session 추가. 

            // 입장 메시지 생성 및 전송
            String msg = "entry|" + userId + "님이 " + roomNo + " 채팅방에 입장하였습니다.";
            for (WebSocketSession sss : chatRooms.get(roomNo)) {
                sss.sendMessage(new TextMessage(msg));
            }
        }
        
        log.debug("User {} has entered room {}", userId, roomNo);
    }
   
    
    
    /**
     * 웹소켓으로 데이터(텍스트 등)가 전송되었을 경우 처리할 내용 정의
     * @param session - 현재 웹소켓으로 데이터를 전송한 클라이언트 객체
     * @param message - 전송된 데이터에 대한 정보를 가진 객체
     */
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String roomNo = (String) session.getAttributes().get("roomNo");
        String userId = (String) session.getAttributes().get("userId");
        String payload = message.getPayload().toString();

        
        // 메세지유형(chat/entry/exit) | 채팅방에띄워주고자하는메세지내용 | 발신자아이디 | ...(프로필이미지경로 등) <- 나중에 |으로 split.
        String msg = "chat|" + payload + "|" + userId;
        
        // 현재 채팅방의 모든 사용자에게 메시지 전송
        for (WebSocketSession sss : chatRooms.get(roomNo)) {
            sss.sendMessage(new TextMessage(msg)); // 화면에서 onMesage 함수가 자동 실행된다.
        }
        
    }
    
    

    /**
     * 웹소켓 연결이 끊겼을 때 처리할 내용 정의
     * @param session - 웹소켓 연결이 끊긴 클라이언트의 정보
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String roomNo = (String) session.getAttributes().get("roomNo");
        String userId = (String) session.getAttributes().get("userId");

        // 채팅방에서 해당 세션 제거
        chatRooms.get(roomNo).remove(session);
        
        log.debug("User {} has disconnected from room {}", userId, roomNo);
    }
    
    

    /**
     * 사용자가 채팅방에서 완전히 나가는 메서드 <- 사용자가 '채팅방 나가기' 버튼 클릭시 실행.
     * @param roomId - 사용자가 나가려는 채팅방 ID
     * @param userId - 나가려는 사용자의 ID
     */
    public void leaveChat(String roomNo, String userId) throws Exception {
        if (userStatusMap.containsKey(roomNo) && userStatusMap.get(roomNo).containsKey(userId)) {
            userStatusMap.get(roomNo).put(userId, false);

            String msg = "exit|" + userId + "님이 " + roomNo + " 채팅방에서 퇴장하였습니다.";
            for (WebSocketSession sss : chatRooms.get(roomNo)) {
                sss.sendMessage(new TextMessage(msg));
            }
            log.debug("User {} has left chat room {}", userId, roomNo);
        }
    }
    
    
}