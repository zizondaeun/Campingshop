<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<style>
h3 {
	padding-left: 50px;
}

.center {
	margin-top: 30px;
	padding-bottom: 50px;
}

.row {
	padding-left: 70px;
}

.trhead, tbody tr {
	text-align: center;
}
</style>
<script>
	window.onload = function(){
		
	 	let allTd = document.querySelectorAll('tbody td:nth-of-type(5)');
		let allTr = document.querySelectorAll('tbody tr');
		
		function change() {
			for(let i=0; i<allTr.length; i++){
				console.log(allTd[i]);
				console.log(allTd[i].innerHTML);
				if(allTd[i].innerHTML == 0){
					allTd[i].innerHTML = '배송중';
				} else if(allTd[i].innerHTML == 1){
					allTd[i].innerHTML = '배송완료';
				}
			}
		}
		
		change(); 
	}
	

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	
</script>
<body>
	<h3>상품관리</h3>
	<!-- <div class="center">
	<form action="userList.do">
		<div class="row">
			<div class="col-sm-4">
				<select name="searchCondition" class="form-control">
					<option value="">선택하세요.</option>
					<option value="T" ${searchCondition  == 'T' ? 'selected' : '' }>유저ID</option>
					<option value="W" ${searchCondition  == 'W' ? 'selected' : '' }>이름</option>
					<option value="TW" ${searchCondition  == 'TW' ? 'selected' : '' }>유저ID
						&이름</option>
				</select>
			</div>
			<div class="col-sm-6">
				<input type="text" name="keyword" value="${keyword }"
					class="form-control">
			</div>
			<div class="col-sm-2">
				<input type="submit" value="조회" class="btn btn-primary">
			</div>
		</div>
	</form>
</div>
 -->
	<table class="table">
		<thead>
			<tr class="trhead">
				<th>배송번호</th>
				<th>유저아이디</th>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>배송상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="delivery" items="${deliveryList}">
				<tr id="deliList">
					<td>${delivery.deliNo }</td>
					<td>${delivery.userId }</td>
					<td>${delivery.orderNo }</td>
					<td>${delivery.deliDate }</td>
					<td>${delivery.deliStatus }</td>
					<!-- <td>
						<button class="delBtn" onclick="delUser()">삭제</button>
					</td> -->
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
