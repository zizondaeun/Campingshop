<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.table-container {
	width: 80%; 
	margin: 0 auto; 
	border: 1px solid #ccc;
	padding: 20px;
}
</style>

<h3 align="center">MY BOARD</h3>
<div class="table-container">
	<div class="description">
		<span
			style="display: inline-block; width: 100%; font-size: 15px; padding: 10px; text-align: right;">
			<span>[${logId }]</span> 님의 게시글 내역입니다.
		</span>
	</div>
	<table class="table">
		<thead class="table-header">
			<tr>
				<th scope="col">NO</th>
				<th scope="col">BOARD</th>
				<th scope="col">TITLE</th>
				<th scope="col">DATE</th>
			</tr>
		</thead>
		<tbody class="table-body">
			<c:choose>
				<c:when test="${empty list }">
					<tr align="center">
						<td colspan="4">조회된 결과가 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${list }">
						<tr>
							<th scope="row">${board.boardNo }</th>
							<td><a href="#" style="text-decoration: none"><font color="#6c757d">QnA</font></a></td>
							<td><a href="myBoardInfo.do?bno=${board.boardNo }" style="text-decoration: none"><font color="#6c757d">${board.title }</font></a></td>
							<td><fmt:formatDate value="${board.createDate }" pattern="yyyy/MM/dd" /></td>
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
				<li class="page-item"><a class="page-link" href="myBoardList.do?page=${paging.startPage - 1}"><span>&laquo;</span></a></li>
			</c:if>

			<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
				<li class="${p == paging.page ? 'page-item active' : 'page-item'}"><a class="page-link" href="myBoardList.do?page=${p}"><span>${p}</span></a></li>
			</c:forEach>

			<c:if test="${paging.next }">
				<!-- 이후페이지 여부 체크 -->
				<li class="page-item"><a class="page-link" href="myBoardList.do?page=${paging.endPage + 1}"><span>&raquo;</span></a></li>
			</c:if>
			</ul>
		</nav>
	</div>
</div>
<script>
	//글번호 넘겨서 title 클릭하면 페이지 이동(myboardInfo.do로 이동)
	const bno = '${board.boardNo}';

	let tr = document.querySelectorAll('tbody tr').forEach(function(number) {
		number.addEventListener('click', function(e) {
			let th = e.target.parentElement.children[0].innerText;
			console.log(th);
		})
	});
</script>