<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>
<h3 align="center">QnA 글 수정화면</h3>
    <form action="updateBoard.do" method="POST">
		<input type="hidden" name="userId" value="${result.userId }">
		<input type="hidden" name="bno" value="${result.boardNo }">
        <label for="title">TITLE</label>
        <input type="text" name="title" id="title" value="${result.title }">
        <textarea name="content" id="editor">${result.content }</textarea>
        <input type="submit" value="COMPLETE">
    </form>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script>
    ClassicEditor.create( document.querySelector( '#editor' ) );
    const id = '${result.userId }';
	const title = '${result.title }';
	const content = '${result.content }';
</script>

