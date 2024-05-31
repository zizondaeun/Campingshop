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
div.reply div {
	margin: auto;
}

div.reply ul {
	list-style-type: none;
	margin-top: 5px;
}

div.reply li {
	padding-top: 1px;
	padding-bottom: 1px;
}

div.reply span {
	display: inline-block;
}

.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<h3 align="center">1:1 Q&A</h3>
<div>
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
	
	<div>
	<hr />
	<!-- 댓글목록 -->
	<c:choose>
		<c:when test="${logId eq 'admin'}">
		<!-- 관리자가 입력하는 댓글창 -->
		<div class="container">
			<div class="form-group">
				<form method="post" encType="multipart/form-data" action="#">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td style="border-bottom: none;" valign="middle"><br>
							<br>${result.userId }</td>
							<td><input type="text" style="height: 100px;"
								class="form-control" name="commentText"></td>
							<td><br>
							<br>
							<input type="submit" class="btn-primary pull" value="댓글 작성"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<!-- 사용자가 보는 관리자 댓글 -->
		
		</c:otherwise>
	</c:choose>
	</div>
</div>

<script>
	const bno = '${result.boardNo }';
	const id = '${result.userId }';
	const title = '${result.title }';
	const content = '${result.content }';
	
 	document.querySelector('#modBtn').addEventListener('click', function(){
 		window.location.href = 'modBoardForm.do?bno=' + bno + '&userId=' + id + '&title=' + title + '&content=' + content;
	}) 
</script>

<script src="js/replyService.js"></script>
<script src="js/reply.js"></script>