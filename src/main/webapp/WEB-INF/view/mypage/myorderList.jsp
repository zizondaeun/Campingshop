<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
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
			style="display: inline-block; width: 100%; font-size: 15px; padding: 10px; text-align: right;">
			<span>[${logId }]</span> 님의 주문 목록입니다.
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
								<td><fmt:formatNumber value="${order.amount }"/>원</td>
								<c:choose>
									<c:when test="${order.orderStatus eq 1}">
										<td>주문완료</td>
									</c:when>
									<c:otherwise>
										<td>일단 대기...</td>
									</c:otherwise>
								</c:choose>
								<td><button type="button"
										onclick="location.href='myOrderDetail.do?ono=${order.orderNo }';">상세보기</button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="center">
			<nav>
				<ul class="pagination justify-content-center">
				<c:if test="${paging.prev }">
					<!-- 이전페이지 여부 체크 -->
					<li class="page-item"><a class="page-link" href="myOrderList.do?page=${paging.startPage - 1}"><span>&laquo;</span></a></li>
				</c:if>
	
				<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
					<li class="${p == paging.page ? 'page-item active' : 'page-item'}"><a class="page-link" href="myOrderList.do?page=${p}"><span>${p}</span></a></li>
				</c:forEach>
	
				<c:if test="${paging.next }">
					<!-- 이후페이지 여부 체크 -->
					<li class="page-item"><a class="page-link" href="myOrderList.do?page=${paging.endPage + 1}"><span>&raquo;</span></a></li>
				</c:if>
				</ul>
			</nav>
		</div>
</div>
<script></script>