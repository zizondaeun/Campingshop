/**
 * js/cartList.js
 */

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
let basket = {
	cartCount: 0, //전체수량
	cartTotal: 0, //전체금액

	list: function() {
		fetch('getCartList.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `uid=${user}`
		})
			.then(resolve => resolve.json())
			.then(result => {
				console.log(result);
				result.forEach((val, idx) => {
					basket.cartCount += val.qty;
					basket.cartTotal += (val.qty * val.price);
					
					const rowTr = document.querySelector('tr[data-id="0"]').cloneNode(true);
					rowTr.style.display = 'table-row';
					rowTr.setAttribute('data-id', val.cartNo);
					rowTr.querySelector('.firstData').innerHTML = `<img src="productImg/${val.productImg}" alt="${val.productImg}" style="width: 50px;"> ${val.productName}</td>`;
					rowTr.querySelector('.basketprice').childNodes[1].textContent = val.price.numberFormat() + "원";
					console.log(rowTr);
					rowTr.querySelector('td.basketprice input').value = val.price;
					rowTr.querySelector('td.basketprice input').setAttribute('id', 'p_price'+ val.cartNo);
					rowTr.querySelector('div.updown input').value = val.qty;
					rowTr.querySelector('div.updown input').setAttribute('id','p_num'+val.cartNo)
					// event
					rowTr.querySelector('div.updown input').onkeyup = () => basket.changePNum(val.cartNo);
					rowTr.querySelector('.minusBtn').onclick = () => basket.changePNum(val.cartNo);
					rowTr.querySelector('.plusBtn').onclick = () => basket.changePNum(val.cartNo);
					// 개별합계
					rowTr.querySelector('td.sum').textContent = (val.qty * val.price).numberFormat() + "원";
					rowTr.querySelector('td.sum').setAttribute('id', 'p_sum' + val.cartNo)
					document.querySelector('#basket').append(rowTr);
				});
				basket.reCalc();
			})
			.catch(err => console.log(err));
	}, // end of list
	reCalc: function (){
		// 수량, 금액 합계 계산
		// 합계 자리에 출력
		document.querySelector('#sum_p_price h6:nth-child(2)').textContent = basket.cartTotal.numberFormat()+'원';
	},
	changePNum: function(no){
		console.log(event);
		let qty = -1;
			console.log(event.target.nodeName);
		if (event.target.nodeName == "BUTTON" || event.target.nodeName == "I") {
			console.log(event.target);
			if(event.target.className.indexOf("plus") != -1) {
				qty = 1;
			}
		else if (event.target.nodeName == "INPUT") {
			if(event.key == "ArrowUp") {
				qty = 1;
			}
		}
		price = document.querySelector('#p_price' + no).value;
		qtyElem = document.querySelector('#p_num' + no);
		sumElem = document.querySelector('#p_sum' + no);
		
		fetch('modCart.do', {
			method: 'post',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			body: 'no=' + no + '&qty=' + qty
		})
			.then(resolve => resolve.json())
			.then(result => {
				console.log(result)
				qtyElem.value = parseInt(qtyElem.value) + qty; // 수량 변경
				sumElem.innerText = (price * qty);
				
				basket.cartCount += qty;
				basket.cartTotal += (price * qty);
				basket.reCalc();
			}),
			err => console.log(err);
			
		}
		
	}

}
basket.list();
