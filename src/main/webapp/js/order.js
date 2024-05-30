/**
 * js/order.js
 */

// 숫자 3자리 콤마찍기
Number.prototype.numberFormat = function() {
	if (this == 0)
		return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr)) {
		nstr = nstr.replace(regex, '$1' + ',' + '$2');
	}
	return nstr;
};

let order = {

	// 전체 수량
	totalCount: 0,
	// 전체 금액
	totalPrice: 0,
	// 할인 금액
	totalDiscount: 0,

	// 장바구니로부터 가져온 상품 목록
	cartList: function() {
		fetch('orderList.do?cno=' + cno)
			.then(resolve => resolve.json())
			.then(result => {
				result.forEach((val, idx) => {
					//					console.log(val);
					let discount = val.PRICE - val.OFF_PRICE;
					//
					//										console.log("discount="+discount);
					//										console.log("qty="+val.QTY)
					//
					order.totalCount += val.QTY;
					order.totalPrice += val.QTY * val.PRICE;
					order.totalDiscount += (val.QTY * discount);
					const rowDiv = document.querySelector('div[data-id="0"]').cloneNode(true);
					rowDiv.style.display = "block";
					rowDiv.setAttribute('data-id', val.PRODUCT_NO);
					rowDiv.childNodes[1].textContent = val.PRODUCT_NAME;
					rowDiv.childNodes[3].textContent = '×' + val.QTY;
					rowDiv.childNodes[5].textContent = (val.PRICE * val.QTY).numberFormat() + '원';
					let childDiv = document.createElement('div');
					let hiddenInput = document.createElement('input');
					hiddenInput.setAttribute('type', 'hidden');
					hiddenInput.setAttribute('id', 'count' + val.PRODUCT_NO);
					hiddenInput.value = val.QTY;
					childDiv.appendChild(hiddenInput);
					rowDiv.appendChild(childDiv);

					document.querySelector('#orderList').append(rowDiv);
					//					order.totalPrice += Number(val.PRICE) * Number(val.QTY);
					//					order.totalDiscount += (val.PRICE - val.OFF_PRICE);
					//					console.log("qty2=" + val.QTY)
					//					console.log("totalCnt= " + order.totalCount)
					//					console.log("totalPrice= " + order.totalPrice)
					//					console.log("totalDiscount= "+order.totalDiscount)

				})
				document.querySelector('#totalPrice').innerText = order.totalPrice.numberFormat() + '원';
				document.querySelector('#totalDiscount').innerText = '-' + (order.totalDiscount).numberFormat() + '원';
				document.querySelector('#totalSum').innerText = (order.totalPrice - order.totalDiscount).numberFormat() + '원';

			})
			.catch(err => console.log(err));
	},
	userInfo: function() {
		fetch('orderInfo.do')
			.then(resolve => resolve.json())
			.then(result => {
				//				console.log(result);
				document.querySelector('.customer').value = result.userName;
				document.querySelector('.cEmail').value = result.email;
				document.querySelector('.cTel').value = result.userTel;
				document.querySelector('.cAddr').value = result.address;
			})
	}
}

document.querySelector('#purchase').addEventListener('click', function() {
	if (document.querySelector('.customer').value == '' || document.querySelector('.cEmail').value == '' || document.querySelector('.cTel').value == '' || document.querySelector('.cAddr').value == '') {
		alert('정보를 모두 입력해주세요.');
		return;
	}

	let prodNoVal = '';
	let prodCntVal = '';

	document.querySelectorAll('#orderList .data').forEach((val, idx) => {
		if (idx > 0) {
			let prodNo = val.getAttribute('data-id');
			console.log(prodNo);
			prodNoVal += prodNo + ',';
			prodCntVal += document.querySelector('#count' + prodNo).value + ',';
		}
	})

	let form = document.createElement('form');
	form.setAttribute('action', 'orderForm.do');
	form.setAttribute('method', 'post');
	let input1 = document.createElement('input');
	input1.setAttribute('type', 'hidden');
	input1.setAttribute('name', 'productNo');
	input1.value = prodNoVal;
	form.appendChild(input1);

	let input2 = document.createElement('input');
	input2.setAttribute('type', 'hidden');
	input2.setAttribute('name', 'qty');
	input2.value = prodCntVal;
	form.appendChild(input2);

	let input3 = document.createElement('input');
	input3.setAttribute('type', 'hidden');
	input3.setAttribute('name', 'address');
	input3.value = document.querySelector('.cAddr').value;
	form.appendChild(input3);

	let input4 = document.createElement('input');
	input4.setAttribute('type', 'hidden');
	input4.setAttribute('name', 'amount');
	input4.value = order.totalPrice - order.totalDiscount;
	form.appendChild(input4);

	document.querySelector('body').appendChild(form);
	console.log(input1.value);
	console.log(input2.value);
	console.log(input3.value);
	console.log(input4.value);
	form.submit();




})



order.cartList();
order.userInfo();