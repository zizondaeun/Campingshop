<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container px-4">
	<h3 align="center">MY POST</h3>
	<form name="myFrm" action="updateMyboard.do" method="post" class="mx-auto" style="max-width: 500px;">
		<div class="mb-2 row">
			<label for="staticEmail" class="col-sm-2 col-form-label" style="font-weight: bold;">NO</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" name="bno" value="${result.boardNo }">
			</div>
		</div>	
		<div class="mb-2 row">
			<label for="staticEmail" class="col-sm-2 col-form-label" style="font-weight: bold;">WRITER</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" name="userId" value="${result.userId }">
			</div>
		</div>
		<div class="mb-2 row">
			<label for="staticEmail" class="col-sm-2 col-form-label" style="font-weight: bold;">DATE</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${result.createDate }" pattern = "yyyy/MM/dd"/>">
			</div>
		</div>
		<div class="mb-2 row">
			<label for="staticEmail" class="col-sm-2 col-form-label" style="font-weight: bold;">TITLE</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" value="${result.title }">
			</div>
		</div>
		<div class="mb-2 row">
			<label for="staticEmail" class="col-sm-2 col-form-label" style="font-weight: bold;">CONTENT</label>
			<div class="col-sm-10">
				<textarea class="form-control" name="content" id="contentTextArea" rows="5" cols="30">${result.content}</textarea>
			</div>
		</div>
        <div align="center">
            <button type="submit" class="btn btn-dark" id="modBtn">COMPLETE</button>
        </div>
	</form>
</div>
<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const contentTextArea = document.getElementById("contentTextArea");
	    contentTextArea.value = contentTextArea.value.replace(/<[^>]*>?/gm, '');
	});
</script>
