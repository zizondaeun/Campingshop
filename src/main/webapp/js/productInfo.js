/**
 * js/productInfo.js
 */

document.querySelector('.addBtn').addEventListener('click', plusNumber);
document.querySelector('.minusBtn').addEventListener('click', minusNumber);
document.querySelector('#addCart').addEventListener('click', addCart);
//document.querySelector('#addLikeBtn').addEventListener('click', addLike);
//document.querySelector('#removeLikeBtn').addEventListener('click', removeLike);

function init() {
	let addLikeBtn = document.createElement('button');
	addLikeBtn.className = "btn btn-primary px-3";
	addLikeBtn.setAttribute('id', 'addLikeBtn');
	addLikeBtn.innerHTML = "<i class='far fa-heart'></i> Add To Wish List";
	addLikeBtn.addEventListener('click', addLike);

	let removeLikeBtn = document.createElement('button');
	removeLikeBtn.className = "btn btn-primary px-3";
	removeLikeBtn.setAttribute('id', 'removeLikeBtn');
	removeLikeBtn.innerHTML = "<i class='fas fa-heart'></i> Remove To Wish List";
	removeLikeBtn.addEventListener('click', removeLike);

	if (userLikeCnt == 0) {
		addLikeBtn.style.display = 'block';
		removeLikeBtn.style.display = 'none';
	} else if (userLikeCnt > 0) {
		addLikeBtn.style.display = 'none';
		removeLikeBtn.style.display = 'block';
	}
	document.querySelector('#likeBtn').appendChild(addLikeBtn);
	document.querySelector('#likeBtn').appendChild(removeLikeBtn);
}


function plusNumber() {
	if (Number(document.querySelector('.cntInput').value) < 9) {
		document.querySelector('.cntInput').value = Number(document.querySelector('.cntInput').value) + 1;
	} else {
		alert('10개 미만으로 주문 가능합니다.')
	}
}

function minusNumber() {
	if (Number(document.querySelector('.cntInput').value) > 1) {
		document.querySelector('.cntInput').value = Number(document.querySelector('.cntInput').value) - 1;
	} else {
		alert('0보다 큰 값을 입력하세요')
	}
}

function addCart() {
	if (logId == '') {
		if(confirm('로그인 후 이용해주세요.')){
			location.href='logForm.do';
		}
	} else {
		if (cartUserToProduct == 0) {
			let cnt = document.querySelector('.cntInput').value
			fetch('addCart.do', {
				method: 'post',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: `uid=${logId}&pno=${pno2}&cnt=${cnt}`
			})
				.then(resolve => resolve.json())
				.then(result => {
					console.log(result);
					if (result.retCode == 'OK') {
						if (confirm('장바구니에 담았습니다. 장바구니로 이동하시겠습니까?')) {
							document.getElementById('addCart').disabled = true;
							location.href = 'cartList.do';
						}
					}
				})
				.catch(err => console.log(err));

		} else {
			if (confirm('이미 장바구니에 담은 제품입니다. 장바구니로 이동하시겠습니까?')) {
				location.href = 'cartList.do';
			}
		}
	}
}

function addLike(e) {
	if (logId == '') {
		if(confirm('로그인 후 이용해주세요.')){
			location.href='logForm.do';
		}
	} else {
		console.log(e.target);
		let pno = document.querySelector('#productDetail').getAttribute('data-id');
		console.log(pno);

		fetch('addLikes.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `pno=${pno}`
		})
			.then(resolve => resolve.json())
			.then(result => {
				console.log(result)
				if (result.retCode == 'OK') {
					e.target.style.display = 'none';
					document.querySelector('#removeLikeBtn').style.display = 'block';
					alert('위시리스트에 담았습니다.')
				}
			})
			.catch(err => console.log(err));
	}
}
function removeLike(e) {
	console.log(e.target);


	fetch('removeLikes.do', {
		method: 'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: `pno=${pno}`
	})
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result)
			if (result.retCode == 'OK') {
				e.target.style.display = 'none';
				document.querySelector('#addLikeBtn').style.display = 'block';
				alert('위시리스트에서 제거했습니다.')
			}
		})
		.catch(err => console.log(err));
}

init();





