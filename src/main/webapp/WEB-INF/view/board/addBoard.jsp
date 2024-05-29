<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>
<h3 align="center">QnA 글 등록</h3>
    <form action="addBoard.do" method="POST">
        <label for="title">TITLE</label>
        <input type="text" name="title" id="title">
        <textarea name="content" id="editor"></textarea>
        <label for="password">PASSWORD</label>
        <input type="password" name="boardPw" id="password">
        <input type="submit" value="전송">
    </form>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script>
    ClassicEditor.create( document.querySelector( '#editor' ) );
</script>

