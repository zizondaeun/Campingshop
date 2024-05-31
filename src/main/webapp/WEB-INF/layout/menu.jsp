<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#adminMenu a {
	padding: 10px;
}
</style>
<div class="container-fluid bg-dark mb-30">
	<div class="row px-xl-5">
		<div class="col-lg-3 d-none d-lg-block">
			<a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
				<h6 class="text-dark m-0">
					<i class="fa fa-bars mr-2"></i>Categories
				</h6> <i class="fa fa-angle-down text-dark"></i>
			</a>
			<nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
				<div class="navbar-nav w-100 categorynav"></div>
			</nav>
		</div>
		<div class="col-lg-9">
			<nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
				<a href="home.do" class="text-decoration-none d-block d-lg-none"> <span class="h1 text-uppercase text-dark bg-light px-2">CAMP</span> <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">CAMP</span>
				</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
					<div class="navbar-nav mr-auto py-0">
						<a class="nav-item nav-link" href="boardList.do">Q&A</a> <a class="nav-item nav-link" href="ListnoticePage.do">공지사항</a> <a href="productList.do" class="nav-item nav-link">Shop</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down mt-1"></i></a>
							<div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
								<a href="cartList.do" class="dropdown-item">Shopping Cart</a> <a href="checkout.html" class="dropdown-item">Checkout</a>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${logId eq 'user05'}">
							<div id="adminMenu">
								<a href="userList.do" class="userControl">유저관리</a> <a href="addProductForm.do" class="productAdd">상품등록</a> <a href="deliveryManage.do" class="controldelivery">배송관리</a>
							</div>
						</c:when>
					</c:choose>
					<c:if test="${logId != null}">
						<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
							<a href="myWishList.do" class="btn px-0"> <i class="fas fa-heart text-primary"></i> <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
							</a> <a href="cartList.do" class="btn px-0 ml-3"> <i class="fas fa-shopping-cart text-primary"></i> <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
							</a>
						</div>
					</c:if>
				</div>
			</nav>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/category.js"></script>