<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h3>게시판관리</h3>
<table class="table">
	<thead>
		<tr>
			<th scope="col">게시글번호</th>
			<th scope="col">제목</th>
			<th scope="col">내용</th>
			<th scope="col">작성일</th>
			<th>#</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="board" items="${list }">
		<tr>
			<th scope="row">${board.boardNo }</th>
			<td>${board.title }</td>
			<td>${board.content }</td>
			<td><fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd" /></td>
			<td><button>주문 상세</button></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<script>
let tr = document.querySelectorAll('tbody tr').forEach(function(number) {
	number.addEventListener('click', function(e){
		let th = e.target.parentElement.children[0].innerText;
		console.log(th); //fetch로 글번호 넘겨서 페이지 이동
	})
});
</script>
