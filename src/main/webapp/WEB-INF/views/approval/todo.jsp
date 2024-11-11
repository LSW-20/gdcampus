<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구매품의서</title>
    <style type="text/css">
        #divCustomWrapper {
            word-break: break-all;
            font-family: malgun gothic, dotum, arial, tahoma;
            font-size: 9pt;
            width: 800px !important;
        }
        #divCustomWrapper * {
            max-width: 800px !important;
        }
        #divCustomWrapper #titleSection {
            text-align: center;
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 10px !important;
            margin-top: 20px !important;
        }
        #divCustomWrapper .detailSection {
            border-collapse: collapse;
            table-layout: fixed;
            width: 100%;
        }
        #divCustomWrapper td {
            border: 1px solid black;
            padding: 3px;
        }
        .subjectColumn {
            background: rgb(221, 221, 221);
            font-weight: bold;
            text-align: center;
        }
        .detailColumn {
            text-align: left;
        }
        .centerCol {
            text-align: center;
        }
        .rightCol {
            text-align: right;
        }
        .areaCol {
            height: 120px;
            vertical-align: top;
        }
        .sum_cur {
            text-align: right;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            function addRow() {
                var table = document.getElementById('dynamic_table1');
                var newRow = table.querySelector('.copyRow1').cloneNode(true);
                newRow.classList.remove('copyRow1');
                newRow.classList.add('copiedRow');
                newRow.querySelectorAll('input').forEach(function(input) {
                    input.value = '';
                });
                table.appendChild(newRow);
                updateRowNumbers();
            }

            function deleteRow() {
                var table = document.getElementById('dynamic_table1');
                var rows = table.querySelectorAll('.copiedRow');
                if (rows.length > 0) {
                    table.removeChild(rows[rows.length - 1]);
                }
                updateRowNumbers();
            }

            function updateRowNumbers() {
                var rows = document.querySelectorAll('#dynamic_table1 .copiedRow, #dynamic_table1 .copyRow1');
                rows.forEach(function(row, index) {
                    row.querySelector('td').textContent = index + 1;
                });
            }

            document.getElementById('plus1').addEventListener('click', addRow);
            document.getElementById('minus1').addEventListener('click', deleteRow);
        });
    </script>
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
                <div class="container-fluid">
                    <div id="divCustomWrapper">
                        <!-- Title Section -->
                        <div id="titleSection">구매품의서</div>

                        <!-- Draft Section -->
                        <div class="partition" id="draftSection">
                            <div class="inaRowRight">
                                <span class="comp_wrap">
                                    <span class="sign_type1_inline">
                                        <span class="sign_tit_wrap"><strong>기안</strong></span>
                                        <span class="sign_member_wrap"><span class="sign_member">&nbsp;</span></span>
                                    </span>
                                </span>
                                <span class="comp_wrap">
                                    <span class="sign_type1_inline">
                                        <span class="sign_tit_wrap"><strong>승인</strong></span>
                                        <span class="sign_member_wrap"><span class="sign_member">&nbsp;</span></span>
                                        <span class="sign_member_wrap"><span class="sign_member">&nbsp;</span></span>
                                        <span class="sign_member_wrap"><span class="sign_member">&nbsp;</span></span>
                                    </span>
                                </span>
                            </div>
                        </div>

                        <!-- Detail Section -->
                        <div class="viewModeHiddenPart td_button">
                            <a class="button" id="plus1">추가</a>
                            <a class="button" id="minus1">삭제</a>
                        </div>                        
                        <table id="dynamic_table1" class="detailSection">
                            <tr>
                                <td colspan="2" class="subjectColumn">담당 부서</td>
                                <td class="detailColumn">기안부서</td>
                                <td rowspan="3" class="subjectColumn">납품자</td>
                                <td colspan="3" class="detailColumn"><input type="text" /></td>
                                <td class="subjectColumn">작성 일자</td>
                                <td colspan="2" class="detailColumn">기안일</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="subjectColumn">프로젝트 번호</td>
                                <td class="detailColumn"><input type="text" /></td>
                                <td class="detailColumn centerCol">TEL:</td>
                                <td colspan="2" class="detailColumn"><input type="text" /></td>
                                <td class="subjectColumn">인도장소</td>
                                <td colspan="2" class="detailColumn"><input type="text" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="subjectColumn">사용 목적</td>
                                <td class="detailColumn"><input type="text" /></td>
                                <td class="detailColumn centerCol">FAX:</td>
                                <td colspan="2" class="detailColumn"><input type="text" /></td>
                                <td class="subjectColumn">희망 납기 일자</td>
                                <td colspan="2" class="detailColumn"><input type="text" class="ipt_editor_date" /></td>
                            </tr>
                            <tr>
                                <td class="subjectColumn">품번</td>
                                <td colspan="2" class="subjectColumn">품명</td>
                                <td class="subjectColumn">규격</td>
                                <td class="subjectColumn">단위</td>
                                <td class="subjectColumn">수량</td>
                                <td class="subjectColumn">단가</td>
                                <td class="subjectColumn">금액</td>
                                <td class="subjectColumn">비고</td>
                            </tr>
                            <tr class="copyRow1">
                                <td class="detailColumn">1</td>
                                <td colspan="2" class="detailColumn"><input type="text" /></td>
                                <td class="detailColumn"><input type="text" /></td>
                                <td class="detailColumn"><input type="text" /></td>
                                <td class="detailColumn amount"><input type="text" /></td>
                                <td class="detailColumn price"><input type="text" /></td>
                                <td class="detailColumn cur">&nbsp;</td>
                                <td class="detailColumn"><input type="text" /></td>
                            </tr>
                            <tr class="subjectColumn">
                                <td colspan="7">합계</td>
                                <td class="sum_cur"></td>
                            </tr>
                            <tr class="subjectColumn">
                                <td colspan="10">구매사유 (구체적 작성)</td>
                            </tr>
                            <tr>
                                <td colspan="10" class="areaCol"><textarea></textarea></td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <!-- main-content 끝 -->
    </div>
    <!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>
