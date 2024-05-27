<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.table-container {
	width: 80%; 
	margin: 0 auto; 
	border: 1px solid #ccc;
	padding: 20px;
}
</style>
<h1 align="center">MY PAGE</h1>
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
<div>
	<h4 align="center">MY DELIVERY</h4>
<div class="table-container">
	<div class="description">
		<span
			style="display: inline-block; width: 100%; font-size: 15px; padding: 10px; text-align: right;">
			<span>[${logId }]</span> 님의 배송정보입니다.
		</span>
	</div>
	<table class="table">
		<thead class="table-header">
			<tr>
				<th scope="col">NO</th>
				<th scope="col">BOARD</th>
				<th scope="col">TITLE</th>
				<th scope="col">DATE</th>
			</tr>
		</thead>
		<tbody class="table-body">
			<c:choose>
				<c:when test="${empty list }">
					<tr align="center">
						<td colspan="4">조회된 결과가 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${list }">
						<tr>
							<th scope="row">${board.boardNo }</th>
							<td><a href="#" style="text-decoration: none"><font color="#6c757d">QnA</font></a></td>
							<td><a href="myBoardInfo.do?bno=${board.boardNo }" style="text-decoration: none"><font color="black">${board.title }</font></a></td>
							<td><fmt:formatDate value="${board.createDate }" pattern="yyyy/MM/dd" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
</div>
