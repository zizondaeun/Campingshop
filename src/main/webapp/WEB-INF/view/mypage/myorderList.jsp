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
<div class="container-fluid pt-5">
	<div class="row px-xl-5 pb-3">
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		<a href="myBoardList.do?userId=${logId }">
			<div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
				<h1 class="fas fa-check text-primary m-0 mr-3"></h1>
				<h5 class="font-weight-semi-bold m-0">게시판 관리</h5>
			</div>
		</a>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		<a href="myOrderList.do?userId=${logId }">
			<div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
				<h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
				<h5 class="font-weight-semi-bold m-0">주문 내역</h5>
			</div>
		</a>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		<a href="myWishList.do?userId=${logId }">
			<div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
				<h1 class="fa fa-heart text-primary m-0 mr-3"></h1>
				<h5 class="font-weight-semi-bold m-0">관심 상품</h5>
			</div>
		</a>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		<a href="myinformationForm.do?userId=${logId }">
			<div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
				<h1 class="fas fa-address-book text-primary m-0 mr-3"></h1>
				<h5 class="font-weight-semi-bold m-0">개인정보수정</h5>
			</div>
		</a>
		</div>
	</div>
</div>
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
					<th scope="col">주문번호</th>
					<th scope="col">주문일</th>
					<th scope="col">주소</th>
					<th scope="col">총 결제금액</th>
					<th scope="col">주문상태</th>
					<th scope="col">주문상세</th>
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
								<td><fmt:formatDate value="${order.orderDate }"
										pattern="yyyy/MM/dd" /></td>
								<td>${order.address }</td>
								<td><fmt:formatNumber value="${order.amount }"/>원</td>
								<c:choose>
									<c:when test="${order.orderStatus eq 1}">
										<td>배송완료</td>
									</c:when>
									<c:otherwise>
										<td>주문완료</td>
									</c:otherwise>
								</c:choose>
								<td><button type="button"
										onclick="location.href='myOrderDetail.do?ono=${order.orderNo }';">상세보기</button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<p style="font-size: 13px;">- 상세보기 버튼을 클릭하시면, 주문 상세 내역을 확인하실 수 있습니다.</p>
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