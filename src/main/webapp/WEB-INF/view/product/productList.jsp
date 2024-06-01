<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Breadcrumb Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<div class="col-12">
			<nav class="breadcrumb bg-light mb-30">
				<a class="breadcrumb-item text-dark" href="home.do">Home</a> <a class="breadcrumb-item text-dark" href="#">Shop</a>
			</nav>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->
<!-- Shop Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<!-- Shop Product Start -->
		<div class="col-lg-12 col-md-12">
			<div class="row pb-3">
				<div class="col-12 pb-1">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<div></div>
						<div class="ml-2">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sorting</button>
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="productList.do?page=1&keyword=${keyword}&pcode=${pCode}&sort=L">최신순</a> 
									<a class="dropdown-item" href="productList.do?page=1&keyword=${keyword}&pcode=${pCode}&sort=H">높은가격순</a> 
									<a class="dropdown-item" href="productList.do?page=1&keyword=${keyword}&pcode=${pCode}&sort=P">낮은가격순</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<c:forEach var="product" items="${pList }">
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<input type="hidden" id="${product.productNo }" value="${product.productNo }"> <a href="productInfo.do?pno=${product.productNo}&keyword=${keyword}&pcode=${pCode}&sort=${sort}"> <img class="img-fluid w-100" src="productImg/${product.productImg }" alt="">
								</a>
								<!-- 								<div class="product-action"> -->
								<%-- 									<a class="btn btn-outline-dark btn-square" href="addCart.do?cnt=1&pno=${product.productNo }&uid=${logId}"><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href="productInfo.do?pno=${product.productNo}&keyword=${keyword}"><i class="fa fa-search"></i></a> --%>
								<!-- 								</div> -->
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="productInfo.do?pno=${product.productNo}&uid=${logId }&keyword=${keyword}&pcode=${pCode}&sort=${sort}">${product.productName }</a>
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
									${product.rating }
									<c:forEach begin="1" end="${product.truncRating}">
										<small class="fa fa-star text-primary mr-1"></small>
									</c:forEach>
									<c:if test="${product.rating-product.truncRating > 0}">
										<c:choose>
											<c:when test="${product.rating-product.truncRating >= 0.5}">
												<small class="fas fa-star-half-alt text-primary mr-1"></small>
												<c:forEach begin="1" end="${4-product.truncRating}">
													<small class="far fa-star text-primary mr-1"></small>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach begin="1" end="${5-product.truncRating}">
													<small class="far fa-star text-primary mr-1"></small>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:choose>
										<c:when test="${product.rating-product.truncRating == 0 && product.rating != 0}">
											<c:forEach begin="1" end="${5-product.truncRating}">
												<small class="far fa-star text-primary mr-1"></small>
											</c:forEach>
										</c:when>
										<c:when test="${product.rating == 0 }">
											<c:forEach begin="1" end="5">
												<small class="far fa-star text-primary mr-1"></small>
											</c:forEach>
										</c:when>
									</c:choose>


									<small>(${product.reviewCnt })</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="col-12">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${paging.prev }">
								<li class="page-item disabled"><a class="page-link" href="productList.do?page=${paging.startPage-1}">Previous</span></a></li>
							</c:if>
							<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
								<li class="${p==paging.page?'page-item active':''}"><a class="page-link" href="productList.do?page=${p}&keyword=${keyword}&pcode=${pCode}&sort=${sort}">${p}</a></li>
							</c:forEach>
							<c:if test="${pageInfo.next }">
								<li class="page-item"><a class="page-link" href="productList.do?page=${paging.endPage+1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- Shop Product End -->
	</div>
</div>
<!-- Shop End -->
<script src="js/productList.js"></script>