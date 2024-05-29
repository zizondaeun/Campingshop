<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Breadcrumb Start -->
<style>
.bodyImg {
	width: 500px;
	height: 500px;
	display: flex;
}
</style>
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
						<img class="w-100 h-100" src="productImg/${product.productImg }" alt="Image">
					</div>
					<div class="carousel-item">
						<img class="w-100 h-100" src="productImg/${product.productImg2 }" alt="Image">
					</div>
					<div class="carousel-item">
						<img class="w-100 h-100" src="productImg/${product.productImg3 }" alt="Image">
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
						<c:forEach begin="1" end="${reviewDetail.truncRating}">
							<small class="fas fa-star"></small>
						</c:forEach>
						<c:if test="${reviewDetail.totalCnt != 0 }">
							<c:if test="${(reviewDetail.sumRate/reviewDetail.totalCnt)-reviewDetail.truncRating > 0}">
								<c:choose>
									<c:when test="${(reviewDetail.sumRate/reviewDetail.totalCnt)-reviewDetail.truncRating >= 0.5}">
										<small class="fas fa-star-half-alt"></small>
										<c:forEach begin="1" end="${4-reviewDetail.truncRating}">
											<small class="far fa-star"></small>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach begin="1" end="${5-reviewDetail.truncRating}">
											<small class="far fa-star"></small>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:if>
						<c:if test="${(reviewDetail.sumRate/reviewDetail.totalCnt) - reviewDetail.truncRating == 0 && (reviewDetail.sumRate/reviewDetail.totalCnt) != 0 }">
							<c:forEach begin="1" end="${5-reviewDetail.truncRating}">
								<small class="far fa-star"></small>
							</c:forEach>
						</c:if>
						<c:if test="${reviewDetail.totalCnt == 0 }">
							<c:forEach begin="1" end="5">
								<small class="far fa-star"></small>
							</c:forEach>
						</c:if>
						<!-- 						<small class="fas fa-star"></small> <small class="fas fa-star"></small> <small class="fas fa-star-half-alt"></small> <small class="far fa-star"></small> -->
						
						
					</div>
					<small class="pt-1">(${reviewDetail.totalCnt } Reviews)</small>
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
					<div class="input-group quantity mr-3" style="width: 150px;">
						<div class="input-group-btn minusBtn">
							<button class="btn btn-primary btn-minus">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						<input type="text" class="form-control bg-secondary border-0 text-center cntInput" value="1">
						<div class="input-group-btn addBtn">
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
					<a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Description</a> <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Information</a> <a class="nav-item nav-link text-dark reviewBtn" data-toggle="tab" href="#tab-pane-3">Reviews (${reviewDetail.totalCnt })</a>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="tab-pane-1">
						<h4 class="mb-3">Product Description</h4>
						<div class="bodyImg">
							<img src="productImg/${product.productImg }" alt="Image"
								onclick="window.open(this.src)"> <img
								src="productImg/${product.productImg2 }" alt="Image"
								onclick="window.open(this.src)">
						</div>
					</div>
					<div class="tab-pane fade" id="tab-pane-2">
						<h4 class="mb-3">배송안내</h4>
						<div>
							<div class="col-md-12">
								<ul class="list-group list-group-flush">
									<li class="list-group-item px-0">- 배송 방법 : 택배</li>
									<li class="list-group-item px-0">- 배송 지역 : 전국 지역</li>
									<li class="list-group-item px-0">- 배송 비용 : 개별 배송 상품을 제외하고 30,000원 미만 구매 시 배송비 3,000원이 추가됩니다.</li>
									<li class="list-group-item px-0">- 배송 기간 : 2일 ~ 3일</li>
									<li class="list-group-item px-0">- 산간벽지나 도서지방은 별도의 추가 금액을 지불하셔야 하는 경우가 있습니다.</li>
									<li class="list-group-item px-0">- 고객님께서 주문하신 상품은 입금 확인 후 배송해 드립니다. 다만, 상품 종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</li>
								</ul>
							</div>
						</div>
						<br>
						<h4 class="mb-3">교환/반품/품질 보증 기간 안내</h4>
						<div class="row">
							<div class="col-md-6">
								<p>[반품 및 교환 절차 안내]</p>
								<ul class="list-group list-group-flush">
									<li class="list-group-item px-0">1. 반품 및 교환은 제품 발송 전, 헬리녹스 고객센터(02-730-1928), Q/A 게시판, 카카오톡 채널로 사전에 문의하셔야 처리가 가능합니다.</li>
									<li class="list-group-item px-0">2. 반품 및 교환은 상품을 수령한 날로부터 7일 이내 접수해주셔야 가능합니다.</li>
									<li class="list-group-item px-0">3. 반품 및 교환 주소 : 인천시 서구 가석로 30, 광양프런티어밸리 3차 1017호 헬리녹스(02-730-1928)</li>
									<li class="list-group-item px-0">4. 반품 및 교환이 불가능한 경우<br>- 포장이 훼손되어 상품 가치가 현저히 감소한 경우.<br> ->상품택 제거, 종이안내서 훼손 및 분실 등.<br> - 구매자의 사용 또는 일부 소비에 의하여 상품 가치가 현저히 감소한 경우. <br> - 기간 경과에 의하여 재판매가 불가 할 정도로 상품가치가 현저히 감소한 경우. <br> - 악세사리류는 포장 특성상 개봉 시 반품 및 교환이 불가능합니다. <br> - 기타, '전자상거래 등에서의 소비자보호에 관한 법률'이 정하는 청약철회 제한사유에 해당되는 경우. <br> ※ 반품/교환 시 상기 내용을 충족시키지 않는 경우, 반송될 수 있습니다. <br> 5. 반품 및 교환 처리기간 : 제품 입고 후 입고순으로 검수가 진행되며, 검수완료 후 개별 연락드릴 예정입니다. (최대 1~2주 소요)
									</li>
								</ul>
							</div>
							<div class="col-md-6">
								<p>[반품 및 교환 택배비용]</p>
								<ul class="list-group list-group-flush">
									<li class="list-group-item px-0">1. 반품 택배비 : 기본 배송료는 6,000원(왕복택배비) 입니다. 상품별 차등 부과되며, 제주지역 및 도서산간 지역은 배송비가 추가될 수 있습니다.<br> (고가품등 특정 제품에 대한 반품 택배비는 제품에 따라 다르게 적용될 수 있습니다.)
									</li>
									<li class="list-group-item px-0">2. 고객님의 변심으로 교환 및 반품을 하실 경우 택배비는 고객님께서 부담하셔야 합니다. (예 : 단순변심, 색상 및 사이즈 교환 등 포함)</li>
									<li class="list-group-item px-0">3. 물품에 이상이 있어 반품 및 교환을 원하시는 경우 택배비는 헬리녹스가 부담합니다.</li>
									<li class="list-group-item px-0">4. 고객님의 불량의심으로 접수시, 불량판정이 아닐 경우 택배비는 고객님께 청구됩니다.</li>
								</ul>
							</div>
						</div>
						<br>
						<h4 class="mb-3">품질 보증 기간</h4>
						<div>
							<div class="col-md-12">
								<ul class="list-group list-group-flush">
									<li class="list-group-item px-0">-품질 보증 기간 : 구입일로부터 1년 이내 무상수리 (조립 불량, 봉재 불량)</li>
									<li class="list-group-item px-0">-품질 보증 기간이란? 제조자 과실로 발생된 경우 제조회사로 보상 (무료 수선, 교환, 환불)을 청구할 수 있는 기간을 의미합니다. 보상은 구입가격을 기준으로 하여, 보상 순서는 정상 회복이 가능한 경우에는 무료 수선해드리며, 정상 회복이 불가능할 경우에는 동일 제품 또는 동종 제품으로 교환해 드립니다.<br> 제조물 책임 (PL) 2억 원 보험 가입 / 고객센터 : 02-730-1928 상담 시간 : 10:00~16:00
									</li>
								</ul>
							</div>
						</div>
						<br>
						<h4 class="mb-3">AS안내</h4>
						<div>
							<div class="col-md-12">
								<ul class="list-group list-group-flush">
									<li class="list-group-item px-0">- 소비자 분쟁 해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.</li>
									<li class="list-group-item px-0">- A/S는 02-730-1928 / 카카오톡 플러스 ID : helinoxcs (헬리녹스)로 문의하시기 바랍니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="tab-pane-3">
						<div class="row">
							<div class="col-md-6">
								<div class="reviewHeader">
									<h4 class="mb-4">${reviewDetail.totalCnt } review for "${product.productName }"</h4>
									<div class="media mb-4 reviewTemplate" style="display: none;">
										<div class="media-body">
											<h6 class="reviewer">
												John Doe<small> - <i>01 Jan 2045</i></small>
											</h6>
											<div class="text-primary mb-2 ratingStarList"></div>
											<p class="reviewContent">Diam amet duo labore stet elitr ea clita ipsum, tempor labore accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.</p>
										</div>
									</div>
								</div>
								<div class="justify-content-center">
									<ul class="pagination">
										<li><a href="#">1</a></li>
										<li><a href="#" class="active">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-6">
								<h4 class="mb-4">Leave a review</h4>
								<small>Required fields are marked *</small>
								<div class="d-flex my-3">
									<p class="mb-0 mr-2">Your Rating * :</p>
									<div class="text-primary reviewRating">
										<i class="far fa-star ratingStar"></i> <i class="far fa-star ratingStar"></i> <i class="far fa-star ratingStar"></i> <i class="far fa-star ratingStar"></i> <i class="far fa-star ratingStar"></i>
									</div>
								</div>
								${userReviewCnt }
								<div class="form-group">
									<label for="content">Your Review *</label>
									<textarea id="message" cols="30" rows="5" class="form-control"></textarea>
								</div>
								<div class="form-group">
									<input type="hidden" class="form-control" name="rating" id="rating" value="0" readonly> <input type="hidden" class="form-control" name="pno" id="productNo" value="${product.productNo}" readonly> <input type="hidden" class="form-control" name="user" id="userId" value="${logId}" readonly>
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
<!-- <div class="container-fluid py-5"> -->
<!-- 	<h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"> -->
<!-- 		<span class="bg-secondary pr-3">You May Also Like</span> -->
<!-- 	</h2> -->
<!-- 	<div class="row px-xl-5"> -->
<!-- 		<div class="col"> -->
<!-- 			<div class="owl-carousel related-carousel"> -->
<!-- 				<div class="product-item bg-light"> -->
<!-- 					<div class="product-img position-relative overflow-hidden"> -->
<!-- 						<img class="img-fluid w-100" src="img/product-1.jpg" alt=""> -->
<!-- 						<div class="product-action"> -->
<!-- 							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="text-center py-4"> -->
<!-- 						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mt-2"> -->
<!-- 							<h5>$123.00</h5> -->
<!-- 							<h6 class="text-muted ml-2"> -->
<!-- 								<del>$123.00</del> -->
<!-- 							</h6> -->
<!-- 						</div> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mb-1"> -->
<!-- 							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="product-item bg-light"> -->
<!-- 					<div class="product-img position-relative overflow-hidden"> -->
<!-- 						<img class="img-fluid w-100" src="img/product-2.jpg" alt=""> -->
<!-- 						<div class="product-action"> -->
<!-- 							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="text-center py-4"> -->
<!-- 						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mt-2"> -->
<!-- 							<h5>$123.00</h5> -->
<!-- 							<h6 class="text-muted ml-2"> -->
<!-- 								<del>$123.00</del> -->
<!-- 							</h6> -->
<!-- 						</div> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mb-1"> -->
<!-- 							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="product-item bg-light"> -->
<!-- 					<div class="product-img position-relative overflow-hidden"> -->
<!-- 						<img class="img-fluid w-100" src="img/product-3.jpg" alt=""> -->
<!-- 						<div class="product-action"> -->
<!-- 							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="text-center py-4"> -->
<!-- 						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mt-2"> -->
<!-- 							<h5>$123.00</h5> -->
<!-- 							<h6 class="text-muted ml-2"> -->
<!-- 								<del>$123.00</del> -->
<!-- 							</h6> -->
<!-- 						</div> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mb-1"> -->
<!-- 							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="product-item bg-light"> -->
<!-- 					<div class="product-img position-relative overflow-hidden"> -->
<!-- 						<img class="img-fluid w-100" src="img/product-4.jpg" alt=""> -->
<!-- 						<div class="product-action"> -->
<!-- 							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="text-center py-4"> -->
<!-- 						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mt-2"> -->
<!-- 							<h5>$123.00</h5> -->
<!-- 							<h6 class="text-muted ml-2"> -->
<!-- 								<del>$123.00</del> -->
<!-- 							</h6> -->
<!-- 						</div> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mb-1"> -->
<!-- 							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="product-item bg-light"> -->
<!-- 					<div class="product-img position-relative overflow-hidden"> -->
<!-- 						<img class="img-fluid w-100" src="img/product-5.jpg" alt=""> -->
<!-- 						<div class="product-action"> -->
<!-- 							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="text-center py-4"> -->
<!-- 						<a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mt-2"> -->
<!-- 							<h5>$123.00</h5> -->
<!-- 							<h6 class="text-muted ml-2"> -->
<!-- 								<del>$123.00</del> -->
<!-- 							</h6> -->
<!-- 						</div> -->
<!-- 						<div class="d-flex align-items-center justify-content-center mb-1"> -->
<!-- 							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- Products End -->

<script>
	const userReviewCnt = '${userReviewCnt}'
	const pno = '${product.productNo}';
	const writer = '${logId}';
</script>
<script src="js/review.js"></script>
<script src="js/productInfo.js"></script>