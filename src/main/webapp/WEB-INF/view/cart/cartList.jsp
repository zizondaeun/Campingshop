<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Breadcrumb Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<div class="col-12">
			<nav class="breadcrumb bg-light mb-30">
				<a class="breadcrumb-item text-dark" href="#">Home</a> <a class="breadcrumb-item text-dark" href="#">Shop</a> <span class="breadcrumb-item active">Shopping Cart</span>
			</nav>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->
<!-- Cart Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<div class="col-lg-8 table-responsive mb-5">
			<table class="table table-light table-borderless table-hover text-center mb-0">
				<thead class="thead-dark">
					<tr>
						<th>Products</th>
						<th>Price</th>
						<th>Discount</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>Remove</th>
					</tr>
				</thead>
				<tbody class="align-middle" id="basket">
					<tr data-id="0" style="display:none;">
						<td class="align-middle firstData"><img src="img/product-1.jpg" alt="" style="width: 50px;"> Product Name</td>
						<td class="align-middle basketprice"><input type="hidden" name="p_price" id="p_price0" class="p_price" value="20000">$150</td>
						<td class="align-middle basketdiscount"><input type="hidden" name="p_discount" id="p_discount0" class="p_discount" value="10000">$150</td>
						<td class="align-middle">
							<div class="input-group quantity mx-auto updown" style="width: 100px;">
								<div class="input-group-btn">
									<button class="btn btn-sm btn-primary btn-minus minusBtn" onclick="javascript: basket.changePNum(0);">
										<i class="fa fa-minus minusBtn"></i>
									</button>
								</div>
								<input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="1" onkeyup="javascript: basket.changePNum(0);">
								<div class="input-group-btn">
									<button class="btn btn-sm btn-primary btn-plus plusBtn" onclick="javascript: basket.changePNum(0);">
										<i class="fa fa-plus minusBtn"></i>
									</button>
								</div>
							</div>
						</td>
						<td class="align-middle sum">$150</td>
						<td class="align-middle"><button class="btn btn-sm btn-danger" onclick="javascript:basket.delItem();">
								<i class="fa fa-times"></i>
							</button></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-lg-4">
			<h5 class="section-title position-relative text-uppercase mb-3">
				<span class="bg-secondary pr-3">Cart Summary</span>
			</h5>
			<div class="bg-light p-30 mb-5">
				<div class="border-bottom pb-2">
					<div class="d-flex justify-content-between mb-3" id="sum_p_price">
						<h6>금액합산</h6>
						<h6>$150</h6>
					</div>
					<div class="d-flex justify-content-between" id="sum_p_discount">
						<h6 class="font-weight-medium">할인금액</h6>
						<h6 class="font-weight-medium">$10</h6>
					</div>
				</div>
				<div class="pt-2">
					<div class="d-flex justify-content-between mt-2" id="sum_p_result">
						<h5>Total</h5>
						<h5>$160</h5>
					</div>
					<button class="btn btn-block btn-primary font-weight-bold my-3 py-3" id="orderBtn">Proceed To Checkout</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Cart End -->
<script>
	const user = '${logId}';
</script>
<script src="js/cartList.js"></script>