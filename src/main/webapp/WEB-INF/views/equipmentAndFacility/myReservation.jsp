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

#my-reservation-table th, #my-reservation-table td{
    border: 1px solid black;
}
#my-reservation-table{
    
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

                        <div id="table-mother" style="width: 80%; margin: 0 auto;">
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
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
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