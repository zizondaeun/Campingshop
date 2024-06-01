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
//		alert('10개 미만으로 주문 가능합니다.')
		Swal.fire({
							title: "10개 미만으로 주문 가능합니다.",
							showDenyButton: false,
							confirmButtonText: "확인",
						}).then((result) => {
							/* Read more about isConfirmed, isDenied below */
							if (result.isConfirmed) {
							} else if (result.isDenied) {
							}
						});
	}
}

function minusNumber() {
	if (Number(document.querySelector('.cntInput').value) > 1) {
		document.querySelector('.cntInput').value = Number(document.querySelector('.cntInput').value) - 1;
	} else {
//		alert('0보다 큰 값을 입력하세요');
		Swal.fire({
							title: "0보다 큰 값을 입력하세요.",
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
}

function addCart() {
	if (logId == '') {

		Swal.fire({
			title: "로그인 후 이용해주세요.",
			showDenyButton: false,
			confirmButtonText: "이동",
		}).then((result) => {
			/* Read more about isConfirmed, isDenied below */
			if (result.isConfirmed) {
				// Swal.fire("Saved!", "", "success");
				location.href = 'logForm.do';
			} else if (result.isDenied) {
				// Swal.fire("Changes are not saved", "", "info");
			}
		});

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
						Swal.fire({
							title: "장바구니에 담았습니다.",
							showDenyButton: true,
							confirmButtonText: "장바구니",
							denyButtonText: `계속 쇼핑`
						}).then((result) => {
							/* Read more about isConfirmed, isDenied below */
							if (result.isConfirmed) {
								// Swal.fire("Saved!", "", "success");
								location.href = 'cartList.do';
								document.getElementById('addCart').disabled = true;

							} else if (result.isDenied) {
								document.getElementById('addCart').disabled = true;
								// Swal.fire("Changes are not saved", "", "info");
							}
						});
						//						if (confirm('장바구니에 담았습니다. 장바구니로 이동하시겠습니까?')) {
						//							document.getElementById('addCart').disabled = true;
						//							location.href = 'cartList.do';
						//						}
					}
				})
				.catch(err => console.log(err));

		} else {

			Swal.fire({
				title: "이미 장바구니에 담긴 제품입니다.",
				showDenyButton: true,
				confirmButtonText: "장바구니",
				denyButtonText: `계속 쇼핑`
			}).then((result) => {
				/* Read more about isConfirmed, isDenied below */
				if (result.isConfirmed) {
					location.href = 'cartList.do';
					// Swal.fire("Saved!", "", "success");
					location.href = 'cartList.do';
				} else if (result.isDenied) {
					// Swal.fire("Changes are not saved", "", "info");
				}
			});
		}
	}
}

function addLike(e) {
	if (logId == '') {

		Swal.fire({
			title: "로그인 후 이용해주세요",
			showDenyButton: false,
			confirmButtonText: "로그인",
		}).then((result) => {
			/* Read more about isConfirmed, isDenied below */
			if (result.isConfirmed) {
				// Swal.fire("Saved!", "", "success");
				location.href = 'logForm.do';
			} else if (result.isDenied) {
				// Swal.fire("Changes are not saved", "", "info");
			}
		});

		//		if (confirm('로그인 후 이용해주세요.')) {
		//			location.href = 'logForm.do';
		//		}
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
					//					alert('위시리스트에 담았습니다.')
					Swal.fire({
						title: "위시리스트에 담았습니다.",
						showDenyButton: true,
						confirmButtonText: "위시리스트",
						denyButtonText: `계속 쇼핑`
					}).then((result) => {
						/* Read more about isConfirmed, isDenied below */
						if (result.isConfirmed) {
							// Swal.fire("Saved!", "", "success");
							location.href = 'myWishList.do';
						} else if (result.isDenied) {
							// Swal.fire("Changes are not saved", "", "info");
						}
					});
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
				//				alert('위시리스트에서 제거했습니다.')
				Swal.fire({
					title: "위시리스트에서 제거했습니다.",
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
		.catch(err => console.log(err));
}

init();





