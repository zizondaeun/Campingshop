<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <!-- Carousel Start -->
    <div class="container-fluid mb-3">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#header-carousel" data-slide-to="1"></li>
                        <li data-target="#header-carousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item position-relative active" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="img/imgData/메인1.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="img/imgData/메인2.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="productImg/택티컬 노나돔 4.0  코요테탄2.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="product-offer mb-30" style="height: 200px;">
                    <img class="img-fluid" src="productImg/택티컬 노나 타프  코요테탄2.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase"></h6>
                        <h3 class="text-white mb-3"></h3>
                    </div>
                </div>
                <div class="product-offer mb-30" style="height: 200px;">
                    <img class="img-fluid" src="img/imgData/아웃도어라인/텐트/헬리녹스 브이타프 4.0  화이트(실버)2.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase"></h6>
                        <h3 class="text-white mb-3"></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->


    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>
        <div class="row px-xl-5 pb-3">
        	<c:forEach var="c" items="${cList }">
	            <div class="col-lg-6 col-md-4 col-sm-6 pb-1">
	                <a class="text-decoration-none" href="productList.do?pcode=${c.categoryCode}">
	                    <div class="cat-item d-flex align-items-center mb-4">
	                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
	                            <img class="img-fluid" src="productImg/${c.categoryImg }" alt="">
	                        </div>
	                        <div class="flex-fill pl-3">
	                            <h6>${c.categoryName}</h6>
	                            <small class="text-body">${c.productCnt } Products</small>
	                        </div>
	                    </div>
	                </a>
	            </div>
        	</c:forEach>
        </div>
    </div>
    <!-- Categories End -->
    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Recent Products</span></h2>
		<div class="row px-xl-5">
		<c:forEach var="product" begin="0" end="7" items="${pList}">
			<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
				<div class="product-item bg-light mb-4">
					<div class="product-img position-relative overflow-hidden">
						<img class="img-fluid w-100" src="productImg/${product.productImg }" alt="">
						<div class="product-action">
							<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href="addWish.do?pno=${product.productNo }"><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="text-center py-4">
						<a class="h6 text-decoration-none text-truncate" href="productInfo.do?pno=${product.productNo}">${product.productName}</a>
						<div class="d-flex align-items-center justify-content-center mt-2">
							<c:if test="${product.offPrice == 0}">
										<h5>
											<fmt:formatNumber value="${product.price }" />
											원
										</h5>
									</c:if>
									<c:if test="${product.offPrice != 0}">
										<h5>
											<fmt:formatNumber value="${product.offPrice }" />
											원
										</h5>
										<h6 class="text-muted ml-2">
											<del>
												<fmt:formatNumber value="${product.price }" />
												원
											</del>
										</h6>
									</c:if>
						</div>
						<div class="d-flex align-items-center justify-content-center mb-1">
							<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="far fa-star text-primary mr-1"></small> <small class="far fa-star text-primary mr-1"></small> <small>(99)</small>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
    <!-- Products End -->
