package com.br.gdcampus.handler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.br.gdcampus.dto.UserChatRoomDto;
import com.br.gdcampus.dto.UserDto;
import com.br.gdcampus.service.ChatService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Component // serlvet-context.xml에 빈 등록 구문 대체
@Slf4j // 로그 출력을 위한 롬복 어노테이션
public class ChatEchoHandler extends TextWebSocketHandler {
	

    // 각 채팅방의 세션 리스트를 관리하는 맵 (roomNo, userNo)
    private Map<String, Map<String, WebSocketSession>> chatRooms = new ConcurrentHashMap<>();
    
    private final ChatService chatService;
    

    
    /**
     * 웹소켓에 클라이언트가 연결되었을 때 처리할 내용 정의
     * @param session - 현재 웹소켓과 연결된 클라이언트 객체 (채팅방에 접속된 클라이언트)
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

        String roomNo = session.getUri().getQuery().split("roomNo=")[1];
        String userNo = ((UserDto) session.getAttributes().get("loginUser")).getUserNo(); 
        String userName = ((UserDto) session.getAttributes().get("loginUser")).getUserName(); 
        // log.debug("session Attributes 목록: {}", session.getAttributes()); // {sessionId=xxxx, loginUser=MemberDto객체}
        
        session.getAttributes().put("roomNo", roomNo); // roomNo 저장
        session.getAttributes().put("userId", userNo); // userId 저장      
        
        log.debug("{} --> User {} has entered room {}", "ChatEchoHandler의 afterConnectionEstablished 실행됨", userNo, roomNo);
        

        // 현재 roomNo를 key값으로 가지는 List<WebSocketSession>이 없다면 생성한다.
        if ( !chatRooms.containsKey(roomNo) ) {
            chatRooms.put(roomNo, new ConcurrentHashMap<>() );
        }
        // 클라이언트의 session이 현재 roomNo의 List<WebSocketSession>에 없다면 추가한다.
        if( chatRooms.get(roomNo).get(userNo) == null ) {
        	chatRooms.get(roomNo).put(userNo, session);
        }
        
        
        // 사용자가 이 채팅방에 이미 입장상태인지 조회
        Map<String, String> isFirstTime = new HashMap<>();
        isFirstTime.put("userNo", userNo);
        isFirstTime.put("roomNo", roomNo);
        UserChatRoomDto userChatRoomDto = chatService.selectMappingByUserAndRoom(isFirstTime);
        
        
        // 사용자가 현재 roomNo 채팅방에 없거나 퇴장상태였던 경우에는 화면에 입장 메세지를 보내고 db에도 기록한다.
        if( userChatRoomDto == null || userChatRoomDto.getJoinYN().equals("N") ) {
        	
            String msg = "entry|" + "================ " + userName + "(" + userNo + ") 님이 " + roomNo + " 채팅방에 입장하였습니다. ================" + "|" + userNo;
            log.debug("입장 메세지 : {}\n", msg);
        	
            for (WebSocketSession sss : chatRooms.get(roomNo).values() ) { 
            	sss.sendMessage(new TextMessage(msg)); // 이 roomNo 채팅방에 현재 연결되어있는 모든 session에 메세지 전송.
            }
        	// .values()는 Java의 Map 인터페이스에서 제공하는 메서드로 Map에 저장된 값들(value)만을 Collection 형태로 반환합니다. 즉, 키(key)에 상관없이 Map에 저장된 값들을 한꺼번에 처리하고 싶을 때 사용됩니다.
            // Map<K, V>에서 .values()를 호출하면 V 타입의 모든 값(value)이 포함된 Collection<V> 객체를 반환합니다. 반환된 Collection은 Iterable 인터페이스를 구현하고 있으므로, for-each 루프에서 사용할 수 있습니다.
            
            
            // 입장 메세지를 db에 insert.
            LocalDateTime now = LocalDateTime.now(); // 현재 시간
            DateTimeFormatter formatterWithSeconds = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 포맷 정의(연월일 시분초)
            String nowWithSeconds = now.format(formatterWithSeconds);  		 // 포맷 적용(db에 insert는 연월일 시분초)
            
            Map<String, String> map = new HashMap<>();
            map.put("message",  msg.split("\\|")[1] );
            map.put("userNo", userNo);
            map.put("roomNo", roomNo);
            map.put("nowWithSeconds", nowWithSeconds);
            map.put("msgType", "ENTRY");
            chatService.insertMessage(map);
            
            
	        if( userChatRoomDto == null) { // 매핑테이블(유저, 채팅방)에 데이터가 아예 없는경우
	        	log.debug("{}", "매핑테이블(유저, 채팅방)에 데이터가 아예 없는경우");
	        }else if( userChatRoomDto.getJoinYN().equals("N") ){ // 매핑테이블(유저, 채팅방)에 데이터가 있지만 퇴장상태인 경우
	        	log.debug("{}", "매핑테이블(유저, 채팅방)에 데이터가 있지만 퇴장상태인 경우");
	        }
	        
        }    
              
        
    }
   
    
    
    /**
     * 웹소켓으로 데이터(텍스트 등)가 전송되었을 경우 처리할 내용 정의
     * @param session - 현재 웹소켓으로 데이터를 전송한 클라이언트 객체
     * @param message - 전송된 데이터에 대한 정보를 가진 객체
     */
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
    	
