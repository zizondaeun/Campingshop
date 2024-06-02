<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QnA 글 등록</title>
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
    width: 100%; /* 원하는 가로 길이 설정 */
    max-width: 600px; /* 최대 가로 길이 설정 */
    display: flex;
    flex-direction: column;
    align-items: center;
}

.form-group {
    display: flex;
    align-items: center;
    width: 100%;
    margin-bottom: 10px; /* 각 요소 간의 간격 */
}

.form-group label {
    width: 100px; /* 레이블의 고정된 너비 */
    margin-right: 10px; /* 레이블과 입력 필드 간의 간격 */
}

.form-group select, .form-group input, .form-group textarea {
    flex-grow: 1; /* 입력 필드와 텍스트에어가 레이블을 제외한 남은 공간을 차지하도록 함 */
    margin-bottom: 10px; /* 각 요소 간의 간격 */
}

.ck-editor__editable_inline {
    height: 300px; /* 원하는 높이 설정 */
}
</style>
</head>
<body>
    <div class="editor-container">
        <h3 align="center">공지사항 등록</h3>
        <form action="addnoticePage.do" method="POST">
            <div class="form-group">
                <label for="title">ID</label>
        <input type="text" minlength="5" name="userId" id="userId" value="${user.userId}" class="input"  />
            </div>
            
            <div class="form-group">
                <label for="title">noticeSubject</label>
                <input type="text" name="noticeSubject" id="noticeSubject">
            </div>
            <div class="form-group">
                <label for="editor">noticeContent</label>
                <textarea name="noticeContent" id="noticeContent"></textarea>
            </div>
            <input type="submit" value="전송">
        </form>
    </div>
    <script>
        ClassicEditor.create(document.querySelector('#editor'), {
            toolbar: {
                items: [
                    'heading', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote', 'insertTable', 'mediaEmbed', 'undo', 'redo'
                ]
            }
        }).catch(error => {
            console.error(error);
        });
    </script>
</body>
</html>

