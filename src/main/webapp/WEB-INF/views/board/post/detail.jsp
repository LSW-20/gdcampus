<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<meta charset="utf-8" />
        <title>Invoice List | Drezon - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- bootstrap-datepicker css -->
        <link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

        <!-- DataTables -->
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <!-- Responsive datatable examples -->
        <link href="assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" /> 

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
        
</head>
<body data-topbar="dark" data-sidebar="dark">
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
                <div class="container border p-5 m-4 rounded">
                    <h2 class="m-4">게시글 상세</h2>
                    <br>
                    <a class="btn btn-secondary" style="float:right" href="${contextPath}/board/post/list">목록으로</a>
                    <br><br>

                    <!-- 게시글 정보 테이블 -->
                    <table align="center" class="table">
                        <tr>
                            <th width="120">제목</th>
                            <td colspan="3">${p.postTitle}</td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td width="400">${p.writerName}</td>
                            <th width="120">작성일</th>
                            <td>${p.registDate}</td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3">
                                <c:forEach var="attachDto" items="${attachList}">
                                    <a href="${contextPath}${attachDto.filePath}/${attachDto.filesystemName}" download="${attachDto.originalName}">
                                        ${attachDto.originalName}
                                    </a>
                                    <br>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                            </td>
                        </tr>
                         <tr>
                            <th>내용</th>
                            <td colspan="4">
                                <p style="height:150px">${p.postContent}</p>
                            </td>
                        </tr>
                    </table>
                    <br>

                    <!-- 수정 및 삭제 버튼 -->
                    <c:if test="${loginUser.userName eq p.writerName}">
                        <div align="center">
                            <form id="frm" action="" method="post">
                                <input type="hidden" name="no" value="${p.postNo}">
                                <button type="submit" class="btn btn-primary" onclick="$('#frm').attr('action', '${contextPath}/board/post/modify');">수정하기</button>
                                <button type="submit" class="btn btn-danger" onclick="$('#frm').attr('action', '${contextPath}/board/post/delete');">삭제하기</button>
                            </form>
                        </div>
                    </c:if>
                    <br><br>

                    <!-- 댓글 영역 -->
                    <table id="comment_area" class="table" align="center">
                        <thead>
                            <tr>
                                <c:choose>
                                    <c:when test="${empty loginUser}">
                                        <th colspan="2" width="650">
                                            <textarea class="form-control" rows="2" style="resize:none; width:100%" readonly>로그인 후 이용가능한 서비스 입니다.</textarea>
                                        </th>
                                        <th style="vertical-align: middle">
                                            <button class="btn btn-secondary disabled">등록하기</button>
                                        </th>
                                    </c:when>
                                    <c:otherwise>
                                        <th colspan="2" width="650">
                                            <textarea id="post_content" class="form-control" rows="2" style="resize:none; width:100%"></textarea>
                                        </th>
                                        <th style="vertical-align: middle">
                                            <button class="btn btn-secondary" onclick="fn_insertComment();">등록하기</button>
                                        </th>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                            <tr>
                                <td colspan="3">댓글 (<span id="rcount">0</span>)</td>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                    <!-- 댓글 관련 스크립트 -->
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script>
                        $(document).ready(function () {
                            fn_commentList();
                        });

                        // 댓글 목록 조회 함수
                        function fn_commentList() {
                            $.ajax({
                                url: '${contextPath}/board/post/clist',
                                data: "no=" + '${p.postNo}',
                                success: function (resData) {
                                    console.log(resData);
                                    $("#rcount").text(resData.length);
                                    let tr = "";
                                    for (let i = 0; i < resData.length; i++) {
                                        tr += "<tr>" + resData[i].comment_no + "</th>" +
                                              "<th>" + resData[i].commentWriter + "</th>" +
                                              "<td>" + resData[i].comment + "</td>" +
                                              "<td>" + resData[i].registDate + "</td>" +
                                              "</tr>";
                                    }
                                    $("#comment_area tbody").html(tr);
                                }
                            });
                        }

                        // 댓글 등록 함수
                        function fn_insertComment() {
                            $.ajax({
                                url: '${contextPath}/board/post/cinsert',
                                type: 'post',
                                data: {
                                    comment: $("#post_content").val(),
                                    postNo: '${p.postNo}'
                                },
                                success: function (resData) {
                                    if (resData === "SUCCESS") {
                                        fn_commentList();
                                        $("#post_content").val("");
                                    } else {
                                        alert("댓글 작성 실패");
                                    }
                                }
                            });
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