    	log.debug("ChatEchoHandler의 handleMessage 실행됨.");
    	
        String roomNo = (String) session.getAttributes().get("roomNo");
        String userNo = ((UserDto) session.getAttributes().get("loginUser")).getUserNo(); 
        String userName = ((UserDto) session.getAttributes().get("loginUser")).getUserName(); 
        String payload = message.getPayload().toString();
        
        
        LocalDateTime now = LocalDateTime.now(); // 현재 시간
        DateTimeFormatter formatterWithSeconds = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 포맷 정의(연월일 시분초)
        DateTimeFormatter formatterWithoutSeconds = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); // 포맷 정의(연월일 시분)
        String nowWithSeconds = now.format(formatterWithSeconds);  		 // 포맷 적용(db에 insert는 연월일 시분초)
        String nowWithoutSeconds = now.format(formatterWithoutSeconds);  // 포맷 적용(화면에는 연월일 시분만 뿌려줌)
        
        
        log.debug("(handleMessage) 화면 -> 웹소켓으로 넘어온 메세지 : {}", payload);
        
        // 메세지유형(chat/entry/exit) | 메세지내용 | 발신자이름 | 발신자사번 | 보낸시간 | ...(프로필이미지경로 등) <- 화면에서 .split("|") 한다.
        String msg = "chat|" + payload + "|" + userName + "|" + userNo + "|" + nowWithoutSeconds;
        
        log.debug("(handleMessage) 웹소켓에서 화면으로 보낼 메세지 : {}", msg);

        log.debug("(handleMessage) 현재 채팅방 번호 : {}", roomNo);  
        log.debug("(handleMessage) 현재 {} 채팅방 번호에 연결되어 있는 클라이언트들의 세션 리스트 : {} \n", roomNo, chatRooms.get(roomNo));
        
        // 현재 채팅방의 모든 사용자에게 메시지 전송
        for (WebSocketSession sss : chatRooms.get(roomNo).values()) {
            sss.sendMessage(new TextMessage(msg)); // 화면에서 onMesage 함수가 자동 실행된다.
        }
        
        
        // 채팅 메세지를 db에 insert.
        Map<String, String> map = new HashMap<>();
        map.put("message", payload);
        map.put("userNo", userNo);
        map.put("roomNo", roomNo);
        map.put("nowWithSeconds", nowWithSeconds);
        map.put("msgType", "NORMAL");
        chatService.insertMessage(map);
        
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
        chatRooms.get(roomNo).remove(userId);
        
        log.debug("{} --> User {} has disconnected from room {} \n", "ChatEchoHandler의 afterConnectionClosed 실행됨", userId, roomNo);
    }
    
    

    /**
     * 사용자가 채팅방에서 완전히 나가는 메서드 <- 사용자가 '채팅방 나가기' 버튼 클릭시 실행.
     * @param roomId - 사용자가 나가려는 채팅방 ID
     * @param userId - 나가려는 사용자의 ID
    
    public void leaveChat(String roomNo, String userId) throws Exception {
        if (userStatusMap.containsKey(roomNo) && userStatusMap.get(roomNo).containsKey(userId)) {
            userStatusMap.get(roomNo).put(userId, false);

            String msg = "exit|" + userId + "님이 " + roomNo + " 채팅방에서 퇴장하였습니다.";
            for (WebSocketSession sss : chatRooms.get(roomNo).values()) {
                sss.sendMessage(new TextMessage(msg));
            }
            log.debug("User {} has left chat room {} \n", userId, roomNo);
        }
    }
    */
    
    
}