<%@ page import="com.camcam.notice.vo.NoticeVO"%> <!-- NoticeVO import 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.table-container {
    width: 70%; 
    margin: 0 auto; 
    border: 1px solid #ccc;
    padding: 20px;
}
.table {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed; /* 테이블의 고정 레이아웃을 설정 */
}
.table-header th {
    border-bottom: 2px solid #ccc;
    padding: 10px;
    text-align: center;
}
.table-body td {
    border-bottom: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}
.table-body td.title {
    text-align: left;
}
.table-body td a {
    color: #6c757d;
    text-decoration: none;
}
.table-body td div img {
    width: 13px;
    height: 13px;
}
.table th.no, .table td.no {
    width: 10%; /* NO 열 너비 */
}
.table th.content, .table td.content {
    width: 50%; /* content 열 너비 */
}
.table th.title, .table td.title {
    width: 20%; /* TITLE 열 너비 */
}
.table th.writer, .table td.writer {
    width: 20%; /* WRITER 열 너비 */
}
</style>
<h3 align="center">공지사항</h3>
<div class="table-container">
    <div align="right">
        <button type="submit" class="btn btn-dark" id="modBtn" style="margin-bottom: 10px; background-color: white; 
            color: black; border: 1px solid black;">WRITE</button>
    </div>
    <table class="table">
        <thead class="table-header">
            <tr>
                <th class="no" scope="col">NO</th>
                <th class="content" scope="col">content</th>
                <th class="writer" scope="col">WRITER</th>
            </tr>
        </thead>
        <tbody class="table-body">
            <c:forEach var="notice" items="${noticeList }"> <!-- board -> notice로 수정 -->
                <tr>
                    <td class="no">${notice.noticeNo }</td>
                    <td class="content">${notice.noticeSubject }</td>
                    <td class="writer">${notice.noticeDate }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="center">
        <nav>
            <ul class="pagination justify-content-center">
            <c:if test="${paging.prev }">
                <!-- 이전페이지 여부 체크 -->
                <li class="page-item"><a class="page-link" href="myBoardList.do?page=${paging.startPage - 1}"><span>&laquo;</span></a></li>
            </c:if>

            <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                <li class="${p == paging.page ? 'page-item active' : 'page-item'}"><a class="page-link" href="myBoardList.do?page=${p}"><span>${p}</span></a></li>
            </c:forEach>

            <c:if test="${paging.next }">
                <!-- 이후페이지 여부 체크 -->
                <li class="page-item"><a class="page-link" href="myBoardList.do?page=${paging.endPage + 1}"><span>&raquo;</span></a></li>
            </c:if>
            </ul>
        </nav>
    </div>
</div>
<script></script>
