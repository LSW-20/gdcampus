<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>비품, 시설 카테고리 관리 페이지</title>

		<style>
				.large-name{
						font-size: 20px;
						font-weight: 600;
				}	

				.radio-or-select{
						width: 200px;
						/* border: 1px solid red; */
						display: inline-block;
						margin-left: 10px;
				}

				#table-mother{
						display: flex;
						justify-content: center; /* 가로 중앙 정렬 */
				}

				#title, #classification, #categorization{
						padding-left: 50px;
				}

				#result-table {
						width: 70%;
				}
				#result-table th, #result-table td {
					border: 1px solid black; /* 공통 테두리 */
					height: 50px;
   			}
				#result-table th, #result-table td:not(.left-align) {
					text-align: center; /* 기본 가운데 정렬 */
   			}
				#result-table .left-align{
						padding-left: 15px;
				}


				/* #result-table 열별 너비 비율 시작 */
				#result-table th:nth-child(1),
				#result-table td:nth-child(1) {
						width: 5%;
				}

				#result-table th:nth-child(2),
				#result-table td:nth-child(2) {
						width: 10%;
				}

				#result-table th:nth-child(3),
				#result-table td:nth-child(3) {
						width: 20%;
				}

				#result-table th:nth-child(4),
				#result-table td:nth-child(4) {
						width: 20%;
				}

				#result-table th:nth-child(5),
				#result-table td:nth-child(5) {
						width: 30%;
				}

				#result-table th:nth-child(6),
				#result-table td:nth-child(6) {
						width: 15%;
				}
				/* #result-table 열별 너비 비율 끝 */


				#top-mother{
						display: flex;
						justify-content: space-between; /* 자식 요소를 양쪽으로 정렬 */
						height: 300px; /* 부모 높이 고정 */
				}
				#top-child1{
						margin-left: 30px;
				}
				#top-child2{
						border: 1px solid black;
						width: 800px;
						margin-right: 150px;
						height: 300px;
				}

				#top-child2-1 {
						width: 800px;
						height: 30px;
						display: flex;
						justify-content: center; /* 가로 중앙 정렬 */
						align-items: center;    /* 세로 중앙 정렬 */
				}

				#top-child2-2 {
						width: 800px;
						height: 270px; 
						display: flex;
				}


				#top-child2-2-1 {
						width: 320px;
						height: 270px; 
						border-top: 1px solid black;
						border-right: 1px solid black;
						display: flex;
						flex-direction: column;
						justify-content: center; /* 가로 가운데 정렬 */
						align-items: center; /* 세로 가운데 정렬 */
				}
				#top-child2-2-2 {
						width: 480px;
						height: 270px; 
						border-top: 1px solid black;
						display: flex;
						flex-direction: column;
						justify-content: center; /* 가로 가운데 정렬 */
						align-items: center; /* 세로 가운데 정렬 */
				}


				#modify-equip-table{
						width: 400px;
						height: 200px;
						margin-bottom: 10px;
				}
				#modify-equip-table td{
						border: 1px solid black;
						padding-left: 10px;
				}

				#equip-img {
					width: 70%; 
					height: 70%;
				}

				.modal-content {
						 width: 600px !important; 
				}
				#modify-facility-table-div{
						display: flex;
						justify-content: center; /* 가로 가운데 정렬 */
						align-items: center; /* 세로 가운데 정렬 */
				}
				#modify-facility-table{
						width: 400px;
						height: 200px;
				}
				#modify-facility-table td{
						border: 1px solid black;
						padding-left: 10px;
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







						</div>
				</div>
		</div>            
		<!-- main-content 끝 -->




	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->


	<script>
    document.addEventListener('DOMContentLoaded', function() {
        alert('JavaScript is working!');
    });
</script>

</body>
</html>