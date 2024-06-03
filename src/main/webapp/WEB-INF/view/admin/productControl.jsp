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
	<form>
		<table class="table">
			<thead>
				<tr class="trhead">
					<th>제품번호</th>
					<th>제품코드</th>
					<th>상품이름</th>
					<th>가격</th>
					<th>상품삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="products" items="${productList}">
					<tr>
						<td>${products.productNo }</td>
						<td>${products.categoryCode }</td>
						<td>${products.productName }</td>
						<td>${products.price}</td>
						<td><input type="button" value="삭제" class="delBtn" ></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
<script>	
	function del(){
		let delBtn = document.querySelectorAll('.delBtn');
		let tr = document.querySelectorAll('tbody tr');
		for(let i=0; i<delBtn.length; i++){
			delBtn[i].addEventListener('click', function(){
				tr[i].style.display = 'none';
			})
		}
	
	}
	del();
</script>
</html>