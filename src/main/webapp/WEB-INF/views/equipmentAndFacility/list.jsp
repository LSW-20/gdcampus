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
						width: 120px;
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

				#equipmentSelectDiv, #facilitySelectDiv{
						display: none;
				}

				#delete-button-div{
						text-align: right;
				}
				#delete-button{
						margin-right: 250px;
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
														<h1>비품/시설 관리</h1> 
												</div>
												<br><br>
												
												<div id="classification">
														<span class="large-name">구분</span> &nbsp;&nbsp;

														<span class="radio-or-select">
																<input type="radio" id="equipment" name="classification" value="equipment" onclick="radioSelect('equipment')">
																<label for="equipment">비품</label> &nbsp;&nbsp;
																<input type="radio" id="facility" name="classification" value="facility" onclick="radioSelect('facility')">
																<label for="facility">시설</label> &nbsp;&nbsp;
														</span>

												</div>

												<br>
												<div id="categorization">
														<form action="${contextPath}/equipmentAndFacility/list" method="get" id="select-form">
																<span class="large-name">분류</span> &nbsp;&nbsp;

																<span class="radio-or-select">
																		<span id="equipmentSelectDiv">
																				<select> <%-- name 속성은 동적으로 부여&회수 --%>
																						<option>비품 전체</option>
																						<c:forEach var="category" items="${ equipmentCategoryList }">
																								<option>${ category }</option>
																						</c:forEach>		
																				</select>
																		</span>

																		<span id="facilitySelectDiv">
																				<select> <%-- name 속성은 동적으로 부여&회수 --%>
																						<option>시설 전체</option>
																						<c:forEach var="category" items="${ facilityCategoryList }">
																							<option>${ category }</option>
																					</c:forEach>	
																				</select>
																		</span>
																</span>

																<button type="submit">검색</button>
														</form>		
												</div>
										</div>
										<!-- top-child1 끝 -->

										<!-- top-child2 시작 -->
										<div id="top-child2">
												<div id="top-child2-1">비품 추가/수정창</div>

												<div id="top-child2-2">
														<div id="top-child2-2-1">
																<img src="${contextPath}/images/product/img-01.png" id="equip-img">  
																<div>레노버 노트북1.png</div> 
																<input type="file">
														</div>
														<div id="top-child2-2-2">
																<table id="modify-equip-table">
																		<tr>
																				<td>구분</td>
																				<td>비품</td>
																		</tr>
																		<tr>
																				<td>분류</td>
																				<td>노트북</td>
																		</tr>
																		<tr>
																				<td>비품번호</td>
																				<td>NT01</td>
																		</tr>
																		<tr>
																				<td>비품명</td>
																				<td>Lenovo ThinkPad X1 Carvon Gen 9</td>
																		</tr>
																</table>

																<button>추가</button>
														</div>
												</div>
										</div>
										<!-- top-child2 끝 -->

								</div>


								<br><br><br><br><br><br><br>

								<div style="margin-left: 80px;">
										<h2>
												<span id="result-category">${ resultClass }</span>
												검색결과
										</h2>
										<br><br>
								</div>

								<form id="delete-form" method="post" action="${contextPath}/equipmentAndFacility/deleteList">
										<c:choose>
												<c:when test="${category == '비품'}">
														<input type="hidden" name="target" value="비품">
												</c:when>
												<c:otherwise>
														<input type="hidden" name="target" value="시설">
												</c:otherwise>
										</c:choose>		

										<div id="table-mother">
												<table id="result-table">
														<thead>
																<tr>
																	<th></th>
																	<th>구분</th>
																	<th>분류</th>
																	<th>비품/시설 번호</th>
																	<th>비품명/시설명</th>
																	<th></th>
																</tr>
														</thead>
														<tbody>

																<c:choose>
																		<c:when test="${ empty list }">
																				<tr>
																						<td colspan="6">조회된 게시글이 없습니다.</td>
																				</tr>
																		</c:when>
																		<c:otherwise>
																				<c:forEach var="dto" items="${ list }">
																						<c:if test="${category == '비품'}">
																							<tr>
																									<td><input type="checkbox" class="delete-checkboxes" name="deleteList" value="${dto.equipNo}"></td>
																									<td>비품</td>
																									<td>${ dto.equipCategory }</td>
																									<td>${ dto.equipNo }</td>
																									<td>${ dto.equipName }</td>
																									<td><button data-toggle="modal" data-target="#modify-facility">수정하기</button></td>
																							</tr>
																						</c:if>
																						<c:if test="${category == '시설'}">
																							<tr>
																									<td><input type="checkbox" class="delete-checkboxes" name="deleteList" value="${dto.facilityNo}"></td>
																									<td>시설</td>
																									<td>${ dto.facilityCategory }</td>
																									<td>${ dto.facilityNo }</td>
																									<td>${ dto.facilityName }</td>
																									<td><button data-toggle="modal" data-target="#modify-facility">수정하기</button></td>
																							</tr>
																						</c:if>
																				</c:forEach>
																		</c:otherwise>
																</c:choose>

														</tbody>		
												</table>
										</div>
								</form>

								<br><br>

								<c:if test="${ !empty list }">
										<div id="delete-button-div">
												<button type="button" id="delete-button" onclick="confirmDelete()">삭제</button>
										</div>

										<ul class="pagination d-flex justify-content-center">
									
												<li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
														<c:choose>
																<c:when test="${category == '비품'}">
																		<a class="page-link" href="${contextPath}/equipmentAndFacility/list?page=${pi.currentPage-1}&equipment=${resultClass}">Previous</a>
																</c:when>
																<c:otherwise>
																		<a class="page-link" href="${contextPath}/equipmentAndFacility/list?page=${pi.currentPage-1}&facility=${resultClass}">Previous</a>
																</c:otherwise>
														</c:choose>		
												</li>
											
												<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
														<c:choose>
																<c:when test="${category == '비품'}">
																		<li class="page-item ${ pi.currentPage == p ? 'active' : '' }"><a class="page-link" href="${contextPath}/equipmentAndFacility/list?page=${ p }&equipment=${resultClass}">${ p }</a></li>
																</c:when>
																<c:otherwise>
																		<li class="page-item ${ pi.currentPage == p ? 'active' : '' }"><a class="page-link" href="${contextPath}/equipmentAndFacility/list?page=${ p }&facility=${resultClass}">${ p }</a></li>
																</c:otherwise>
														</c:choose>		
												</c:forEach>
											
												<li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
														<c:choose>
																<c:when test="${category == '비품'}">
																		<a class="page-link" href="${contextPath}/equipmentAndFacility/list?page=${pi.currentPage+1}&equipment=${resultClass}">Next</a>
																</c:when>
																<c:otherwise>
																		<a class="page-link" href="${contextPath}/equipmentAndFacility/list?page=${pi.currentPage+1}&facility=${resultClass}">Next</a>
																</c:otherwise>
														</c:choose>		
													</li>
								
										</ul>										
								</c:if>


							<!-- 시설 수정 modal -->
							<div class="modal fade" id="modify-facility">
								<div class="modal-dialog modal-sm">
										<div class="modal-content" >
										
											<!-- Modal Header -->
											<div class="modal-header">
													<h4 class="modal-title">시설 수정창</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button> 
											</div>
							
											<form action="${contextPath}/equipAndFacility/modifyFacility" method="post">
													<!-- Modal Body -->
													<div class="modal-body">   
															<div id="modify-facility-table-div">
																	<table id="modify-facility-table">
																			<tr>
																					<td>구분</td>
																					<td>시설</td>
																			</tr>
																			<tr>
																					<td>분류</td>
																					<td>회의장</td>
																			</tr>
																			<tr>
																					<td>시설번호</td>
																					<td>MT01</td>
																			</tr>
																			<tr>
																					<td>시설명</td>
																					<td>회의실 A (정원 10명)</td>
																			</tr>
																	</table>
															</div>
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


		<script>
			function radioSelect(selection) {
					if (selection === 'equipment') {
							$("#equipmentSelectDiv").show();
							$("#equipmentSelectDiv select").attr("name", "equipment");
							$("#facilitySelectDiv").hide();
							$("#facilitySelectDiv select").removeAttr("name");
							loadOptions('비품');
					} else if (selection === 'facility') {
							$("#facilitySelectDiv").show();
							$("#facilitySelectDiv select").attr("name", "facility");
							$("#equipmentSelectDiv").hide();
							$("#equipmentSelectDiv select").removeAttr("name");
							loadOptions('시설');
					}
			}


			function confirmDelete() {
					if ($('.delete-checkboxes:checked').length === 0) {
							alert("삭제할 항목을 선택해주세요.");
							return;
					}

					if (confirm("선택된 항목을 삭제하시겠습니까?")) {
							$('#delete-form').submit();
					}
			}
	</script>


	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->



</body>
</html>