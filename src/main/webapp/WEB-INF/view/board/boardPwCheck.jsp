<%@ page import="com.camcam.board.vo.QnAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.tablePw{
	padding-top: 50px;
	padding-bottom: 60px;
	margin: 30px;
}
</style>
<h3 align="center">1:1 Q&A</h3>
<div class="tablePw">
    <form action="boardInfo.do" method="post" >  
        <div align="center">
            <p>이 글은 비밀글입니다. 비밀번호를 입력해주세요.</p>
            <div>
                <input type="hidden" name="bno" value="${result.boardNo }">
                <input type="hidden" name="userId" value="${result.userId }">
                <input type="password" name="boardPw">
                <button type="submit" id="subBtn">확인</button>
            </div>
        </div>
    </form> 
</div>
<script>
/*   	const bno = '${result.boardNo}';
	const userId = '${userId}';
	console.log(userId);
	//확인 버튼 클릭 이벤트
	document.querySelector('#subBtn').addEventListener('click', function(){
		fetch('boardInfo.do', {
			method: 'post',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'bno=' + bno + '&userId=' + id +'&boardPw=' + pw
		})
		.then(response => response.json())
		.then(data => {
			if (data.status == 'success') {
                window.location.href = 'boardInfo.do?userId=' + userId;
            }else {
                alert('비밀번호를 맞게 입력하세요');
            } 
		})
		.catch(err => {
            console.log(err);
            alert('오류 발생');
        });
	})  */
</script>
