<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
	width: 300px;
	heitht: 300px;
	border: 1px solid black;
}

p {
	text-align: center;
}

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
</head>
<script>
	window.onload = function() {
		var name = document.querySelector('#product_name');
		function check() {
			if (name.value == '') {
				alret('상품명을 입력해주세요!');
				return false;
				nameVal.select();
				nameVal.focus();
			}
		}
	}
</script>
<body>
	<form action="addProduct.do" method="post"
		enctype="multipart/form-data">

		<table class="table">
			<tr>
				<th>카테고리 선택</th>
				<td><select id="selcategory" name="category">
						<option disabled>-----선택-----</option>
						<c:forEach var="item" items="${categoryList }">
							<option ${empty item.pre_category ? 'disabled': ''}
								value="${item.category_code }">${item.category_name }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" id="product_name" name="productTitle"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" id="product_price" name="productPrice"></td>
			</tr>
			<tr>
				<th>상품이미지</th>
				<td><input class="imgBtn" type="file" name="productImg"></td>
			</tr>
			<tr>
				<th>상품상세이미지1</th>
				<td><input class="imgBtn" type="file" name="productImg2"></td>
			</tr>
			<tr>
				<th>상품설명1</th>
				<td><input class="productExplain" type="file" name="explainImg1"></td>
			</tr>
			<tr>
				<th>상품상세이미지2</th>
				<td><input class="imgBtn" type="file" name="productImg3"></td>
			</tr>
			<tr>
				<th>상품설명2</th>
				<td><input class="productExplain" type="file" name="explainImg2"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" id="regist" value="등록"
					onclick="check()"></td>
			</tr>
		</table>
	</form>
</body>
</html>