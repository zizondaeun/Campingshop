<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>
<style>
.editor-container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    width: 100%;
}

.editor-container form {
    width: 100%; 
    max-width: 400px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.form-group {
    display: flex;
    align-items: center;
    width: 100%;
    margin-bottom: 10px; 
}

.form-group label {
    width: 100px; 
    margin-right: 10px; 
}

.form-group select, .form-group input, .form-group textarea {
    flex-grow: 1; 
    margin-bottom: 10px; 
}

.ck-editor__editable_inline {
    height: 300px; 
}
</style>
</head>
<body>
    <div class="editor-container">
        <h3 align="center">QnA 글 등록</h3>
        <form action="addBoard.do" method="POST">
            <div class="form-group">
                <label for="title">TITLE</label>
                <input type="text" name="title" id="title">
            </div>
            <div class="form-group">
                <label for="editor">CONTENT</label>
                <textarea name="content" id="editor"></textarea>
            </div>
            <div class="form-group">
                <label for="password">PASSWORD</label>
                <input type="password" name="boardPw" id="password">
            </div>
            <input type="submit" value="COMPLETE">
        </form>
    </div>
    <script>
        ClassicEditor.create(document.querySelector('#editor'), {
            toolbar: {
                items: [
                    'heading', 'bold', 'italic', 'bulletedList', 'numberedList', 'blockQuote', 'insertTable', 'mediaEmbed', 'undo', 'redo'
                ]
            }
        }).catch(error => {
            console.error(error);
        });
    </script>
    <script type="text/javascript">
    	console.log('${error}');
    	    var errorMessage = '<%=request.getAttribute("error") != null ? request.getAttribute("error") : ""%>';
    	    if (errorMessage) {
    	    	Swal.fire({
					title: errorMessage,
					showDenyButton: false,
					confirmButtonText: "확인",
				}).then((result) => {
					if (result.isConfirmed) {
					} else if (result.isDenied) {
					}
				});
    	    }
    </script>
</body>
</html>