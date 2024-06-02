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
div.reply-container {
	display: flex;
	justify-content: center;
	padding: 10px;
}
div.reply {
	width: 60%;
	margin: 0 auto;
	
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
div.content {
	padding: 10px;
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
			<td><fmt:formatDate value="${result.createDate }"
					pattern="yyyy/MM/dd" /></td>
		</tr>
		<tr>
			<th>TITLE
			<td>
			<td colspan="6">${result.title }</td>
		</tr>
		<tr>
			<th>CONTENT
			<th>
			<td colspan="6">${result.content }</td>
		</tr>
		<tr align="center">
			<td colspan="6">
				<button class="btn btn-primary" id="modBtn">수정</button>
				<button type="button" class="btn btn-danger" id="delBtn"
					onclick="location.href='deleteBoard.do?bno=${result.boardNo}'">삭제</button>
			</td>
		</tr>
	</table>
	<hr />
	<div class="reply-container">
		<div class="reply">
			<!-- 댓글등록 -->
			<div class="header">
				<c:if test="${logId eq 'admin' }">
					<input class="col-sm-8" id="reply">
					<button class="col-sm-3" id="addReply">답변등록</button>
				</c:if>
			</div>
			<div class="content">
				<ul>
					<li>
						<span class="col-sm-8" style="font-weight: bold;">답변</span>
						<c:if test="${logId eq 'admin' }">
							<span class="col-sm-3" style="font-weight: bold;">답변삭제</span>
						</c:if>
					</li>
					<li>
						<hr />
					</li>
					<li style="display: none;">
						<span class="col-sm-8"></span> 
						<c:if test="${logId eq 'admin' }">
							<span class="col-sm-3">
								<button onclick="deleteRow(event)" class="btn btn-warning">삭제</button>
							</span>
						</c:if>
					</li>
				</ul>
			</div>
			<!-- div.content -->
		</div>
		<!-- div.reply -->
	</div>
	<!-- div.reply-container -->
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