<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<thead>
			<tr class="trhead">
				<th>상품 카테고리</th>
				<th>상품명</th>
				<th>할인적용가격</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="users" items="${userList}">
				<tr>
					<td>${users.userId }</td>
					<td>${users.userName }</td>
					<td>${users.userTel }</td>
					<td>${users.email }</td>
					<td>${users.hireDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>