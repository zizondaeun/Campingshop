<%@ page import="com.camcam.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.detail-container {
    width: 70%;
    margin: 0 auto;
    border: 1px solid #ccc;
    padding: 20px;
}
.detail-header {
    text-align: center;
    padding: 20px;
    border-bottom: 1px solid #ddd;
}
.detail-content {
    padding: 20px;
    border-bottom: 1px solid #ddd;
}
.detail-footer {
    text-align: center;
    padding: 20px;
}
</style>
<div class="detail-container">
    <div class="detail-header">
        <h3>공지사항 상세 정보</h3>
    </div>
    <div class="detail-content">
        <p><strong>NO:</strong> ${notice.noticeNo}</p>
        <p><strong>제목:</strong> ${notice.noticeSubject}</p>
        <p><strong>내용:</strong> ${notice.noticeContent}</p>
        <p><strong>작성자:</strong> ${notice.userId}</p>
        <p><strong>작성일:</strong> <fmt:formatDate value="${notice.noticeDate}" pattern="yyyy/MM/dd" /></p>
    </div>
    <div class="detail-footer">
        <button onclick="window.history.back()">뒤로가기</button>
    </div>
</div>
