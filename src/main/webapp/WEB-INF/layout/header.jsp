<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    

<div class="container-fluid">
	<div class="row bg-secondary py-1 px-xl-5">
		<div class="col-lg-6 d-none d-lg-block">
			<div class="d-inline-flex align-items-center h-100">
				<a class="text-body mr-3" href="">About</a> <a class="text-body mr-3" href="">Contact</a> <a class="text-body mr-3" href="">Help</a> <a class="text-body mr-3" href="">FAQs</a>
			</div>
		</div>
		<div class="col-lg-6 text-center text-lg-right">
			<div class="d-inline-flex align-items-center">
				<div class="btn-group">
					<button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">My Account</button>
					<div class="dropdown-menu dropdown-menu-right">	
					 <c:choose>
          			<c:when test="${empty logId }">					
						<button class="dropdown-item" type="button" onClick="location.href='logForm.do'">로그인</button>
						<button class="dropdown-item" type="button" onClick="location.href='signInForm.do'">회원가입</button>
						<button class="dropdown-item" type="button" onClick="location.href='myPage.do'">마이페이지</button>
						</c:when>
						<c:otherwise>
						<button class="dropdown-item" type="button" onClick="logout()">로그아웃</button>
						<button class="dropdown-item" type="button" onClick="location.href='logForm.do'">정보수정</button>					
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
			<div class="d-inline-flex align-items-center d-block d-lg-none">
				<a href="" class="btn px-0 ml-2"> <i class="fas fa-heart text-dark"></i> <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
				</a> <a href="" class="btn px-0 ml-2"> <i class="fas fa-shopping-cart text-dark"></i> <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
				</a>
			</div>
		</div>
	</div>
	<div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
		<div class="col-lg-4">
			<a href="home.do" class="text-decoration-none"> <span class="h1 text-uppercase text-primary bg-dark px-2">CAMP</span> <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">CAMP</span>
			</a>
		</div>
		<div class="col-lg-4 col-6 text-left">
			<form class="searchForm" action="productList.do">
				<div class="input-group">
					<input type="text" class="form-control keyword-input" name="keyword" placeholder="Search for products">
					<div class="input-group-append">
						<button class="fa fa-search"></button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-lg-4 col-6 text-right">
			<p class="m-0">Customer Service</p>
			<h5 class="m-0">+012 345 6789</h5>
		</div>
	</div>
</div>

<script>
function logout() {
    // 로그아웃 요청을 보냅니다.
    fetch('logout.do', { method: 'POST' })
        .then(response => {
            if (response.ok) {
                // 로그아웃이 성공하면 페이지를 새로 고칩니다.
                location.reload();
            } else {
                // 로그아웃이 실패하면 오류 메시지를 표시합니다.
                alert('로그아웃에 실패했습니다. 다시 시도해주세요.');
            }
        })
        .catch(error => {
            console.error('로그아웃 요청 중 오류가 발생했습니다:', error);
            alert('로그아웃 요청 중 오류가 발생했습니다.');
        });
}
</script>
</script>