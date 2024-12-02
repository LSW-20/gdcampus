<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비품, 시설 예약 관리 페이지</title>

<style>

#title{
    padding-left: 50px;
}

#top-mother{
    display: flex;
    justify-content: space-between; /* 자식 요소를 양쪽으로 정렬 */
    height: 150px; /* 부모 높이 고정 */
}

#top-child1{
    margin-left: 30px;
}



#table-mother {
    width: 95%; /* 테이블 너비 */
    margin: 0 auto; /* 가로 가운데 정렬 */

    display: flex; /* 플렉스 박스 활성화 */
    justify-content: center; /* 가로 가운데 정렬 */
}

#my-reservation-table {
    width: 100%; /* 부모 크기에 맞춤 */
}

#my-reservation-table th, #my-reservation-table td {
    border: 1px solid black; /* 테두리 */
    padding: 10px; /* 셀 내부 여백 */
    text-align: center; /* 텍스트 가운데 정렬 */
}



#modal-form td {
    vertical-align: middle; /* 테이블 셀 내용을 세로 가운데 정렬 */
}

#modal-form input[type="radio"] {
    vertical-align: middle; /* 라디오 버튼 세로 가운데 정렬 */
}

#modal-form label {
    vertical-align: middle; /* 라벨 텍스트 세로 가운데 정렬 */
    margin-bottom: 0; /* 기본 여백 제거 */
    display: inline-block; /* 일관된 정렬을 위해 인라인 블록으로 설정 */
}



/* (시작)모달 내 radio 버튼과 label 텍스트 가로, 세로 가운데 정렬 스타일(시작) */
#modal-form td {
    vertical-align: middle; /* 셀 내용 세로 가운데 정렬 */
    text-align: center; /* 셀 내용 가로 가운데 정렬 */
}

/* 첫 번째 열(처리결과 라벨)은 왼쪽 정렬 유지 */
#modal-form td:first-child {
    text-align: left;
}

#modal-form input[type="radio"] {
    vertical-align: middle;
}

#modal-form label {
    vertical-align: middle;
    margin-bottom: 0;
    display: inline-block;
}
/* (끝)모달 내 radio 버튼과 label 텍스트 가로, 세로 가운데 정렬 스타일(끝) */


/* "확정하기" 버튼 가운데 정렬 */
#modal-form button {
    display: block;
    margin: 0 auto;
}



/* 예약 결과 셀 공통 스타일: 굵게 */
.status-text {
    font-weight: bold;
}

/* 예약 결과에 따른 글씨 색상 */
.status-approved {
    color: blue; /* 파란색 */
}

.status-rejected {
    color: red; /* 빨간색 */
}

.status-pending {
    color: black; /* 검정색 */
}



