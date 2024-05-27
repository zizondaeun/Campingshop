<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.table-container {
	width: 80%; 
	margin: 0 auto; 
	border: 1px solid #ccc;
	padding: 20px;
}
</style>

<h3 align="center">ORDER DETAIL</h3>
<div class="table-container">
	<table class="table">
		<thead class="table-header">
			<tr>
				<th scope="col">ORDER_NO</th>
				<th scope="col">ORDER DETAIL_NO</th>
				<th scope="col">PRODUCT_NAME</th>
				<th scope="col">QUANTITY</th>
				<th scope="col">PRICE</th>
				<th scope="col">AMOUNT</th>
			</tr>
		</thead>
		<tbody class="table-body">
			<c:choose>
				<c:when test="${empty list }">
					<tr align="center">
						<td colspan="7">조회된 결과가 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="detail" items="${list }">
						<tr>
							<th scope="row">${detail.orderNo }</th>
							<td>${detail.orderDetailNo }</td>
							<td>${detail.productName }</td>
							<td>${detail.quantity }개</td>
							<td><fmt:formatNumber value="${detail.price }"/>원</td>
							<td><fmt:formatNumber value="${detail.amount }"/>원</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>