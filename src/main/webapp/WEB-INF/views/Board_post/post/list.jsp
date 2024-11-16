<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #boardList th, #boardList td:not(:nth-child(2)){text-align: center;}
    #boardList>tbody>tr:hover{cursor:pointer;}
</style>
</head>
<body>

	<div class="container p-3">

        <!-- Header, Nav start -->
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <!-- Header, Nav end -->
    
        <!-- Section start -->
        <section class="row m-3" style="min-height: 500px">
    
          <div class="container border p-5 m-4 rounded">
            <h2 class="m-4">게시글 목록</h2>
            <br>

            <c:if test="${ not empty loginUser }">
	            <a class="btn btn-secondary" style="float:right" href="${ contextPath }/board/regist.do">글쓰기</a>
	            <br>
            </c:if>
            
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th width="100px">번호</th>
                    <th width="400px">제목</th>
                    <th width="120px">작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th>첨부파일</th>
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
                    	<c:forEach var="b" items="${ list }">
		                    <tr onclick='location.href = "${contextPath}/board/${ loginUser.userId eq b.boardWriter ? "detail.do" : "increase.do" }?no=${ b.boardNo }";'>
		                        <td>${ b.boardNo }</td>
		                        <td>${ b.boardTitle }</td>
		                        <td>${ b.boardWriter }</td>
		                        <td>${ b.count }</td>
		                        <td>${ b.registDt }</td>
		                        <td>${ b.attachCount > 0 ? '★' : '' }</td>
		                    </tr>
                  		</c:forEach>
                  	</c:otherwise>
                  </c:choose>  
                </tbody>
            </table>
            <br>

            <ul id="paging_area" class="pagination d-flex justify-content-center">
            
              <li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
              	<a class="page-link" href="${ contextPath }/board/list.do?page=${pi.currentPage-1}">Previous</a>
              </li>
              
              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              	<li class="page-item ${ pi.currentPage == p ? 'active' : '' }">
              		<a class="page-link" href="${ contextPath }/board/list.do?page=${p}">${ p }</a>
              	</li>
              </c:forEach>
              
              <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
              	<a class="page-link" href="${ contextPath }/board/list.do?page=${pi.currentPage+1}">Next</a>
              </li>
              
            </ul>
           
            <br clear="both"><br>
            
            <form id="search_form" action="${ contextPath }/board/search.do" method="get" class="d-flex justify-content-center">
                <input type="hidden" name="page" value="1">
                <div class="select" >
                    <select class="custom-select" name="condition">
                        <option value="user_id">작성자</option>
                        <option value="board_title">제목</option>
                        <option value="board_content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword" value="${ search.keyword }">
                </div>
                <button type="submit" class="search_btn btn btn-secondary">검색</button>
            </form>
            <c:if test="${ not empty search }">
	            <script>
	            	$(document).ready(function(){
	            		$("#search_form select").val('${search.condition}');
	            		
	            		// 검색후의 페이징바 클릭시 검색 form 을 강제로 submit 
	            		// (단, 페이지번호는 현재 클릭한 페이지번호로 바꿔서)
	            		$("#paging_area a").on("click", function(){
	            			
	            			let page = $(this).text(); // Previous | Next | 페이지번호
	            			if(page == 'Previous'){
	            				page = ${pi.currentPage - 1};
	            			}else if(page == 'Next'){
	            				page = ${pi.currentPage + 1};
	            			}
	            			
	            			$("#search_form input[name=page]").val(page);
	            			$("#search_form").submit();
	            			
	            			return false; // 기본이벤트(href='/board/list.do' url요청)가 동작 안되도록
	            			
	            		})
	            	})
	            </script>
            </c:if>
          
          </div>
    
        </section>
        <!-- Section end -->
    
        <!-- Footer start -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        <!-- Footer end -->
    
    </div>

</body>
</html>