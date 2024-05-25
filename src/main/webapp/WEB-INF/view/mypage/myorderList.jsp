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

<h3 align="center">MY ORDER</h3>
<div class="table-container">
	<div class="description">
		<span
			style="display: inline-block; width: 97%; font-size: 15px; padding: 10px; text-align: right;">
			<span id=""></span> 님의 주문 목록입니다.
		</span>
	</div>
		<table class="table">
			<thead class="table-header">
				<tr>
					<th scope="col">NO</th>
					<th scope="col">CART_NO</th>
					<th scope="col">DATE</th>
					<th scope="col">ADDRESS</th>
					<th scope="col">AMOUNT</th>
					<th scope="col">STATUS</th>
					<th scope="col">DETAIL</th>
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
						<c:forEach var="order" items="${list }">
							<tr>
								<th scope="row">${order.orderNo }</th>
								<td>${order.cartNo }</td>
								<td><fmt:formatDate value="${order.orderDate }"
										pattern="yyyy/MM/dd" /></td>
								<td>${order.address }</td>
								<td>${order.amount }</td>
								<td>${order.orderStatus }</td>
								<td><button type="button"
										onclick="location.href='myOrderDetail.do?ono=${order.orderNo }';">주문
										상세</button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
</div>
<script></script>