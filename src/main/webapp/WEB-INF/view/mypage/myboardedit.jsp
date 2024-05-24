<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container px-4">
	<h3 align="center">MY POST</h3>
	<form name="myFrm" action="updateMyboard.do" method="post" enctype="multipart/form-data">
	<div class="mb-3 row">
		<label for="staticEmail" class="col-sm-2 col-form-label">NO</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" value="${result.boardNo }">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">WRITER</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" value="${result.userId }">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">DATE</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" value="<fmt:formatDate value="${result.createDate }" pattern = "yyyy/MM/dd"/>">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">TITLE</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" value="${result.title }">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">CONTENT</label>
		<div class="col-sm-10">
    		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">${result.content}</textarea>
		</div>
	</div>
        <div align="center">
            <button type="submit" class="btn btn-dark" id="modBtn">COMPLETE</button>
            <button type="reset" class="btn btn-secondary" id="retBtn">BACK</button>
        </div>
	</form>
</div>
<script>
	const bno = '${result.boardNo}';
	console.log(bno);
	
	document.querySelector('#modBtn').addEventListener('click', function(e){
		e.preventDefault();
		document.forms.myFrm.action = "updateMyboard.do";
		document.forms.myFrm.submit();
	})
</script>