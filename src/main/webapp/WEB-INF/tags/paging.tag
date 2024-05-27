<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="pageInfo" type="com.camcam.common.PageDTO" required="true"%>
<div class="center">
	<div class="pagination">

		<c:if test="${paging.prev }">
			<!-- 이전페이지 여부 체크 -->
			<a href="myBoardList.do?page=${paging.startPage-1}">&laquo;</a>
		</c:if>

		<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
			<a href="myBoardList.do?page=${p}" class="${p==paging.page?'active':''}">${p}</a>
		</c:forEach>

		<c:if test="${paging.next }">
			<!-- 이후페이지 여부 체크 -->
			<a href="myBoardList.do?page=${paging.endPage+1}">&raquo;</a>
		</c:if>

	</div>
</div>