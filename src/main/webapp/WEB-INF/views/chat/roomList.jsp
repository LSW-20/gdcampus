<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>


<body data-topbar="dark" data-sidebar="dark">
<!-- body 태그에 data-topbar="dark"를 주면 헤더 다크모드. 없으면 라이트 모드. -->
<!-- body 태그에 data-sidebar="dark"를 주면 사이드바 다크모드. 없애면 라이트 모드. -->



	<!-- 전체 영역(헤더, 사이드바, 내용) 시작 -->
	<div id="layout-wrapper">


    <!-- header 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- header 끝 -->


		<!-- sidebar 시작 -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />				
		<!-- sidebar 끝 -->		

		
		
		<!-- main-content 시작 -->
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

							<br><br>
							
               <div class="d-lg-flex mb-4">
               
               		 <!-- 왼쪽 채팅방 목록 시작 -->
                   <div class="chat-leftsidebar card" style="height:680px;">
                   
                     <br>
                       <div class="p-3 px-4">
                           <div class="media">
                               <div class="align-self-center mr-3">
                                   <img src="${contextPath}<c:out value='${loginUser.profileURL}' default='${contextPath}/images/users/avatar-4.jpg' />" class="avatar-sm rounded-circle" alt="">
                               </div>
                               <div class="media-body">
                                   <h5 class="font-size-16 mt-0 mb-1">
                                   	   <a href="#" class="text-dark">${loginUser.userName}
                                   	       <%-- <i class="mdi mdi-circle text-success align-middle font-size-10 ml-1"></i> --%>
                                   	   </a>
                                   </h5>
																	 <p class="text-muted mb-0">${description}</p>
																	 <%-- 사번이 A시작이면 관리자, B시작이면 부서명 + 직급명, C시작이면 소속학과 + 교수 --%>
                               </div>
                           </div>
                       </div>



                       <div class="pb-3">
                           <div data-simplebar style="max-height: 520px;">
                               <div class="p-4 border-top">
                                   <div>
                                       <div class="float-right">
                                           <a href="#" class="text-primary" data-toggle="modal" data-target="#GroupChat"><i class="mdi mdi-plus"></i>그룹 채팅방 생성</a>
                                       </div>
                                       <h5 class="font-size-16 mb-3"><i class="uil uil-users-alt mr-1"></i>그룹 채팅</h5>

                                       <ul class="list-unstyled chat-list group-list">

                                       
                                          <c:forEach var="map" items="${chatRoomList}">
                                          		<c:if test="${map['chatRoomDto'].roomType eq 'G'}">
                                          		
																									<li data-room-no="'${map['chatRoomDto'].roomNo}'" onclick="loadChatRoom('${map['chatRoomDto'].roomNo}', '${map['chatRoomDto'].roomName}', ${map['count']})", '그룹채팅임'>
																									    <a href="#">
																									        <div class="media">
																									            <div class="avatar-xs mr-3">
																									                <span class="avatar-title rounded-circle bg-soft-primary text-primary">
																									                    G
																									                </span>
																									            </div>
																									            
																									            <div class="media-body overflow-hidden">
																									                <h5 class="text-truncate font-size-14 mb-1">${map['chatRoomDto'].roomName} &nbsp;&nbsp;(${map['count']}명)  </h5>
			                                                            <c:forEach var="messageDto" items="${recentMessageList}"> <%-- 채팅방별 최근 메세지 1개 띄우기 --%>
                                          		                       <c:if test="${map['chatRoomDto'].roomNo eq messageDto.roomNo}">  
                                          		                     		  <p class="text-truncate mb-0">${messageDto.msgContent}</p>
                                          		                       </c:if>
                                          		                    </c:forEach>  
																									            </div>
																									        </div>
																									    </a>
																									</li>

																							</c:if>
																					</c:forEach>
                                       

                                       </ul>
                                   </div>
                               </div>
                               
                               

                               <div class="p-4 border-top">
                                   <div>
                                       <div class="float-right">
                                           <a href="#" class="text-primary" data-toggle="modal" data-target="#OneToOneChat"><i class="mdi mdi-plus"></i>1:1 채팅방 생성</a>
                                       </div>
                                       <h5 class="font-size-16 mb-3"><i class="uil uil-user mr-1"></i>1:1 채팅</h5>

                                       <ul class="list-unstyled chat-list">
                                       
                                          <c:forEach var="map" items="${chatRoomList}">
                                          		<c:if test="${map['chatRoomDto'].roomType eq 'O'}">                                          		

			                                           <li data-room-no="'${map['chatRoomDto'].roomNo}'" onclick="loadChatRoom('${map['chatRoomDto'].roomNo}', '${map['chatRoomDto'].roomName}', ${map['count']},'${map['counterpartName']}')">
			                                               <a href="#">
			                                                   <div class="media">
			                                                       
			                                                       <div class="user-img online align-self-center mr-3">
			                                                           <img src="${contextPath}/images/users/avatar-1.jpg" class="rounded-circle avatar-xs" alt="">
			                                                       </div>
			                                                       
			                                                       <div class="media-body overflow-hidden">
			                                                           <h5 class="text-truncate font-size-14 mb-1">
			                                                           		 <c:forEach var="UserChatRoomDto" items="${ map['userChatRoomList'] }">
			                                                           		     <c:if test="${UserChatRoomDto.userName ne loginUser.userName}">
			                                                           		     	   ${UserChatRoomDto.userName} (${UserChatRoomDto.userNo})
			                                                           		     </c:if>	
			                                                           		 </c:forEach>

			                                                           </h5>
			                                                           
			                                                           <c:forEach var="messageDto" items="${recentMessageList}"> <%-- 채팅방별 최근 메세지 1개 띄우기 --%>
                                          		                       <c:if test="${map['chatRoomDto'].roomNo eq messageDto.roomNo}">  
                                          		                     		  <p class="text-truncate mb-0">${messageDto.msgContent}</p>
                                          		                       </c:if>
                                          		                    </c:forEach>  
			                                                       </div>
			                                                       <%--
			                                                       <div class="font-size-11">몇분전에 왔는지 띄울곳</div>
			                                                       <div class="unread-message">
                                                        			   <span class="badge badge-danger badge-pill">01</span>
                                                      			 </div>
                                                      			 --%>
			                                                   </div>
			                                               </a>
			                                           </li>

																							</c:if>
																					</c:forEach>                                       
                                          
                                       </ul>
                                   </div>
                               </div>
                           </div>
                       </div>

                   </div>
               		 <!-- 왼쪽 채팅방 목록 끝 -->

									

									 <!-- 오른쪽 채팅방 영역 시작 -->	
                   <div class="w-100 user-chat mt-4 mt-sm-0 ml-lg-1" id="chatRoomContent" style="display:none;">
                       <div class="card">
                           <div class="chat-conversation">
                               <div class="p-3 px-lg-4 border-bottom" style="height: 75px;">
                                   <div class="row">
                                       <div class="col-xl-4 col-7">
                                           <div class="media align-items-center">
                                               <div class="user-img online align-self-center mr-3">
                                                   <img src="${contextPath}/images/defaultProfile.png" class="rounded-circle avatar-xs" alt="">
                                               </div>
                                               <div class="media-body">
                                                   <h5 class="font-size-16 mb-1 text-truncate">
                                                   	 RoomNo : <span id="room-no"></span> &nbsp;&nbsp;
                                                   	 <span id="room-name"></span>
                                                   </h5>
                                                   <p class="text-muted text-truncate mb-0">
                                                   	   <i class="uil uil-users-alt mr-1"></i> 
                                                   	   <span id="room-count"></span> members (<span id="all-people"></span>)
                                                   </p>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="col-xl-8 col-5" style="text-align: right;">
	                                         <%-- <i data-feather="plus" style="cursor: pointer;"></i> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
	                                         <i data-feather="log-out" onclick="exitRoom();" style="cursor: pointer;"></i> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																				   <i data-feather="x" onclick="closeConversationList();" style="cursor: pointer;"></i>
                                       </div>
                                   </div>
                               </div>

                               <div class="card-body">
                                   <div style="height: 520px;">
                                       <ul class="conversation-list p-0" style="height: 520px; overflow-y: auto;" >

																			 <!-- 메시지 목록은 동적으로 업데이트 -->
                                           
                                       </ul>
                                   </div>
                                   
                                   <div class="row align-items-center pt-2 chat-input-box">
                                       <div class="col-xl-10 col-md-8 col-8 chat-inputbar">
                                           <input type="text" class="form-control chat-input"  id="chat-input" placeholder="이곳에 메세지를 입력하세요.">
                                       </div>
                                       <div class="col-xl-2 col-md-4 col-4">
                                           <button type="button" class="btn btn-block btn-primary" onclick="sendMessage();">
                                           	 <span class="d-sm-inline-block d-none">Send</span> 
                                             <i class="uil uil-message ml-sm-1 ml-0"></i>
                                           </button>
                                       </div>
                                   </div>
                                   
                               </div>
                           </div>
                       </div>
                   </div>									 
                   <!-- 오른쪽 채팅방 영역 끝 -->	

               </div>
               <!-- End d-lg-flex  -->		
               					
							
							
							<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
							<script>
							
							let sock; // WebSocket 전역 변수로 선언
							
							let currentRoomNo = null; // 현재 활성화된 채팅방 번호를 저장할 변수
							
				      const $conversationList = $(".conversation-list"); // 메세지를 출력시키는 영역의 요소
				       
				       
				      
							// 메세지 전송시 실행될 함수
							function sendMessage() {
				    	  
				    	  console.log( "sendMessage() 실행됨 : " + $("#chat-input").val() );
								sock.send( $("#chat-input").val() ); // 웹소켓 측으로 메세지를 전송 (ChatEchoHandler의 handleMessage 메소드 자동 실행)
								$("#chat-input").val("");
								
							}
				      
							
							
							// 나에게 메세지가 왔을 때 실행될 함수
							function onMessage(evt) { // 웹소켓에서 클라이언트로 보내는 메세지를 받기 위해 매개변수를 둔다.
								
							  console.log('onMessage 함수 실행됨');
								let msgArr = evt.data.split("|"); // ["메세지유형(chat|entry|exit)", "출력시킬메세지내용", "발신자아이디"];
								
								
								
						    let $chatDiv = $("<li>"); // 채팅창에 append시킬 요소 (메세지 유형별로 다르게 제작) // <li></li> 생성

						    
			          if(msgArr[0] == "chat"){ // 채팅메세지일 경우
			        			  
			        	  	
				        	  $chatDiv.addClass("clearfix");
	
				        	  let mediaDiv = $("<div>").addClass("media");
				        	  let mediaBodyDiv = $("<div>").addClass("media-body");
				        	  let conversationTextDiv = $("<div>").addClass("conversation-text").css( {"padding-right": "10px"} );
	
				        	  let ctextWrapDiv = $("<div>").addClass("ctext-wrap");
				        	  let ctextWrapP = $("<p>").text(msgArr[1]); // p태그에 메세지 출력
				        	  ctextWrapDiv.append(ctextWrapP); 
	
				        	  let msgSeenDiv = $("<div>").addClass("msg-seen");
				        	  let msgSeenP = $("<p>").addClass("text-muted font-size-12 mb-0 t mt-1").css( {"padding-right": "10px"} );
				        	  let msgSeenPI = $("<i>").addClass("mdi mdi-clock-outline").text(" " + msgArr[4]);
				        	  msgSeenP.append(msgSeenPI);
				        	  msgSeenDiv.append(msgSeenP);
	
				        	  // 계층적으로 연결
				        	  conversationTextDiv.append(ctextWrapDiv);
				        	  conversationTextDiv.append(msgSeenDiv);
				        	  mediaBodyDiv.append(conversationTextDiv);
				        	  mediaDiv.append(mediaBodyDiv);
				        	  $chatDiv.append(mediaDiv);
	
				        	  

			        	  	if(msgArr[3] == "${loginUser.userNo}"){ // 내가 보낸 메세지인 경우 <li class="clearfix odd">
			        	  		$chatDiv.addClass("odd") 
			        	  	}else {
			        	        // (1) media div의 자손이면서 media-body보다 앞에 img 태그 추가
			        	        let imgTag = $("<img>").addClass("avatar-xs rounded-circle align-self-end").attr("src", "${contextPath}/images/users/avatar-2.jpg"); 
			        	        mediaDiv.prepend(imgTag); // media의 첫 번째 자손으로 추가

			        	        // (2) ctext-wrap의 자손이면서 p 태그보다 앞에 div 태그 추가
			        	        let customDiv = $("<div>").addClass("sender-name").text( msgArr[2] + '(' + msgArr[3] +')' ); 
			        	        ctextWrapDiv.prepend(customDiv); // ctext-wrap의 첫 번째 자손으로 추가
			        	    }
			        	  
			        	  	
			                     
		            }else { // 입장 또는 퇴장 메세지일 경우
		            	$chatDiv.append( $("<div>").html(msgArr[1]).css( {"text-align": "center", "font-weight": "bold"} ) );
		            }						    
						    
						    
			          $conversationList.append($chatDiv);
			          
			          $conversationList.scrollTop( $conversationList[0].scrollHeight ); // 스크롤을 항상 하단으로 유지시켜주는 코드.    
	    
								
							}
							
							
							
							// 웹소켓 연결이 성공적으로 이루어진 경우 실행될 함수
							function onOpen() {
							  console.log("onOpen 메소드 실행됨 : 웹소켓 연결 성공");
							};
							
							// 웹소켓과 해당 클라이언트간의 연결이 끊겼을 경우 실행될 함수
							function onClose() {
							  console.log('onClose 메소드 실행됨 : 웹소켓과 연결 끊김');
							}							
							
							// 웹소켓 통신 중 통신 중 오류가 발생한 경우 실행될 함수
							function onError() {
							  console.log('onError 메소드 실행됨 : 웹소켓 통신 중 오류 발생');
							}							
												
							
							// 메세지 입력창에 엔터 눌러서 전송하기, shift 엔터면 줄바꿈.
			        $(document).ready(function(){
			            // enter 눌렀을 때 메세지 전송, shift+enter 눌렀을 때 줄바꿈 적용
			            $("#chat-input").on("keydown", function(evt){
			              if(evt.keyCode == 13){
			                if(!evt.shiftKey){
			                  evt.preventDefault();
			                  sendMessage(); // 메세지 전송시키는 함수
			                }
			              }
			            })
			        })
							
							
			        
							
							// 왼쪽 채팅방 목록에서 특정 채팅방 클릭시 실행되는 함수.
							function loadChatRoom(roomNo, roomName, count, counterpartName) {
								
 						    if (sock) {
						        sock.close(); // 기존 WebSocket 닫기
						        console.log("기존 WebSocket 연결 종료: 이전에 있던 방의 번호 =", currentRoomNo);
						    } 
						    
								
								currentRoomNo = roomNo; // 현재 열린 채팅방의 번호를 전역 변수에 저장
								
							  $('#chatRoomContent').show(); // 오른쪽 채팅방 영역이 보이게 함.
							  $conversationList.empty()		  // 오른쪽 채팅방 영역의 이전 내용들은 전부 없앰.
							  
							  $('#room-no').html(roomNo);	  // 오른쪽 채팅방 영역에 "현재 채팅방 번호" 표시
								$('#room-count').text(count); // 오른쪽 채팅방 영역에 "현재 채팅방 인원수" 표시
								
		    			    
						    // AJAX 요청을 보내 해당 채팅방의 과거 메시지들을 가져와서 보여준다.
						    $.ajax({
						        url: '/chat/getChatRoomData',  // 서버에서 채팅방 데이터를 가져올 URL
						        type: 'GET',
						        data: { roomNo: roomNo },
						        
						        success: function(resData) {
						        	
							        	let chatMessageList = resData.chatMessageList;
							        	let roomName = resData.roomName;
							        	let userChatRoomList = resData.userChatRoomList;
						            	
							        	console.log("ajax로 요청 후 돌아온 응답데이터 chatMessageList : " + JSON.stringify(chatMessageList) );						        	
							        	// [{"msgNo":"1","msgContent":"직원1입니다.","userNo":"B0001","roomNo":"0001","createDateTime":"2024-10-01 01:30","status":"Y","userName":"김철수","msgType":"NORMAL"},
							        	//	{"msgNo":"2","msgContent":"안녕하세요. B입니다.","userNo":"B0002","roomNo":"0001","createDateTime":"2024-10-01 01:35","status":"Y","userName":"이영희","msgType":"NORMAL"}]
							        	
							        	
												if(roomName){ 
												    $('#room-name').text('<' + roomName + '>'); // 그룹 채팅방의 경우 오른쪽 채팅방 영역에 "현재 채팅방 이름" 표시
												}else {
														userChatRoomList.forEach(function(UserChatRoomDto){
																if(UserChatRoomDto.userName != "${loginUser.userName}"){
																	  $('#room-name').text('<' + UserChatRoomDto.userName + '님과 채팅>'); // 1:1 채팅방의 경우 오른쪽 채팅방 영역에 "상대방 이름" 표시
																}
														})
												}
							        	
							        	// 오른쪽 채팅방 영역에 채팅방 참여인원 표시하기
							        	let allPeople = "";
							        	userChatRoomList.forEach(function(UserChatRoomDto){
							        		allPeople += UserChatRoomDto.userName + ", ";
							        	});
							        	allPeople = allPeople.slice(0, -2); // 마지막 쉼표와 공백 제거
							        	$('#all-people').text(allPeople);
							        	
							        	
							        	// 메세지 불러와서 화면에 띄우기
				        		    chatMessageList.forEach(function(messageDto) {
												    
				        		    		let $chatDiv = $("<li>"); // 채팅창에 append시킬 요소 (메세지 유형별로 다르게 제작) // <li></li> 생성
				        		    		
				        		    	
				        		    	  if (messageDto.msgType === "NORMAL") { // 입장, 퇴장메세지가 아닌 일반메세지인 경우
																
										        	  $chatDiv.addClass("clearfix");
					
										        	  let mediaDiv = $("<div>").addClass("media");
										        	  let mediaBodyDiv = $("<div>").addClass("media-body");
										        	  let conversationTextDiv = $("<div>").addClass("conversation-text").css( {"padding-right": "10px"} );
							
										        	  let ctextWrapDiv = $("<div>").addClass("ctext-wrap");
										        	  let ctextWrapP = $("<p>").text( messageDto.msgContent ); // p태그에 "메세지 내용" 출력.
										        	  ctextWrapDiv.append(ctextWrapP); 
							
										        	  let msgSeenDiv = $("<div>").addClass("msg-seen");
										        	  let msgSeenP = $("<p>").addClass("text-muted font-size-12 mb-0 t mt-1").css( {"padding-right": "10px"} );
										        	  let msgSeenPI = $("<i>").addClass("mdi mdi-clock-outline").text(" " + messageDto.createDateTime);  // "메세지 발신 시간" 출력.
										        	  msgSeenP.append(msgSeenPI);
										        	  msgSeenDiv.append(msgSeenP);
							
										        	  // 계층적으로 연결
										        	  conversationTextDiv.append(ctextWrapDiv);
										        	  conversationTextDiv.append(msgSeenDiv);
										        	  mediaBodyDiv.append(conversationTextDiv);
										        	  mediaDiv.append(mediaBodyDiv);
										        	  $chatDiv.append(mediaDiv);
							
									        	  	if(messageDto.userNo == "${loginUser.userNo}"){ // 내가 보낸 메세지인 경우 <li class="clearfix odd">
									        	  		$chatDiv.addClass("odd") 
									        	  	}else {
									        	        // (1) media div의 자손이면서 media-body보다 앞에 img 태그 추가
									        	        let imgTag = $("<img>").addClass("avatar-xs rounded-circle align-self-end").attr("src", "${contextPath}/images/users/avatar-2.jpg"); 
									        	        mediaDiv.prepend(imgTag); // media의 첫 번째 자손으로 추가
					
									        	        // (2) ctext-wrap의 자손이면서 p 태그보다 앞에 div 태그 추가
									        	        let customDiv = $("<div>").addClass("sender-name").text( messageDto.userName + '(' + messageDto.userNo +')' );  // 발신자 "이름"과 "사번" 출력.
									        	        ctextWrapDiv.prepend(customDiv); // ctext-wrap의 첫 번째 자손으로 추가
									        	    }

				        		    	  }else if(messageDto.msgType === "ENTRY" || (messageDto.msgType === "EXIT")){ // 입장 또는 퇴장 메세지일 경우
				        		    		    $chatDiv.append( $("<div>").html(messageDto.msgContent).css( {"text-align": "center", "font-weight": "bold"} ) );
				        		    	  }
				        		    		
									          $conversationList.append($chatDiv);
									          
									          $conversationList.scrollTop( $conversationList[0].scrollHeight ); // 스크롤을 항상 하단으로 유지시켜주는 코드.    
										    });
							        	
							        	
											  console.log("현재 loadChatRoom 함수에 전달된 roomNo, count : ", roomNo, count);
												sock = new SockJS(`${contextPath}/websocket/chat?roomNo=` + roomNo); // 클라이언트 - 웹소켓 서버와 연결(ChatEchoHandler의 afterConnectionEstablished 메소드 실행).
											  sock.onopen = onOpen; 			// 웹소켓 연결이 성공적으로 이루어졌을 때 실행될 함수를 지정. 
											  sock.onclose = onClose;		  // 웹소켓과 해당 클라이언트간의 연결이 끊겼을 경우 자동으로 실행할 함수를 지정(매핑)하는 구문
											  sock.onerror = onError; 		// 웹소켓 통신 중 통신 중 오류가 발생했을 때 실행될 함수를 지정.
											  sock.onmessage = onMessage; // 웹소켓에서 해당 클라이언트로 메세지 발송시 자동으로 실행할 함수를 지정(매핑)하는 구문
							        	
							      }
						        
						    });
								
							}

							
							
							// x버튼 클릭시 오른쪽 채팅방 영역을 닫고, 세션 종료.
							function closeConversationList() {								
							    // 오른쪽 채팅방 영역 숨기기
							    $('#chatRoomContent').hide(); 
							    sock.close();
							    console.log('채팅방이 닫혔습니다.');
							}
							
							// 나가기버튼 클릭시 alert로 다시 한번 묻고, yes시 채팅방 나가기.
							function exitRoom() {
									if (confirm("정말로 채팅방을 나가시겠습니까?")) {
											var roomNo = $("#room-no").text();

											// jQuery로 폼을 생성
											var $form = $('<form>', {
													'method': 'POST',
													'action': '/chat/exitRoom' 
											});

											var $input = $('<input>', {
													'type': 'hidden',
													'name': 'roomNo',
													'value': roomNo
											});

											$form.append($input);
											$('body').append($form);
											$form.submit();
									}
							}
							
							</script>
							
							

               
               
             
							<!-- 그룹 채팅방 생성 modal -->
							<div class="modal fade" id="GroupChat">
							    <div class="modal-dialog modal-sm">
							        <div class="modal-content">
							        
								        <!-- Modal Header -->
								        <div class="modal-header">
								            <h4 class="modal-title">그룹 채팅방 생성</h4>
								            <button type="button" class="close" data-dismiss="modal">&times;</button> 
								        </div>
								
								        <form action="${contextPath}/chat/makeGroupChat" method="post" onsubmit="return validateSelection()">
								            <!-- Modal Body -->
								            <div class="modal-body">
								            		<br>
								            		<label for="title" class="mr-sm-2"><div style="font-weight: bold;">채팅방 제목 :</div></label>
								                <input type="text" class="mb-2 mr-sm-2" placeholder="필수 입력" id="title" name="title" maxlength="13" required> <br><br><br>

																<div style="text-align: center; font-weight: bold;">
																	&lt;&lt;초대 인원 선택 (최소 1명 이상)&gt;&gt; <br><br>
																</div>
																
																관리자 <br>
																<table>
				                          <c:forEach var="userDto" items="${adminList}">
				                            <c:if test="${userDto.userNo != loginUser.userNo}">
					                          	<tr>
																				<td><input type="checkbox" name="selectedUsers" value="${userDto.userNo}"></td>
					                          		<td>${userDto.userNo}</td>
																	    	<td>${userDto.userName}</td>
																	    </tr>		
																	  </c:if>    	                          	
				                          </c:forEach>
																</table>
																<br>
																
																
																교수 <br>
																<table>
				                          <c:forEach var="userDto" items="${professorList}">
				                            <c:if test="${userDto.userNo != loginUser.userNo}">
					                          	<tr>
																				<td><input type="checkbox" name="selectedUsers" value="${userDto.userNo}"></td>					                          	
					                          		<td>${userDto.userNo}</td>
																	    	<td>${userDto.userName}</td>
																	    	<td>${userDto.deptName}</td>
																	    </tr>		
																	  </c:if>    	                          	
				                          </c:forEach>
																</table>
																<br>
																
			                          
			                          <c:forEach var="dept" items="${deptList}">
			                          	부서 : ${dept} <br>
			                          	<table>
			                          		
			                          		<c:forEach var="userDto" items="${deptMap[dept]}">
				                          		<c:if test="${userDto.userNo != loginUser.userNo}">
						                          	<tr>
																					<td><input type="checkbox" name="selectedUsers" value="${userDto.userNo}"></td>					                          	
						                          		<td>${userDto.userNo}</td>
																		    	<td>${userDto.userName}</td>
																		    	<td>${userDto.rankName}</td>
																		    </tr>
																		  </c:if>  
																    </c:forEach>
			                          		
			                          	</table>
			                          	<br>
			                          </c:forEach>                    

								            </div>
								            
								            <!-- Modal footer -->
								            <div class="modal-footer">
								                <button type="submit" class="btn btn-primary">생성</button>
								                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								            </div>
								        </form>
							        
							        </div>
							    </div>
							</div>
              <script> <!-- 그룹 채팅방 생성 modal 0명 선택 방지. -->
					    function validateSelection() {
					        const checkboxes = document.querySelectorAll('input[name="selectedUsers"]:checked');
					        if (checkboxes.length === 0) {
					            alert("최소 한 명 이상의 사용자를 선택해야 합니다.");
					            return false; // 폼 제출 방지
					        }
					        return true; // 폼 제출 허용
					    }
							</script>
							
 
 
							<!-- 1대1 채팅방 생성 modal -->
							<div class="modal fade" id="OneToOneChat">
							    <div class="modal-dialog modal-sm">
							        <div class="modal-content">
							        
								        <!-- Modal Header -->
								        <div class="modal-header">
								            <h4 class="modal-title">1대1 채팅방 생성</h4>
								            <button type="button" class="close" data-dismiss="modal">&times;</button> 
								        </div>
								
								        <form action="${contextPath}/chat/makeOneToOneChat" method="post">
								            <!-- Modal Body -->
								            <div class="modal-body">
								            		<br>

																<div style="text-align: center; font-weight: bold;">
																	&lt;&lt;초대 인원 선택 (1명)&gt;&gt; <br><br>
																</div>
																
																관리자 <br>
																<table>
				                          <c:forEach var="userDto" items="${adminList}">
				                            <c:if test="${userDto.userNo != loginUser.userNo}">				                          
					                          	<tr>
					                          		<td><input type="radio" name="selectedUser" value="${userDto.userNo}" required></td>
					                          		<td>${userDto.userNo}</td>
																	    	<td>${userDto.userName}</td>
																	    </tr>		
																	  </c:if>    	                          	
				                          </c:forEach>
																</table>
																<br>
																
																
																교수 <br>
																<table>
				                          <c:forEach var="userDto" items="${professorList}">
				                            <c:if test="${userDto.userNo != loginUser.userNo}">				                          
					                          	<tr>
					                          		<td><input type="radio" name="selectedUser" value="${userDto.userNo}" required></td>	                          	
					                          		<td>${userDto.userNo}</td>
																	    	<td>${userDto.userName}</td>
																	    	<td>${userDto.deptName}</td>
																	    </tr>		
																	  </c:if>    	                          	
				                          </c:forEach>
																</table>
																<br>
																
			                          
			                          <c:forEach var="dept" items="${deptList}">
			                          	부서 : ${dept} <br>
			                          	<table>
			                          		
			                          		<c:forEach var="userDto" items="${deptMap[dept]}">
				                          		<c:if test="${userDto.userNo != loginUser.userNo}">
						                          	<tr>
						                          		<td><input type="radio" name="selectedUser" value="${userDto.userNo}" required></td>				                          	
						                          		<td>${userDto.userNo}</td>
																		    	<td>${userDto.userName}</td>
																		    	<td>${userDto.rankName}</td>
																		    </tr>
																		  </c:if>  
																    </c:forEach>
			                          		
			                          	</table>
			                          	<br>
			                          </c:forEach>

								            </div>
								            
								            <!-- Modal footer -->
								            <div class="modal-footer">
								                <button type="submit" class="btn btn-primary">생성</button>
								                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								            </div>
								        </form>
							        
							        </div>
							    </div>
							</div>
               
               
                
            </div> 
        </div>
    </div>
		<!-- main-content 끝 -->



	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->




</body>
</html>