<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h3 align="center">MY BOARD</h3>
<table class="table">
	<thead>
		<tr>
			<th scope="col">NO</th>
			<th scope="col">BOARD</th>
			<th scope="col">TITLE</th>
			<th scope="col">CONTENT</th>
			<th scope="col">DATE</th>
			<!-- <th>#주문상세</th> -->
		</tr>
	</thead>
	<tbody>
	<c:forEach var="board" items="${list }">
		<tr>
			<th scope="row">${board.boardNo }</th>
			<td><a href="#" style="text-decoration:none"><font color="black">QnA</font></a></td>
			<td>${board.title }</td>
			<td>${board.content }</td>
			<td><fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd" /></td>
			<!-- <td><button>주문 상세</button></td> -->
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
