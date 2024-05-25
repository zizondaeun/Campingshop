<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h3 align="center">MY INTEREST</h3>
<table class="table">
	<thead>
		<tr>
			<th scope="col">NO</th>
			<th scope="col">CART.NO</th>
			<th scope="col">DATE</th>
			<th scope="col">ADDRESS</th>
			<th scope="col">AMOUNT</th>
			<th scope="col">STATUS</th>
			<th scope="col">DETAIL</th>
		</tr>
	</thead>
	<tbody>
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
						<td><fmt:formatDate value="${order.orderDate }" pattern="yyyy/MM/dd" /></td>
						<td>${order.address }</td>
						<td>${order.amount }</td>
						<td>${order.orderStatus }</td>
						<td><button type="button" id="detail">주문 상세</button></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>