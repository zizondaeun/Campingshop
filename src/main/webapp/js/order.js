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
	
	// 장바구니로부터 가져온 상품 목록
	cartList: function() {
		fetch(`orderList.do?cno=${cno}`)
			.then(resolve => resolve.json())
			.then(result => {
				console.log(result);
			})
	}
}