</style>

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

                    <div id="top-mother">
                        <!-- top-child1 시작 -->
                        <div id="top-child1">
                                <br><br> 

                                <div id="title">
                                        <h1>비품, 시설 예약 관리</h1> 
                                </div>
                        </div>
                        <!-- top-child1 끝 -->
                    </div>

					<br><br><br>

                    <div style="margin-left: 80px; margin-right: 80px;">

                        <div id="table-mother">
                            <table id="my-reservation-table">
                                <thead>
                                    <tr>
                                        <th>구분</th>
                                        <th>분류</th>
                                        <th><span class="classification"></span>&nbsp;품목 번호</th>
                                        <th><span class="classification"></span>&nbsp;이름</th>
                                        <th>예약 희망일</th>
                                        <th>예약 신청자</th>
                                        <th>예약 사유</th>
                                        <th>예약 신청일</th>
                                        <th>예약 결과</th>
                                        <th>처리자</th>
                                        <th>처리일</th>
                                        <th>승인/반려 사유</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <c:choose>
                                        <c:when test="${ empty reservationList }">
                                            <tr>
                                                <td colspan="13">비품, 시설 예약 내역이 없습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            
                                            <c:forEach var="reservationDto" items="${ reservationList }">
                                                <tr>
                                                    <td>${ reservationDto.classification }</td>
                                                    <c:if test="${reservationDto.classification == '비품'}">    
                                                        <td>${ reservationDto.equipCategory }</td>
                                                        <td>${ reservationDto.equipNo }</td>
                                                        <td>${ reservationDto.equipName }</td>
                                                    </c:if>
                                                    <c:if test="${reservationDto.classification == '시설'}">
                                                        <td>${ reservationDto.facilityCategory }</td>
                                                        <td>${ reservationDto.facilityNo }</td>
                                                        <td>${ reservationDto.facilityName }</td>
                                                     </c:if>
                                                    <td>${ reservationDto.reservationDate }</td>
                                                    <td>${ reservationDto.userName }
                                                    <td>${ reservationDto.reservationReason }</td>
                                                    <td>${ reservationDto.reservationRequestDate }</td>
                                                    <td>
                                                        <!-- 예약 결과에 따른 스타일 -->
																						            <span 
																						                class="status-text ${reservationDto.status == '예약신청승인' ? 'status-approved' : 
																						                                   (reservationDto.status == '예약신청반려' ? 'status-rejected' : 'status-pending')}">
																						                ${reservationDto.status}
																						            </span>
                                                    </td>
                                                    <td>${ reservationDto.approvalRejectionUser }</td>
                                                    <td>${ reservationDto.approvalRejectionDate }</td>
                                                    <td>${ reservationDto.approvalRejectionReason }</td>
                                                    <td style="width: 100px;">
                                                  
																						            <!-- 예약 결과가 "예약신청중"인 경우 승인/반려 버튼 표시 -->
																						            <c:choose>
																						                <c:when test="${reservationDto.status == '예약신청중'}">
																						                    <button type="button" id="choiceButton" data-toggle="modal" data-target="#reservation-approve-modal"
																						                        data-reservation-no="${reservationDto.reservationNo}"
																						                        data-classification="${reservationDto.classification}"
																						                        data-user-name="${reservationDto.userName}"
																						                        data-equip-name="${reservationDto.equipName}"
																						                        data-facility-name="${reservationDto.facilityName}"
																						                        data-reservation-date="${reservationDto.reservationDate}"
																						                        
																						                        
																						                        >
																						                        승인/반려
																						                    </button>
																						                </c:when>
																						                <c:otherwise>
																						                    <button type="button" disabled>
																						                        처리완료
																						                    </button>
																						                </c:otherwise>
																						            </c:choose>
																						            
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                           
                                        </c:otherwise>
                                    </c:choose>

                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>
            </div>
		</div>            
		<!-- main-content 끝 -->


		<!-- 승인/반려 modal 시작-->
		<div class="modal fade" id="reservation-approve-modal">
	      <div class="modal-dialog modal-sm">
	          <div class="modal-content" >
	
	              <form action="${contextPath}/reservation/updateReservation" method="post" id="modal-form">
	                  <div class="modal-body">   
	                  
	              		    <input type="hidden" name="reservationNo" id="modal-reservation-no">
	              		    <input type="hidden" name="classification" id="modal-classification">
	              		    <input type="hidden" name="userName" id="modal-user-name">
	              		    <input type="hidden" name="equipName" id="modal-equip-name">
	              		    <input type="hidden" name="facilityName" id="modal-facility-name">
	              		    <input type="hidden" name="reservationDate" id="modal-reservation-date">
	              		    
	                      <div>
	                          <table>
	                              <tr>
	                                  <th style="text-align: center; height: 50px; font-size: 20px;" colspan="2">승인/반려사유 입력</th>
	                              </tr>
	                                                  
	                              <tr>
	                              		<td colspan="2" style="height: 40px;"></td>
	                              </tr>
	                              
	                              <tr>
	                                  <td style="width: 120px;">승인/반려사유</td>
	                                  <td style="width: 280px;"><input type="text" class="form-control" name="reason" maxlength="25"></td>
	                              </tr>
	                              
	                              <tr>
	                              		<td colspan="2" style="height: 30px;"></td>
	                              </tr>
	                              
	                              <tr>
	                                  <td>처리결과</td>
	                                  <td>
																				<input type="radio" id="approve" name="choice" value="승인" checked>
      																  <label for="approve">승인</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      																  <input type="radio" id="reject" name="choice" value="반려">
      																  <label for="reject">반려</label> 
																		</td>
	                              </tr>
	                          </table>
	
	                          <br><br>
	            
		                          <button type="submit">확정하기</button>
	                      </div>
	  
	                  </div>
	              </form>
	          
	          </div>
	      </div>
	  </div>
	  <!-- 예약 modal 끝 -->


		<script>
		    $(document).ready(function () {
		    	
		        // 모달 버튼 클릭 시 이벤트 처리
		        $('#choiceButton').on('click', function () {
		            
		            // 버튼에 설정된 data-* 속성값 가져오기
		            const reservationNo = $(this).data('reservation-no');
		            const classification = $(this).data('classification');
		            const userName = $(this).data('user-name');
		            const equipName = $(this).data('equip-name');
		            const facilityName = $(this).data('facility-name');
		            const reservationDate = $(this).data('reservation-date');

		            // 숨겨진 필드에 값 설정
		            $('#modal-reservation-no').val(reservationNo);
		            $('#modal-classification').val(classification);
		            $('#modal-user-name').val(userName);
		            $('#modal-equip-name').val(equipName);
		            $('#modal-facility-name').val(facilityName);
		            $('#modal-reservation-date').val(reservationDate);
		        });
		        
		    });
		</script>




	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->


</body>
</html>