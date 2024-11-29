<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비품, 시설 예약 페이지</title>

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
    width: 80%; /* 테이블 너비 */
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
                                        <h1>내 예약 내역</h1> 
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
                                        <th><span class="classification"></span>&nbsp;번호</th>
                                        <th><span class="classification"></span>&nbsp;이름</th>
                                        <th>예약 희망일</th>
                                        <th>예약 사유</th>
                                        <th>예약 신청일</th>
                                        <th>예약 결과</th>
                                        <th>비고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>비품</td>
                                        <td>노트북</td>
                                        <td>0010</td>
                                        <td>어쩌구저쩌구요로쿵 노트북</td>
                                        <td>2024-12-24</td>
                                        <td>게임</td>
                                        <td>2024-11-27</td>
                                        <td>예약신청승인</td>
                                        <td></td>
                                    </tr>

                                    <c:choose>
                                        <c:when test="${ empty reservationList }">
                                            <tr>
                                                <td colspan="9">내 예약 내역이 없습니다.</td>
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
                                                    <td>${ reservationDto.reservationReason }</td>
                                                    <td>${ reservationDto.reservationRequestDate }</td>
                                                    <td>${ reservationDto.status }</td>
                                                    <td>${ reservationDto.approvalRejectionReason }</td>
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



	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->


</body>
</html>