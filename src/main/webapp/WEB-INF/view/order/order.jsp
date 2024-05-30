<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Breadcrumb Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<div class="col-12">
			<nav class="breadcrumb bg-light mb-30">
				<a class="breadcrumb-item text-dark" href="#">Home</a> <a class="breadcrumb-item text-dark" href="#">Shop</a> <span class="breadcrumb-item active">Checkout</span>
			</nav>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->


<!-- Checkout Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<div class="col-lg-8">
			<h5 class="section-title position-relative text-uppercase mb-3">
				<span class="bg-secondary pr-3">주문자 정보</span>
			</h5>
			<div class="bg-light p-30 mb-5">
				<div class="row">
					<div class="col-md-12 form-group">
						<label>주문자명</label> <input class="form-control customer" type="text" placeholder="이름">
					</div>
					<div class="col-md-12 form-group">
						<label>이메일</label> <input class="form-control cEmail" type="text" placeholder="example@email.com">
					</div>
					<div class="col-md-12 form-group">
						<label>연락처</label> <input class="form-control cTel" type="text" placeholder="010-1111-2222">
					</div>
					<div class="col-md-12 form-group">
						<label>주소</label> <input class="form-control cAddr" type="text">
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<h5 class="section-title position-relative text-uppercase mb-3">
				<span class="bg-secondary pr-3">Order Total</span>
			</h5>
			<div class="bg-light p-30 mb-5">
				<div class="border-bottom" id="orderList">
					<h6 class="mb-3">구매상품</h6>
					<div class="d-flex justify-content-between data" data-id="0" style="display: none !important;">
						<p>Product Name 1</p>
						<p>×3</p>
						<p>$150</p>
					</div>
				</div>
				<div class="border-bottom pt-3 pb-2">
					<div class="d-flex justify-content-between mb-3">
						<h6>구매총액</h6>
						<h6 id="totalPrice">$150</h6>
					</div>
					<div class="d-flex justify-content-between">
						<h6 class="font-weight-medium">할인금액</h6>
						<h6 id="totalDiscount" class="font-weight-medium">$10</h6>
					</div>
				</div>
				<div class="pt-2">
					<div class="d-flex justify-content-between mt-2">
						<h5>합계</h5>
						<h5 id="totalSum">$160</h5>
					</div>
				</div>
			</div>
			<div class="mb-5">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Payment</span>
				</h5>
				<div class="bg-light p-30">
					<div class="form-group">
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" name="payment" id="paypal"> <label class="custom-control-label" for="paypal">Paypal</label>
						</div>
					</div>
					<div class="form-group">
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" name="payment" id="directcheck"> <label class="custom-control-label" for="directcheck">Direct Check</label>
						</div>
					</div>
					<div class="form-group mb-4">
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" name="payment" id="banktransfer"> <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
						</div>
					</div>
					<button class="btn btn-block btn-primary font-weight-bold py-3">Place Order</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	const cno = '${cartNo}';
</script>
<script src="js/order.js"></script>
<!-- Checkout End -->