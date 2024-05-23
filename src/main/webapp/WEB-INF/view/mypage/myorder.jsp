<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h3 align="center">MY ORDER</h3>
<table class="table">
	<thead>
		<tr>
			<th scope="col">NO</th>
			<th scope="col">BOARD</th>
			<th scope="col">TITLE</th>
			<th scope="col">CONTENT</th>
			<th scope="col">DATE</th>
			<th scope="col">DETAIL</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="board" items="${list }">
		<tr>
			<th scope="row">${board.boardNo }</th>
			<td><a href="#" style="text-decoration:none"><font color="#6c757d">QnA</font></a></td>
			<td><a href="myBoardInfo.do?bno=${board.boardNo }" style="text-decoration:none"><font color="black">${board.title }</font></a></td>
			<td><a href="myBoardInfo.do?bno=${board.boardNo }" style="text-decoration:none"><font color="black">${board.content }</font></a></td>
			<td><fmt:formatDate value="${board.createDate }" pattern="yyyy/MM/dd" /></td>
			<td><button>주문 상세</button></td>
		</tr>
	</c:forEach>
	</tbody>
</table>