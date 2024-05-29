
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
</style>
<h3 align="center">Q&A</h3>

<div class="table-container">
	<div align="right">
		<button type="submit" class="btn btn-dark" id="modBtn" style="margin-bottom: 10px; background-color: white; 
    		color: black; border: 1px solid black;">WRITE</button>
	</div>
	<table class="table">
		<thead class="table-header">
			<tr>
				<th scope="col">NO</th>
				<th scope="col"></th>
				<th scope="col">TITLE</th>
				<th scope="col">WRITER</th>
				<th scope="col">DATE</th>
			</tr>
		</thead>
		<tbody class="table-body">
			<c:forEach var="board" items="${boardList }">
				<tr>
					<td>${board.boardNo }</td>
					<td><div><img src="productImg/게시판잠금이미지.gif"></div></td>
					<td><a href="boardInfoPw.do?bno=${board.boardNo }&userId=${board.userId }"><font color="#6c757d">${board.title }</font></a></td>
					<td>${board.userId }</td>
					<td><fmt:formatDate value="${board.createDate }" pattern="yyyy/MM/dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<hr />
<div class="center">
	<form action="boardList.do">
		<div class="row" align="right">
			<div class="col-sm-2">
				<select name="searchCondition" class="form-control">
					<option value="">선택하세요</option>
					<option value="T" ${searchCondition == 'T' ? 'selected' : '' }>제목</option>
					<option value="W" ${searchCondition == 'W' ? 'selected' : '' }>작성자</option>
					<option value="TW" ${searchCondition == 'TW' ? 'selected' : '' }>제목 & 작성자</option>
				</select>
			</div>
			<div class="col-sm-5">
				<input type="text" name="keyword" value="${keyword }" class="form=control">
			</div>
			<div class="col-sm-2">
				<input type="submit" value="SEARCH" class="btn btn-primary">
			</div>
		</div>
	</form>
</div>
	<div class="center">
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${paging.prev }">
				<!-- 이전페이지 여부 체크 -->
				<li class="page-item"><a class="page-link" href="boardList.do?page=${paging.startPage - 1}"><span>&laquo;</span></a></li>
			</c:if>

			<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
				<li class="${p == paging.page ? 'page-item active' : 'page-item'}"><a class="page-link" href="boardList.do?page=${p}"><span>${p}</span></a></li>
			</c:forEach>

			<c:if test="${paging.next }">
				<!-- 이후페이지 여부 체크 -->
				<li class="page-item"><a class="page-link" href="boardList.do?page=${paging.endPage + 1}"><span>&raquo;</span></a></li>
			</c:if>
			</ul>
		</nav>
	</div>
</div>
<script>
</script>


