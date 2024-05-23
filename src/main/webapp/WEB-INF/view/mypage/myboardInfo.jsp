<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <h3 align="center">MY POST</h3> -->
<div class="container px-4">
	<h3 align="center">MY POST</h3>
	<form>
	<div class="mb-3 row">
		<label for="staticEmail" class="col-sm-2 col-form-label">NO</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" value="${result.boardNo }">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">WRITER</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" value="${result.userId }">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">DATE</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${result.createDate }" pattern = "yyyy/MM/dd"/>">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">TITLE</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" value="${result.title }">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">CONTENT</label>
		<div class="col-sm-10">
    		<textarea readonly class="form-control-plaintext">${result.content}</textarea>
		</div>
	</div>
	<div class="mb-3 row">
		<label for="inputPassword" class="col-sm-2 col-form-label">PASSWORD</label>
		<div class="col-sm-4">
			<input type="password" class="form-control" id="boardPw" placeholder="비밀번호를 입력하세요">
		</div>
	</div>
		<div align="center">
			<a href="myBoardMod.do?bno=${result.boardNo}" class="btn btn-secondary">MODIFY</a>
			<button  class="btn btn-dark (BS4)" id="delBtn">DELETE</button>
		</div>
	</form>
</div>
<script>
	const bno = '${result.boardNo}';
	console.log(bno);
	
	document.querySelector('#delBtn').addEventListener('click', function(){
		console.log(document.querySelector('#delBtn'));
	})
</script>


