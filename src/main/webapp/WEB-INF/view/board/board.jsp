<%@ page import="com.camcam.board.vo.QnAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.center {
	text-align: center;
}
.table{
	width: 60%; 
	margin: 0 auto; 
	border: 1px solid #ccc;
	padding: 20px;
}
</style>
<link href="css/paging.css" rel="stylesheet">
<link href="css/modal.css" rel="stylesheet">
<h3 align="center">1:1 Q&A</h3>
<table class="table">
	<tr>
		<th>NO</th>
		<td>${result.boardNo }</td>
		<th>WRITER</th>
		<td>${result.userId }</td>
		<th>DATE</th>
		<td><fmt:formatDate value="${result.createDate }" pattern="yyyy/MM/dd" /></td>
	</tr>
	<tr>
		<th>TITLE<td>
		<td colspan="6">${result.title }</td>
	</tr>
	<tr>
		<th>CONTENT<th>
		<td colspan="6">${result.content }</td>
	</tr>
	<tr align="center">
		<td colspan="6">
			<button class="btn btn-primary" id="modBtn">수정</button>
			<button type="button" class="btn btn-danger" id="delBtn" onclick="location.href='deleteBoard.do?bno=${result.boardNo}'">삭제</button>
		</td>
	</tr>
</table>

<!-- 댓글목록 -->
<div class="container reply">
<!-- 댓글등록 -->
	<div class="header">
		<input class="col-sm-8" id="reply">
		<button class="col-sm-3" id="addReply">댓글등록</button>
	</div>
	<div class="content">
		<ul>
			<li>
				<span class="col-sm-2">글번호</span>
				<span class="col-sm-5">댓글내용</span>
				<span class="col-sm-2">삭제</span>
			</li>
			<li>
				<hr />
			</li>
			<li style="display: none;">
				<span class="col-sm-2"></span>
				<span class="col-sm-5"></span>
				<span class="col-sm-2"></span>
				<span class="col-sm-2"><button onclick="deleteRow(event)" class="btn btn-warning">삭제</button></span>
			</li>				
		</ul>
	</div><!-- div.content --><!-- 여기에 if써서 글이 없으면 페이징 안보이게 해보기 -->
	<div class="footer">
		<div class="center">
			<div class="pagination">
				<a href="#">1</a>
				<a href="#" class="active">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
			</div>
		</div>	
	</div>
</div><!-- div.container.reply -->

<script>
	const bno = '${result.boardNo }';
	const id = '${result.userId }';
	const title = '${result.title }';
	const content = '${result.content }';
	
 	document.querySelector('#modBtn').addEventListener('click', function(){
 		window.location.href = 'modBoardForm.do?bno=' + bno + '&userId=' + id + '&title=' + title + '&content=' + content;
	}) 
</script>