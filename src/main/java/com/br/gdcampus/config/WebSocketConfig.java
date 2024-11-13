package com.br.gdcampus.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.br.gdcampus.handler.ChatEchoHandler;

import lombok.RequiredArgsConstructor;

@EnableWebSocket
@RequiredArgsConstructor
@Configuration
public class WebSocketConfig implements WebSocketConfigurer{
	
	private final ChatEchoHandler chatEchoHandler;
	

	/* 스프링일 땐 servlet-context.xml에 아래와 같이 썼어야 했다. 
	  <websocket:handlers>
	    <websocket:mapping handler="chatEchoHandler" path="/chat" />
	    <websocket:handshake-interceptors>
	      <beans:bean class="org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor" />
	    </websocket:handshake-interceptors>
	    <websocket:sockjs />
	  </websocket:handlers>
	*/
	
	
	@Bean
	HttpSessionHandshakeInterceptor HttpSessionHandshakeInterceptor() {
		return new HttpSessionHandshakeInterceptor();
	}
	
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatEchoHandler, "/chat")
				.addInterceptors(HttpSessionHandshakeInterceptor()) // 메소드 호출구문을 쓰면 저 객체가 생성되어서 온다. 이 객체를 인터셉터로 등록한다.
				.withSockJS(); // <websocket:sockjs /> 대체
	}

}
