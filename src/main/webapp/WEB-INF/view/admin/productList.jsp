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
	<form>
		<table class="table">
			<thead>
				<tr class="trhead">
					<th>제품번호</th>
					<th>제품코드</th>
					<th>상품이름</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="products" items="${productList}">
					<tr>
						<td>${products.productNo }</td>
						<td>${products.categoryCode }</td>
						<td>${products.productName }</td>
						<td>${products.price}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
<script>
	
</script>
</html>