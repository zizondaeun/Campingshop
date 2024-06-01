/** 
 *board.js 1.목록먼저
*/
//댓글목록 출력
showList();
function showList() {
	//댓글목록을 초기화
	document.querySelectorAll('div.content ul li').forEach((li, idx) => {
		if (idx >= 3) {
			li.remove();
		}
	})
	svc.replyList({ bno: bno }, //첫번째 param
		result => {
			console.log(result);
			result.forEach(reply => {
				const row = makeRow(reply);
				document.querySelector('div.reply ul').appendChild(row);
			});
			makePageInfo(); //createPageList();
		}, //두번째 param
		err => {
			console.log(err);
		} //세번째 param
	) //end of replyList
} //목록 출력의 끝부분

//삭제버튼의 이벤트
function deleteRow(e) {
	console.log(e);
	const rno = e.target.parentElement.parentElement.dataset.rno;
	//console.log(rno);

	//fetch 삭제 기능 구현
	svc.removeReply(rno, //첫번째 param
		result => {
			if (result.retCode == 'OK') {
				//				alert('삭제완료');
				Swal.fire({
					title: "삭제완료",
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
				//e.target.parentElement.parentElement.remove();
				showList();
			} else if (result.retCode == 'NG') {
				//				alert('삭제를 완료할 수 없습니다');
				Swal.fire({
					title: "삭제를 완료할 수 없습니다.",
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

			} else {
//				alert('알 수 없는 반환값');
				Swal.fire({
							title: "알 수 없는 반환값",
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
		}, //두번째 param
		err => console.log(err)); //세번째 param
}//end of deleteRow(e)


//댓글등록이벤트(addEventListener는 중첩, onclick은 한번만)
document.getElementById('addReply').addEventListener('click', function(e) {
	//console.log(document.querySelector('#addReply'));
	let reply = document.getElementById('reply').value;
	svc.addReply({ bno: bno, reply: reply }, //첫번째 param
		result => {
			if (result.retCode == 'OK') {
				//location.reload(); /새로고침..?/reload 대신하기위해 makeRow를 생성
				//const row = makeRow(result.retVal);
				//document.querySelector('div.reply ul').appendChild(row);
				showList();
				//댓글등록 후에 reply내용 초기화하기
				document.getElementById('reply').value = "";
			}
		}, //두번째 param
		err => console.log(err)); //세번째 param
}); //end of 등록버튼

//row 생성
function makeRow(reply = {}) {
	let tmpl = document.querySelector('div.reply li:nth-of-type(3)').cloneNode(true);
	console.log(tmpl);
	tmpl.style.display = 'block';
	tmpl.setAttribute('data-rno', reply.replyNo);
	tmpl.querySelector('span:nth-of-type(1)').innerText = reply.reply;
	return tmpl;
}




