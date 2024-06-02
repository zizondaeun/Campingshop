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
<c:choose>
	<c:when test="${not empty logId }">
		<h3 align="center">ORDER DETAIL</h3>
		<div class="table-container">
			<div class="description">
				<span
					style="display: inline-block; width: 100%; font-size: 15px; padding: 10px; text-align: right;">
					<span>[${logId }]</span> 님의 주문 상세 내역입니다.
				</span>
			</div>
			<table class="table">
				<thead class="table-header">
					<tr>
						<th scope="col">주문번호</th>
						<th scope="col">상세주문번호</th>
						<th scope="col">상품명</th>
						<th scope="col">수량</th>
						<th scope="col">가격</th>
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
									<td><fmt:formatNumber value="${detail.price }" />원</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</c:when>
	<c:otherwise>
		<div align="center">
			<table border="1">
				<tr>
					<td>로그인 후 이용 가능합니다.</td>
				</tr>
			</table>
		</div>
	</c:otherwise>
</c:choose>