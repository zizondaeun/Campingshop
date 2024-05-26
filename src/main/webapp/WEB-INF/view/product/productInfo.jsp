<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Breadcrumb Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<div class="col-12">
			<nav class="breadcrumb bg-light mb-30">
				<a class="breadcrumb-item text-dark" href="home.do">Home</a> <a class="breadcrumb-item text-dark" href="productList.do?keyword=${keyword }">Shop</a> <span class="breadcrumb-item active">Shop Detail</span>
			</nav>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->

<!-- Shop Detail Start -->
<div class="container-fluid pb-5">
	<div class="row px-xl-5">
		<div class="col-lg-5 mb-30">
			<div id="product-carousel" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner bg-light">
					<div class="carousel-item active">
						<img class="w-100 h-100" src="img/product-1.jpg" alt="Image">
					</div>
					<div class="carousel-item">
						<img class="w-100 h-100" src="img/product-2.jpg" alt="Image">
					</div>
					<div class="carousel-item">
						<img class="w-100 h-100" src="img/product-3.jpg" alt="Image">
					</div>
					<div class="carousel-item">
						<img class="w-100 h-100" src="img/product-4.jpg" alt="Image">
					</div>
				</div>
				<a class="carousel-control-prev" href="#product-carousel" data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
				</a> <a class="carousel-control-next" href="#product-carousel" data-slide="next"> <i class="fa fa-2x fa-angle-right text-dark"></i>
				</a>
			</div>
		</div>

		<div class="col-lg-7 h-auto mb-30">
			<div class="h-100 bg-light p-30">
				<h3>${product.productName }</h3>
				<div class="d-flex mb-3">
					<div class="text-primary mr-2">
						<small class="fas fa-star"></small> <small class="fas fa-star"></small> <small class="fas fa-star"></small> <small class="fas fa-star-half-alt"></small> <small class="far fa-star"></small>
					</div>
					<small class="pt-1">(99 Reviews)</small>
				</div>
				<h3 class="font-weight-semi-bold mb-4">
					<c:choose>
						<c:when test="${product.offPrice == 0}">
							<fmt:formatNumber value="${product.price }" />원
	                    </c:when>
						<c:otherwise>
							<fmt:formatNumber value="${product.offPrice }" />원
	                    	<small><del>
									<fmt:formatNumber value="${product.price }" />
									원
								</del></small>
						</c:otherwise>
					</c:choose>
				</h3>


				<p class="mb-4">${product.explain }</p>
				<div class="d-flex mb-3"></div>
				<div class="d-flex mb-4">
					<button class="btn btn-primary px-3">
						<i class="fas fa-heart"></i> Add To Wish List
					</button>
				</div>
				<div class="d-flex align-items-center mb-4 pt-2">
					<div class="input-group quantity mr-3" style="width: 130px;">
						<div class="input-group-btn">
							<button class="btn btn-primary btn-minus">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						<input type="text" class="form-control bg-secondary border-0 text-center" value="1">
						<div class="input-group-btn">
							<button class="btn btn-primary btn-plus">
								<i class="fa fa-plus"></i>
							</button>
						</div>
					</div>
					<button class="btn btn-primary px-3">
						<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row px-xl-5">
		<div class="col">
			<div class="bg-light p-30">
				<div class="nav nav-tabs mb-4">
					<a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Description</a> <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Information</a> <a class="nav-item nav-link text-dark reviewBtn" data-toggle="tab" href="#tab-pane-3">Reviews (${reviewCnt })</a>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="tab-pane-1">
						<h4 class="mb-3">Product Description</h4>
						<p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
						<p>Dolore magna est eirmod sanctus dolor, amet diam et eirmod et ipsum. Amet dolore tempor consetetur sed lorem dolor sit lorem tempor. Gubergren amet amet labore sadipscing clita clita diam clita. Sea amet et sed ipsum lorem elitr et, amet et labore voluptua sit rebum. Ea erat sed et diam takimata sed justo. Magna takimata justo et amet magna et.</p>
					</div>
					<div class="tab-pane fade" id="tab-pane-2">
						<h4 class="mb-3">Additional Information</h4>
						<p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
						<div class="row">
							<div class="col-md-6">
								<ul class="list-group list-group-flush">
									<li class="list-group-item px-0">Sit erat duo lorem duo ea consetetur, et eirmod takimata.</li>
									<li class="list-group-item px-0">Amet kasd gubergren sit sanctus et lorem eos sadipscing at.</li>
									<li class="list-group-item px-0">Duo amet accusam eirmod nonumy stet et et stet eirmod.</li>
									<li class="list-group-item px-0">Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.</li>
								</ul>
							</div>
							<div class="col-md-6">
								<ul class="list-group list-group-flush">
									<li class="list-group-item px-0">Sit erat duo lorem duo ea consetetur, et eirmod takimata.</li>
									<li class="list-group-item px-0">Amet kasd gubergren sit sanctus et lorem eos sadipscing at.</li>
									<li class="list-group-item px-0">Duo amet accusam eirmod nonumy stet et et stet eirmod.</li>
									<li class="list-group-item px-0">Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="tab-pane-3">
						<div class="row">
							<div class="col-md-6">
								<div class="reviewHeader">
									<h4 class="mb-4">${reviewCnt } review for "${product.productName }"</h4>
									<div class="media mb-4 reviewTemplate" style="display: none;">
										<div class="media-body">
											<h6 class="reviewer">
												John Doe<small> - <i>01 Jan 2045</i></small>
											</h6>
											<div class="text-primary mb-2 ratingStarList">
											</div>
											<p class="reviewContent">Diam amet duo labore stet elitr ea clita ipsum, tempor labore accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.</p>
										</div>
									</div>
								</div>
								<div class="justify-content-center">
									<ul class="pagination">
										<li><a href="#">1</a></li> <li><a href="#" class="active">2</a></li> <li><a href="#">3</a></li> <li><a href="#">4</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-6">
								<h4 class="mb-4">Leave a review</h4>
								<small>Required fields are marked *</small>
								<div class="d-flex my-3">
									<p class="mb-0 mr-2">Your Rating * :</p>
									<div class="text-primary reviewRating">
										<i class="far fa-star ratingStar"></i> 
										<i class="far fa-star ratingStar"></i> 
										<i class="far fa-star ratingStar"></i> 
										<i class="far fa-star ratingStar"></i> 
										<i class="far fa-star ratingStar"></i>
									</div>
								</div>
									<div class="form-group">
										<label for="content">Your Review *</label>
										<textarea id="message" cols="30" rows="5" class="form-control"></textarea>
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" name="rating" id="rating" value="0" readonly> 
										<input type="hidden" class="form-control" name="pno" id="productNo" value="${product.productNo}" readonly>
										<input type="hidden" class="form-control" name="user" id="userId" value="${logId}" readonly>
									</div>
									<div class="form-group mb-0">
										<c:if test="${logId == null}">
											<input type="submit" disabled value="Leave Your Review" class="btn btn-primary px-3">
										</c:if>
										<c:if test="${logId != null}">
											<input type="button" value="Leave Your Review" id="addReview" class="btn btn-primary px-3">
										</c:if>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Shop Detail End -->


