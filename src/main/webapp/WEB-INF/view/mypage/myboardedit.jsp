<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <h3 align="center">MY POST</h3> -->
<div class="container px-4">
	<h3 align="center">MY POST</h3>
	<form action="myBoardMod.do">
	<div class="mb-3 row">
		<label for="staticEmail" class="col-sm-2 col-form-label">NO</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" value="${result.boardNo }">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">WRITER</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" value="${result.userId }">
		</div>
		<label for="staticEmail" class="col-sm-2 col-form-label">DATE</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" value="<fmt:formatDate value="${result.createDate }" pattern = "yyyy/MM/dd"/>">
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
            <button type="submit" class="btn btn-secondary" id="modBtn">MODIFY</button>
            <button type="button" class="btn btn-dark" id="delBtn">DELETE</button>
        </div>
	</form>
</div>