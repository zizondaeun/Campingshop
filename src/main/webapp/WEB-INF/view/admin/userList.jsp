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
	<h3>유저목록</h3>
	<!-- <div class="center">
	<form action="userList.do">
		<div class="row">
			<div class="col-sm-4">
				<select name="searchCondition" class="form-control">
					<option value="">선택하세요.</option>
					<option value="T" ${searchCondition  == 'T' ? 'selected' : '' }>유저ID</option>
					<option value="W" ${searchCondition  == 'W' ? 'selected' : '' }>이름</option>
					<option value="TW" ${searchCondition  == 'TW' ? 'selected' : '' }>유저ID
						&이름</option>
				</select>
			</div>
			<div class="col-sm-6">
				<input type="text" name="keyword" value="${keyword }"
					class="form-control">
			</div>
			<div class="col-sm-2">
				<input type="submit" value="조회" class="btn btn-primary">
			</div>
		</div>
	</form>
</div>
 -->
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
					<td>
						<button class="delBtn" onclick="delUser()">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
 		function delUser(){
			if(confirm("유저를 삭제하시겠습니까?")){
				delRow(event);
				alert("삭제되었습니다.")
			} 
		} 
		 
	function delRow(){
			let tr = event.target;
			console.log(tr);
			tr.parentElement.parentElement.remove();
			
		}
	</script>
</body>
</html>