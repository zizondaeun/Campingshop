<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container px-4">
	<h3 align="center">MY POST</h3>
	<form action="myBoardMod.do" method="post" class="mx-auto" style="max-width: 500px;">
		<div class="mb-2 row">
			<label for="staticEmail" class="col-sm-2 col-form-label" style="font-weight: bold;">NO</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" name="bno" value="${result.boardNo }">
			</div>
		</div>
		<div class="mb-2 row">
			<label for="staticEmail" class="col-sm-2 col-form-label" style="font-weight: bold;">WRITER</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" value="${result.userId }">
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
				<input type="text" readonly class="form-control-plaintext" value="${result.title }">
			</div>
		</div>
		<div class="mb-2 row">
			<label for="staticEmail" class="col-sm-2 col-form-label" style="font-weight: bold;">CONTENT</label>
			<div class="col-sm-10">
				<textarea readonly class="form-control-plaintext" rows="5" cols="30">${result.content}</textarea>
			</div>
		</div>
 		<div class="mb-2 row">
			<label for="inputPassword" class="col-sm-2 col-form-label" style="font-weight: bold;">PASSWORD</label>
			<div class="col-sm-6">
				<input type="password" name="boardPw" class="form-control" id="boardPw" placeholder="비밀번호를 입력하세요">
			</div>
		</div>
        <div align="center">
            <button type="submit" class="btn btn-secondary" id="modBtn">MODIFY</button>
            <button type="button" class="btn btn-dark" id="delBtn">DELETE</button>
        </div>
	</form>
</div>
<script>
	const bno = '${result.boardNo}';
	const userId = '${logId}';
	console.log(bno);
	//폼기능을 제외하고 아작스 호출해야함
    //delete 버튼 클릭 이벤트
    document.querySelector('#delBtn').addEventListener('click', function(e) {
        e.preventDefault();
        let pw = document.querySelector('#boardPw').value;
        console.log(pw);
        fetch('deleteMyboard.do', {
            method: 'post',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'bno=' + bno + '&boardPw=' + pw
        })
        .then(response => response.json())
		.then(data => {
			if (data.status == 'success') {
                window.location.href = 'myBoardList.do?userId=' + userId;
            }else {
//                 alert('비밀번호를 맞게 입력하세요');
            	Swal.fire({
					title: "비밀번호를 맞게 입력하세요",
					showDenyButton: false,
					confirmButtonText: "확인",
				}).then((result) => {
					/* Read more about isConfirmed, isDenied below */
					if (result.isConfirmed) {
						// Swal.fire("Saved!", "", "success");
					} else if (result.isDenied) {
						// Swal.fire("Changes are not saved", "", "info");
					}
				});
            } 
		})	            
        .catch(err => {
            console.log(err);
//             alert('오류 발생');
            Swal.fire({
				title: "오류 발생",
				showDenyButton: false,
				confirmButtonText: "확인",
			}).then((result) => {
				/* Read more about isConfirmed, isDenied below */
				if (result.isConfirmed) {
					// Swal.fire("Saved!", "", "success");
				} else if (result.isDenied) {
					// Swal.fire("Changes are not saved", "", "info");
				}
			});
        });
    });
</script>