<!-- Products Start -->
<div class="container-fluid py-5">
	<h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4">
		<span class="bg-secondary pr-3">You May Also Like</span>
	</h2>
	<div class="row px-xl-5">
		<div class="col">
			<div class="owl-carousel related-carousel">
				<div class="product-item bg-light">
					<div class="product-img position-relative overflow-hidden">
						<img class="img-fluid w-100" src="img/product-1.jpg" alt="">
						<div class="product-action">
							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="text-center py-4">
						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
						<div class="d-flex align-items-center justify-content-center mt-2">
							<h5>$123.00</h5>
							<h6 class="text-muted ml-2">
								<del>$123.00</del>
							</h6>
						</div>
						<div class="d-flex align-items-center justify-content-center mb-1">
							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
						</div>
					</div>
				</div>
				<div class="product-item bg-light">
					<div class="product-img position-relative overflow-hidden">
						<img class="img-fluid w-100" src="img/product-2.jpg" alt="">
						<div class="product-action">
							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="text-center py-4">
						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
						<div class="d-flex align-items-center justify-content-center mt-2">
							<h5>$123.00</h5>
							<h6 class="text-muted ml-2">
								<del>$123.00</del>
							</h6>
						</div>
						<div class="d-flex align-items-center justify-content-center mb-1">
							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
						</div>
					</div>
				</div>
				<div class="product-item bg-light">
					<div class="product-img position-relative overflow-hidden">
						<img class="img-fluid w-100" src="img/product-3.jpg" alt="">
						<div class="product-action">
							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="text-center py-4">
						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
						<div class="d-flex align-items-center justify-content-center mt-2">
							<h5>$123.00</h5>
							<h6 class="text-muted ml-2">
								<del>$123.00</del>
							</h6>
						</div>
						<div class="d-flex align-items-center justify-content-center mb-1">
							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
						</div>
					</div>
				</div>
				<div class="product-item bg-light">
					<div class="product-img position-relative overflow-hidden">
						<img class="img-fluid w-100" src="img/product-4.jpg" alt="">
						<div class="product-action">
							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="text-center py-4">
						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
						<div class="d-flex align-items-center justify-content-center mt-2">
							<h5>$123.00</h5>
							<h6 class="text-muted ml-2">
								<del>$123.00</del>
							</h6>
						</div>
						<div class="d-flex align-items-center justify-content-center mb-1">
							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
						</div>
					</div>
				</div>
				<div class="product-item bg-light">
					<div class="product-img position-relative overflow-hidden">
						<img class="img-fluid w-100" src="img/product-5.jpg" alt="">
						<div class="product-action">
							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="text-center py-4">
						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
						<div class="d-flex align-items-center justify-content-center mt-2">
							<h5>$123.00</h5>
							<h6 class="text-muted ml-2">
								<del>$123.00</del>
							</h6>
						</div>
						<div class="d-flex align-items-center justify-content-center mb-1">
							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Products End -->

<script>
	const pno = '${product.productNo}';
	const writer = '${logId}';
</script>
<script src="js/review.js"></script>