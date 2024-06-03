<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<style>
h3 {
	padding-left: 50px;
}

.center {
	margin-top: 30px;
	padding-bottom: 50px;
}

.row {
	padding-left: 70px;
}

.trhead, tbody tr {
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<thead>
			<tr class="trhead">
				<th>유저ID</th>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>가입일</th>
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