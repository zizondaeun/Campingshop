<%@ page import="com.camcam.board.vo.QnAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>	
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

<h3 align="center">1:1 Q&A</h3>
<table class="table">
	<tr>
		<th>NO</th>
		<td>${result.boardNo }</td>
		<th>WRITER</th>
		<td>${result.userId }</td>
	</tr>
	<tr>
		<th>TITLE<td>
		<td>${result.title }</td>
	</tr>
	<tr>
		<th>CONTENT<th>
		<td>${result.content }</td>
	</tr>
	<!-- <tr>
		<th>DATE</th>
		<td>${result.createDate }</td>
	</tr> -->
	<tr align="center">
		<td colspan="3">
			<button class="btn btn-primary" id="modBtn">수정</button>
			<button class="btn btn-danger" id="delBtn">삭제</button>
		</td>
	</tr>
</table>


