<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.table-container {
	width: 80%;
	margin: 0 auto;
	border: 1px solid #ccc;
	padding: 20px;
}

.order {
	border: 1px solid grey;
	padding: 20px;
	font-size: 20px;
	background-color: white;
	color: black;
	text-decoration: none;
	display: inline-block;
	margin-top: 20px;
}

.order:hover {
	background-color: #f0f0f0;
}
</style>

<h3 align="center">MY WISHLIST</h3>
<div class="table-container">
	<div class="description">
		<span
			style="display: inline-block; width: 100%; font-size: 15px; padding: 10px; text-align: right;">
			<span id=""></span>님의 관심 상품 목록입니다.
		</span>
	</div>
	<table class="table">
		<thead class="table-header">
			<tr>
				<th scope="col"><input type="checkbox"></th>
				<th scope="col">사진</th>
				<th scope="col">상품명</th>
				<th scope="col">수량</th>
				<th scope="col">가격</th>
				<th scope="col">장바구니</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody class="table-body">
			<c:choose>
				<c:when test="${empty list}">
					<tr align="center">
						<td colspan="7">조회된 결과가 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="wish" items="${list }">
						<tr>
							<td><input type="checkbox"></td>
							<td><img src="img/imgData/아웃도어라인/체어/${wish.productImg }"
								width="100" height="100" />${wish.productImg }</td>
							<td>${wish.productName }</td>
							<td><input type="number" name="cnt" value="1" min="1"
								max="1" step="1">개</td>
							<td>${wish.price }원</td>
							<td><button type="button" id="cartBtn">CART</button></td>
							<td><button type="button" id="delBtn">DELETE</button></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div align="center">
		<a href="#" class="order">주문하기</a>
	</div>
</div>
<script>
	/* 	function checkAll(e){
	 const checkboxs = document.querySelectorAll('input[type="checkbox"]');
	 console.log(checkboxs);
	
	 } */
	let btns = document.querySelectorAll('#delBtn');
	console.log(btns); //이거는 가져왔어
	btns.forEach(function(btn) {
		btn.addEventListener('click', function(e) {
			let chk = e.target.parentElement.parentElement.children[0].checked;
			console.log(chk); //undefined나와
		})
	})
</script>