/**
 * js/productInfo.js
 */

document.querySelector('.addBtn').addEventListener('click', plusNumber);
document.querySelector('.minusBtn').addEventListener('click', minusNumber);
document.querySelector('#addCart').addEventListener('click', addCart);
document.querySelector('#addLikeBtn').addEventListener('click', addLike);
document.querySelector('#removeLikeBtn').addEventListener('click', removeLike);

function plusNumber(){
	if(Number(document.querySelector('.cntInput').value) < 9) {
		document.querySelector('.cntInput').value = Number(document.querySelector('.cntInput').value)+1;
	} else {
		alert('10개 미만으로 주문 가능합니다.')
	}
}

function minusNumber(){
	if(Number(document.querySelector('.cntInput').value) > 1) {
		document.querySelector('.cntInput').value = Number(document.querySelector('.cntInput').value)-1;
	} else {
		alert('0보다 큰 값을 입력하세요')
	}
}

function addCart() {
	if(cartUserToProduct == 0) {
		let cnt = document.querySelector('.cntInput').value
		fetch('addCart.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `uid=${logId}&pno=${pno2}&cnt=${cnt}`
		})
			.then(resolve => resolve.json())
			.then(result => {
				console.log(result);
				if(result.retCode == 'OK'){
					if(confirm('장바구니에 담았습니다. 장바구니로 이동하시겠습니까?')){
						document.getElementById('addCart').disabled = true;
						location.href='cartList.do';
					}
				}
			})
			.catch(err => console.log(err));
		
	} else {
		if(confirm('이미 장바구니에 담은 제품입니다. 장바구니로 이동하시겠습니까?')){
			location.href='cartList.do';
		}
	}
}

function addLike(e){
	console.log(e.target);
	e.target.style.display = 'none';
	document.querySelector('#removeLikeBtn').style.display = 'block';
	
}
function removeLike(e){
	console.log(e.target);
	e.target.style.display = 'none';
	document.querySelector('#addLikeBtn').style.display = 'block';
}






