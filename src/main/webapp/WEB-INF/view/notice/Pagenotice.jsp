<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.camcam.notice.vo.NoticeVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.center {
    text-align: center;
}
.table{
    width: 60%; 
    margin: 0 auto; 
    border: 1px solid #ccc;
    padding: 20px;
}
div.reply div {
    margin: auto;
}

div.reply ul {
    list-style-type: none;
    margin-top: 5px;
}

div.reply li {
    padding-top: 1px;
    padding-bottom: 1px;
}

div.reply span {
    display: inline-block;
}

.center {
    text-align: center;
}

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;
}
</style>
<h3 align="center">공지사항</h3>
<div>
    <table class="table">
        <tr>
           <th>NO</th>
<td>${result.noticeNo}</td>
<th>WRITER</th>
<td>${result.userId}</td>
<th>DATE</th>
<%
    Date date = (Date)request.getAttribute("result.noticeDate");
    String formattedDate = "";
    if(date != null) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        formattedDate = sdf.format(date);
    }
%>
<td><%= formattedDate %></td>
</tr>
<tr>
    <th>TITLE</th><!-- td가 닫는 태그가 누락되어 있습니다. -->
    <td colspan="6">${result.noticeSubject}</td>
</tr>
<tr>
    <th>CONTENT</th><!-- th가 닫는 태그가 누락되어 있습니다. -->
    <td colspan="6">${result.noticeContent}</td>
</tr>



    </table>
    

</div>
<script>
document.querySelector('.btn-danger').addEventListener('click', function() {
	document.forms.myFrm.action = "removeBoardForm.do"; //삭제화면 호출
	document.forms.myFrm.submit(); //submit 이벤트 호출
})
document.querySelector('#modBtn').addEventListener('click', function() {
    // 현재 공지의 noticeNo 값을 가져와서 수정 페이지로 이동
    var noticeNo = ${result.noticeNo};
    location.href = 'updatenoticeForm.do?noticeNo=' + noticeNo;
});
</script>


