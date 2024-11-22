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
														<form action="${contextPath}/equipmentAndFacility/selectList" method="get" id="select-form">
																<span class="large-name">분류</span> &nbsp;&nbsp;

																<span class="radio-or-select">
																		<span id="equipmentSelectDiv">
																				<select name="equipment">

																				</select>
																		</span>

																		<span id="facilitySelectDiv">
																				<select name="facility">

																				</select>
																		</span>
																</span>
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
														<tr>
															<td><input type="checkbox" class="delete-checkboxes"></td>
															<td>비품</td>
															<td>노트북</td>
															<td>NT02</td>
															<td class="left-align">MacBook Pro 13</td>
															<td><button data-toggle="modal" data-target="#modify-facility">수정하기</button></td>
														</tr>
														<tr>
															<td><input type="checkbox" class="delete-checkboxes"></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="left-align"></td>
															<td><button data-toggle="modal" data-target="#modify-facility">수정하기</button></td>
														</tr>
														<tr>
															<td><input type="checkbox" class="delete-checkboxes"></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="left-align"></td>
															<td><button data-toggle="modal" data-target="#modify-facility">수정하기</button></td>
														</tr>
														<tr>
															<td><input type="checkbox" class="delete-checkboxes"></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="left-align"></td>
															<td><button data-toggle="modal" data-target="#modify-facility">수정하기</button></td>
														</tr>
														<tr>
															<td><input type="checkbox" class="delete-checkboxes"></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="left-align"></td>
															<td><button data-toggle="modal" data-target="#modify-facility">수정하기</button></td>
														</tr>
												</tbody>		
										</table>
								</div>

								<br><br>
								<ul class="pagination d-flex justify-content-center text-dark">
									<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
									<li class="page-item active"><a class="page-link" href="">1</a></li>
									<li class="page-item"><a class="page-link" href="">2</a></li>
									<li class="page-item"><a class="page-link" href="">3</a></li>
									<li class="page-item"><a class="page-link" href="">4</a></li>
									<li class="page-item"><a class="page-link" href="">5</a></li>
									<li class="page-item"><a class="page-link" href="">Next</a></li>
								</ul>



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
							$("#facilitySelectDiv").hide();
							loadOptions('비품');
					} else if (selection === 'facility') {
							$("#facilitySelectDiv").show();
							$("#equipmentSelectDiv").hide();
							loadOptions('시설');
					}
			}
	
			function loadOptions(category) {
					$.ajax({
							url: '/equipmentAndFacility/selectCategory', 
							type: 'GET',
							data: { category: category },


							dataType: 'json', // 컨트롤러가 JSON을 반환하도록 설정된 경우 사실 생략 가능
							success: function(resData) {
									console.log('응답 데이터:', resData);

									const category = resData.category; // "비품" 또는 "시설"
									const list = resData.list; // List<String> 형태의 카테고리
									let targetSelect;

									if (category === '비품') {
											targetSelect = "#equipmentSelectDiv select";
											$(targetSelect).empty().append('<option selected>비품 전체</option>');
									} else if (category === '시설') {
											targetSelect = "#facilitySelectDiv select";
											$(targetSelect).empty().append('<option selected>시설 전체</option>');
									}

									list.forEach(function(item) {
										$(targetSelect).append('<option>' + item + '</option>');
									});

									$('#select-form button[type="submit"]').remove();  // 기존 버튼 삭제
									$('#select-form').append('<button type="submit">검색</button>'); // 새 버튼 추가
							},
							error: function() {
									alert('옵션을 불러오는 중 오류가 발생했습니다.');
							}
					});
			}
	</script>


	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->



</body>
</html>