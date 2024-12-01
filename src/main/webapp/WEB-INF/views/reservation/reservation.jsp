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

        #title, #left{
						padding-left: 50px;
				}


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


				#detail-table{
						width: 400px;
						height: 200px;
						margin-bottom: 10px;
				}
				#detail-table td{
						border: 1px solid black;
						padding-left: 10px;
				}


				#equip-img {
					width: 70%; 
					height: 70%;
				}

				#top-child2{
						display: none; 
				}

        /* 달력의 날짜 셀에 마우스 올리면 커서를 손가락 모양으로 바꿈 */
        .fc-daygrid-day {
            cursor: pointer;
        }

        /* 모달 width 변경 */
        .modal-content {
						width: 400px !important; 
				}

        #modal-reason::placeholder {
            color: red;
        }
		</style>

    <!-- FullCalendar -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
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
														<h1>비품/시설 예약</h1> 
												</div>

												<br><br>
												
												<div id="left">

                            <select style="width: 200px;" id="classification-select" onchange="onClassificationChange()"> 
                                <option disabled selected>구분(선택필요)</option>
                                <option>비품</option>
                                <option>시설</option>  
                            </select>

                            <select style="width: 200px;" id="category-select" onchange="onCategoryChange()"> 
                                <%-- option은 onClassificationChange()로 추가 --%>
                            </select>

                            <br><br>

                            <select style="width: 400px;" id="number-name">
                                <%-- option은 onCategoryChange()로 추가 --%>
                            </select>

                            <br><br>

                            <button type="button" onclick="selectDetail()">상세 조회 요청</button>
												</div>

										</div>
										<!-- top-child1 끝 -->

										<!-- top-child2 시작 -->
										<div id="top-child2">
												<div id="top-child2-1">
														<span id="detailClassification1"></span>&nbsp;상세 조회창
												</div>

                        <div id="top-child2-2">
                            <div id="top-child2-2-1">
                                <%-- <img src="${contextPath}/images/equipment/HP K110.jpg" id="equip-img"> --%>
                                <%-- <img src="/upload/Equipment/20241124/3792e018404c4440aed8a313c5773d32.jpg" id="equip-img"> --%>
                                <img id="equip-img">
                            </div>
                            <div id="top-child2-2-2">
                                <table id="detail-table">
                                    <tr>
                                        <td style="width: 65px;">구분</td>
                                        <td id="detailClassification2"></td>
                                    </tr>
                                    <tr>
                                        <td>분류</td>
                                        <td id="datailCategory"></td>
                                    </tr>
                                    <tr>
                                        <td>번호</td>
                                        <td id="detailNumber"></td>
                                    </tr>
                                    <tr>
                                        <td>이름</td>
                                        <td id="detailName"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

										</div>
										<!-- top-child2 끝 -->

								</div>


								<br><br><br>

								<div style="margin-left: 80px; margin-right: 80px;">
										<h2>예약일정</h2>
										<br><br>

                    <div id="calendar" style="width: 80%; margin: 0 auto;">


                    </div>

								</div>


						</div>
				</div>
		</div>            
		<!-- main-content 끝 -->


	<!-- 예약 modal 시작-->
	<div class="modal fade" id="reservation-modal">
      <div class="modal-dialog modal-sm">
          <div class="modal-content" >

              <form action="${contextPath}/reservation/reserve" method="post" id="modal-form">
                  <div class="modal-body">   
                      <div>
                          <table>
                              <tr>
                                  <th style="text-align: center; height: 50px; font-size: 20px;" colspan="2">예약</th>
                              </tr>
                              <tr>
                                  <td style="width: 120px;">구분</td>
                                  <td style="width: 280px;"><input type="text" class="form-control" name="classification" readonly id="modal-classification"></td>
                              </tr>
                              <tr>
                                  <td>분류</td>
                                  <td><input type="text" class="form-control" readonly id="modal-category"></td>
                              </tr>
                              <tr>
                                  <td>번호</td>
                                  <td><input type="text" class="form-control" name="number" readonly id="modal-number"></td>
                              </tr>
                              <tr>
                                  <td>이름</td>
                                  <td><input type="text" class="form-control" readonly id="modal-name"></td>
                              </tr>
                              <tr>
                                  <td>예약희망일</td>
                                  <td><input type="text" class="form-control" name="date" readonly id="modal-date"></td>
                              </tr>
                              <tr>
                                  <td>예약사유</td>
                                  <td><input type="text" class="form-control" name="reason" id="modal-reason" placeholder="입력 필수" required></td>
                              </tr>
                          </table>

                          <br>

                          <button type="button" onclick="checkAvailability()">예약 가능 여부 조회</button> 
                          <span id="modal-result"></span>
                          <br>
                          <button type="button" onclick="reserveButton()">예약하기</button>
                      </div>
  
                  </div>
              </form>
          
          </div>
      </div>
  </div>
  <!-- 예약 modal 끝 -->


	<script>

      // 사용자가 구분 select를 선택한 경우 실행되는 함수
      function onClassificationChange(){

        const $classificationVal = $('#classification-select').val(); // 선택된 구분 값(비품 | 시설)
        const $categorySelectEl = $('#category-select');              // 카테고리 select 요소
        $categorySelectEl.empty(); // 기존 옵션 초기화

        $.ajax({
            // 요청
            url: "${contextPath}/reservation/selectCategory",
            data: "classification=" + $classificationVal, // 쿼리스트링으로 전달값 작성
            type: "get",

            // 응답
            success: function(resData){
                console.log('resData 값 : ' + resData);  // List<String> 형태로 JSON 배열

                $categorySelectEl.append('<option disabled selected>분류(선택필요)</option>');

                resData.forEach(function(category) {
                    $categorySelectEl.append('<option>' + category + '</option>');
                });
            },
            error: function(){
                console.log('카테고리 데이터를 가져오는 중 오류 발생');
            }
        })

      }

      // 사용자가 분류 select를 선택한 경우 실행되는 함수
      function onCategoryChange(){

          const $classificationVal = $('#classification-select').val(); // 선택된 구분 값(비품 | 시설)
          const $categoryVal = $('#category-select').val(); // 선택된 카테고리(전체, 노트북, 키보드, 회의실, 강당 등)

          const $numberNameEl = $('#number-name'); // 상세 항목 select 요소
          $numberNameEl.empty(); // 기존 옵션 초기화

          $.ajax({
              // 요청
              url: "${contextPath}/reservation/selectDetailList",
              data: "classification=" + $classificationVal + "&category=" + $categoryVal, // 쿼리스트링으로 전달값 작성
              type: "get",

              // 응답
              success: function(resData){

                  // Map<String, Object>에 List<EquipmentDto> 혹은 List<FacilityDto>가 담긴다.
                  console.log('resData 값 :', JSON.stringify(resData, null, 2));  

                  // 상세 항목 select 요소에 option 값 채워서 생성하기
                  if ($classificationVal === '비품') {
                      resData.equipmentList.forEach(function(dto) {
                          $numberNameEl.append('<option>(' + dto.equipNo + ')' + dto.equipName + '</option>');
                      });
                  } else if ($classificationVal === '시설') {
                      resData.facilityList.forEach(function(dto) {
                          $numberNameEl.append('<option>(' + dto.facilityNo + ')' + dto.facilityName + '</option>');
                      });
                  }

              },
              error: function(){
                  console.log('상세 항목 데이터를 가져오는 중 오류 발생');
              }
          })

      } 
     


			// "상세 조회 요청" 버튼 클릭시 실행되는 함수
			function selectDetail(){

          const $classificationVal = $('#classification-select').val(); // 선택된 구분 값(비품 | 시설)
          const $categoryVal = $('#category-select').val(); // 선택된 카테고리(전체, 노트북, 키보드, 회의실, 강당 등)
          const $numberName = $('#number-name').val(); // (비품번호)비품명 | (시설번호)시설명

          const number = $numberName.substring( $numberName.indexOf('(') + 1, $numberName.indexOf(')') ); // 괄호 안의 번호
          const name = $numberName.substring( $numberName.indexOf(')') + 1 ); 


          $("#detailClassification1").text($classificationVal); // 구분 (비품/시설)
					$("#detailClassification2").text($classificationVal); // 구분 (비품/시설)
					$("#datailCategory").text($categoryVal);              // 분류
					$("#detailNumber").text(number);                      // 번호
					$("#detailName").text(name);                          // 이름
					$('#top-child2').show(); // 수정창 요소가 보여지게 하기
				
          
					if($classificationVal === '시설') { // 시설은 개별 이미지가 없다. 기본 이미지 띄우기.
							$('#equip-img').attr('src', "${contextPath}/images/facility.jpg");
					}

					if ($classificationVal === '비품') {
							$.ajax({
									url: "${contextPath}/equipmentAndFacility/selectFileURL", // 비품번호로 비품 첨부파일 정보 불러오기
									type: "get",
									data: "equipNo=" + number,

									success: function(resData){
											console.log(resData);

											$('#equip-img').attr('src', resData);
									},
									error: function(){
											alert('비품 이미지 파일 정보 조회 실패');
									}
							});
					}
         
			}

      // FullCalendar
      document.addEventListener('DOMContentLoaded', function() {
          var calendarEl = document.getElementById('calendar');

          var calendar = new FullCalendar.Calendar(calendarEl, {
              initialView: 'dayGridMonth',

              headerToolbar: {
                  left: 'prev',
                  center: 'title',
                  right: 'next'
              },

              dateClick: function(info) { // 일자 셀 클릭 함수

                  // 오늘 이전 날짜는 선택 안되게끔.
                  const clickedDate = new Date(info.dateStr); // 클릭한 날짜
                  const today = new Date(); // 오늘 날짜
                  today.setHours(0, 0, 0, 0); // 시간을 00:00:00으로 설정

                  if (clickedDate < today) {
                      alert('오늘 이전 날짜는 선택할 수 없습니다.');
                      return;
                  }


                  // alert(info.dateStr); // 클릭한 날짜 (문자열 형식, 예: '2024-11-01')

                  const topChild2 = document.getElementById('top-child2'); // top-child2 요소

                  // top-child2 상태 확인
                  if (topChild2.style.display === 'none' || window.getComputedStyle(topChild2).display === 'none') {
                      alert('먼저 상세 조회를 해주세요.');
                  } else {

                      const classification = $("#detailClassification2").text(); // 구분 (비품/시설)
                      const category = $("#datailCategory").text();              // 분류
                      const number = $("#detailNumber").text();                  // 번호
                      const name = $("#detailName").text();                      // 이름

                      $('#modal-classification').val(classification);
                      $('#modal-category').val(category);
                      $('#modal-number').val(number);
                      $('#modal-name').val(name);
                      $('#modal-date').val(info.dateStr);
                      $('#modal-reason').val(''); // 예약 사유 초기화
                      $('#modal-result').text(''); // 예약 가능 여부 초기화
                      $('#reservation-modal').modal('show');
                  }
              }

          });

          calendar.render();
      });


      function checkAvailability(){
          $.ajax({
              url: "${contextPath}/reservation/checkAvailability",
              type: 'post',
              data: JSON.stringify( { // json 객체(자바스크립트 객체) => json 문자열 변환
                classification: $('#modal-classification').val(),
                date:  $('#modal-date').val(),
                reason: $('#modal-reason').val(),
                number: $('#modal-number').val(),
              }),
              contentType: 'application/json',

              success: function(resData){ // "예약 가능" | "예약 불가능"
                console.log(resData);
                $('#modal-result').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + resData);

                if(resData === '예약 가능'){
                    $('#modal-result').css({
                        'color': 'blue',
                        'font-weight': 'bold'
                    });
                }else if(resData === '예약 불가능'){
                    $('#modal-result').css({
                        'color': 'red',
                        'font-weight': 'bold'
                    });
                }
              
              },
              error: function(){
                console.log("예약 가능 여부 조회 ajax 통신 실패");
              }
          })
      }

      function reserveButton(){

          // console.log($('#modal-result').text().trim()); // trim()으로 &nbsp;를 제거해야 한다.

          if($('#modal-result').text().trim() === '예약 불가능'){

              alert('예약이 불가능합니다. 다른 날짜를 선택해주세요.');

          }else if($('#modal-result').text().trim() === '예약 가능'){

              const reasonField = $('#modal-reason');
            
              if (!reasonField.val().trim()) {
                  alert('예약 사유를 입력해주세요.');
                  reasonField.focus(); // 입력 필드로 포커스 이동
                  return;
              }

              $('#modal-form').submit();
          }

      }

	</script>


	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->


</body>
</html>