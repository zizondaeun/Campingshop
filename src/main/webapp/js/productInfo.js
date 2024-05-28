/**
 * js/productInfo.js
 */

document.querySelector('.addBtn').addEventListener('click', plusNumber);
document.querySelector('.minusBtn').addEventListener('click', minusNumber);

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