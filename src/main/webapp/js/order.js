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
					console.log(val);
					//					let discount = val.PRICE - val.OFF_PRICE;
					////
					//					console.log("discount="+discount);
					//					console.log("qty="+val.QTY)
					////
					order.totalCount += val.QTY;
					//					order.totalPrice += val.QTY * val.PRICE;
					//					order.totalDiscount += (val.QTY * discount);
					const rowDiv = document.querySelector('div[data-id="0"]').cloneNode(true);
					rowDiv.style.display = "block";
					rowDiv.childNodes[1].textContent = val.PRODUCT_NAME;
					rowDiv.childNodes[3].textContent = '×' + val.QTY;
					rowDiv.childNodes[5].textContent = (val.PRICE * val.QTY).numberFormat() + '원';

					document.querySelector('#orderList').append(rowDiv);
					order.totalPrice += Number(val.PRICE) * Number(val.QTY);
					order.totalDiscount += (val.PRICE - val.OFF_PRICE);
					//					console.log("qty2="+val.QTY)
					//					console.log("totalCnt= "+order.totalCount)
					//					console.log("totalPrice= "+order.totalPrice)
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
				console.log(result);
				document.querySelector('.customer').value = result.userName;
				document.querySelector('.cEmail').value = result.email;
				document.querySelector('.cTel').value = result.userTel;
				document.querySelector('.cAddr').value = result.address;
			})
	}
}
order.cartList();
order.userInfo();