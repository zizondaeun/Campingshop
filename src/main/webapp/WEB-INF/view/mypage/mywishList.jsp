<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	.table-container {
		width: 80%;
		margin: 0 auto;
		border: 1px solid #ccc;
		padding: 20px;
	}

	.seldel {
		border: 1px solid grey;
		padding: 20px;
		font-size: 20px;
		background-color: white;
		color: black;
		text-decoration: none;
		display: inline-block;
		margin-top: 20px;
	}

	.seldel:hover {
		background-color: #f0f0f0;
	}
</style>
<body>
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
	<h3 align="center">MY WISHLIST</h3>
	<div class="table-container">
		<div class="description">
			<span style="display: inline-block; width: 100%; font-size: 15px; padding: 10px; text-align: right;">
				<span>[${logId }]</span> 님의 관심 상품 목록입니다.
			</span>
		</div>
		<table class="table">
			<thead class="table-header">
				<tr>
					<th scope="col"><input type="checkbox" id="chkAll"></th>
					<th scope="col">사진</th>
					<th scope="col">상품명</th>
					<th scope="col">수량</th>
					<th scope="col">가격</th>
					<th scope="col">장바구니</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody class="table-body">
				<c:choose>
					<c:when test="${empty list}">
						<tr align="center">
							<td colspan="7">조회된 결과가 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="wish" items="${list }">
							<input type="hidden" value="${wish.productNo }" class="pno">
							<tr data-pno="${wish.productNo }">
								<td><input type="checkbox" class="chk"></td>
								<td><img src="productImg/${wish.productImg }" width="100"
										height="100" />${wish.productImg }</td>
								<td>${wish.productName }</td>
								<td><input type="number" name="cnt" value="1" min="1" max="1" step="1">개</td>
								<td>
									<fmt:formatNumber value="${wish.price }" />원</td>
								<td><button type="button" class="cartBtn"
										onclick="moveCart(${wish.productNo }, '${logId }')">CART</button></td>
								<td><button type="button" class="delBtn">DELETE</button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="center">
			<nav>
				<ul class="pagination justify-content-center">
					<c:if test="${paging.prev }">
						<!-- 이전페이지 여부 체크 -->
						<li class="page-item">
							<a class="page-link"
								href="myWishList.do?page=${paging.startPage - 1}"><span>&laquo;</span></a></li>
					</c:if>

					<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
						<li class="${p == paging.page ? 'page-item active' : 'page-item'}"><a class="page-link"
								href="myWishList.do?page=${p}"><span>${p}</span></a></li>
					</c:forEach>

					<c:if test="${paging.next }">
						<!-- 이후페이지 여부 체크 -->
						<li class="page-item"><a class="page-link"
								href="myWishList.do?page=${paging.endPage + 1}"><span>&raquo;</span></a></li>
					</c:if>
				</ul>
			</nav>
		</div>

		<hr />

		<div align="center">
			<button type="button" class="seldel">선택삭제</button>
		</div>
	</div>
	<script>
		let userId = '${logId}';
		//console.log(userId + "555555");

		let btns = document.querySelectorAll('.delBtn');
		btns.forEach(function (btn) {
			btn.addEventListener('click', function (e) {
				e.preventDefault();
				let row = e.target.closest('tr');
				let productNo = row.dataset.pno;
				//함수호출
				if (deleteRow({
						userId: userId,
						productNo: productNo
					})) {
					row.remove();
				}
			});
		});
		//tr을 지우기 위한 함수
		async function deleteRow(param = {}) {
			try {
				const response = await fetch('deleteMywish.do', {
					method: 'post',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: 'userId=' + param.userId + '&productNo=' + param.productNo
				});

				if (response.ok) {
					return true;
				} else {
					return false;
				}
			} catch (err) {
				console.error('Fetch error:', err);
				return false;
			}
		}

		document.querySelector('#chkAll').addEventListener('click', function () {
			let chkAll = document.querySelector('#chkAll').checked; //true
			let chks = document.querySelectorAll('.chk'); //배열
			chks.forEach(chk => {
				chk.checked = chkAll;
			})
		});
		document.querySelector('.seldel').addEventListener('click', function () {
			let chks = document.querySelectorAll('.chk');
			chks.forEach(chk => {
				if (chk.checked) {
					let row = chk.closest('tr');
					let productNo = row.dataset.pno;
					//위에서 만든 함수 호출
					if (deleteRow({
							userId: userId,
							productNo: productNo
						})) {
						row.remove();
					}
				}
			})
		})

		// moveCart
		function moveCart(pno, uid) {
			console.log(pno, uid);
			fetch('mywishItemRemove.do?pno=' + pno + '&uid=' + uid + '&cnt=1')
				.then(response => response.json())
				.then(result => {
					console.log(result);
					if (result.retCode == 'OK') {
						Swal.fire({
							title: "이동하겠습니까?",
							showDenyButton: true,
							confirmButtonText: "이동",
							denyButtonText: `계속 쇼핑`
						}).then((result) => {
							/* Read more about isConfirmed, isDenied below */
							if (result.isConfirmed) {
								// Swal.fire("Saved!", "", "success");
								location.href = 'cartList.do';
							} else if (result.isDenied) {
								// Swal.fire("Changes are not saved", "", "info");
							}
						});
					}
				})
				.catch(err => console.log(err));
		}
	</script>
</body>