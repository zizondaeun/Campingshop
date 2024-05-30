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
	cartTotalDiscount: 0, // 전체할인금액

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
					basket.cartTotal += val.qty * val.price;
					basket.cartTotalDiscount += val.qty *(val.discount);
					const rowTr = document.querySelector('tr[data-id="0"]').cloneNode(true);
					rowTr.style.display = 'table-row';
					rowTr.setAttribute('data-id', val.cartNo);
					rowTr.querySelector('.firstData').innerHTML = `<img src="productImg/${val.productImg}" alt="${val.productImg}" style="width: 50px;"> ${val.productName}</td>`;
					rowTr.querySelector('.basketprice').childNodes[1].textContent = val.price.numberFormat() + "원";
					rowTr.querySelector('td.basketprice input').value = val.price;
					rowTr.querySelector('td.basketprice input').setAttribute('id', 'p_price'+ val.cartNo);
					rowTr.querySelector('.basketdiscount').childNodes[1].textContent = val.discount.numberFormat() + "원";
					rowTr.querySelector('td.basketdiscount input').value = val.discount;
					rowTr.querySelector('td.basketdiscount input').setAttribute('id', 'p_discount'+ val.cartNo);
					rowTr.querySelector('div.updown input').value = val.qty;
					rowTr.querySelector('div.updown input').setAttribute('id','p_num'+val.cartNo)
					// event
					rowTr.querySelector('div.updown input').onkeyup = () => basket.changePNum(val.cartNo);
					rowTr.querySelector('.minusBtn').onclick = () => basket.changePNum(val.cartNo);
					rowTr.querySelector('.plusBtn').onclick = () => basket.changePNum(val.cartNo);
					// 개별합계
					rowTr.querySelector('td.sum').textContent = (val.qty * (val.price-val.discount)).numberFormat() + "원";
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
		console.log(basket.cartTotal)
		document.querySelector('#sum_p_price h6:nth-child(2)').textContent = basket.cartTotal.numberFormat()+'원';
		console.log(basket.cartTotalDiscount);
		document.querySelector('#sum_p_discount h6:nth-child(2)').textContent = "-"+ Number(basket.cartTotalDiscount).numberFormat()+'원';
		document.querySelector('#sum_p_result h5:nth-child(2)').textContent = (basket.cartTotal - Number(basket.cartTotalDiscount)).numberFormat()+'원';
	},
	changePNum: function(no){
		console.log(event);
		let qty = -1;
			console.log(event.target.nodeName);
		if (event.target.nodeName == "BUTTON" || event.target.nodeName == "I") {
			console.log(event.target);
			console.log(event.target.className)
			if(event.target.className.indexOf("plus") != -1) {
				qty = 1;
			}
		else if (event.target.nodeName == "INPUT") {
			if(event.key == "ArrowUp") {
				qty = 1;
			}
		}
		price = document.querySelector('#p_price' + no).value;
		discount = Number(document.querySelector('#p_discount' + no).value);
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
				console.log(qtyElem);
				console.log(sumElem);
				qtyElem.value = parseInt(qtyElem.value) + qty; // 수량 변경
				sumElem.innerText = ((price-discount) * qtyElem.value).numberFormat() + "원";
				
				basket.cartCount += qty;
				basket.cartTotal += (price * qty);
				basket.cartTotalDiscount += (discount * qty)
				basket.reCalc();
			}),
			err => console.log(err);
			
		}
		
	},
	delItem: function(){
		let no;
		let removeEle;
		if(event.target.nodeName == "BUTTON") {
			no = event.target.parentElement.parentElement.dataset.id;
			removeEle = event.target.parentElement.parentElement;
		} else {
			no = event.target.parentElement.parentElement.parentElement.dataset.id;
			removeEle = event.target.parentElement.parentElement.parentElement;
		}
		console.log(removeEle)
		fetch('removeCart.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'no=' + no
		})
			.then(resolve => resolve.json())
			.then((result) => {
				let price = document.querySelector('#p_price' + no).value; // 단가
				let qty = document.querySelector('#p_num' + no).value; // 현재수량
				let discount = document.querySelector('#p_discount' + no).value; // 현재수량
				// 합계반영
				basket.cartCount -= qty;
				basket.cartTotal -= (price * qty);
				basket.cartTotalDiscount -= (discount * qty)
				basket.reCalc();
				
				removeEle.remove();
			})
			.catch(err => console.log(err));
	}

}

document.querySelector('#orderBtn').addEventListener('click', function(){
	val = '';
	
	
	document.querySelectorAll('#basket tr').forEach((item, idx) => {
		let tr = item;
		let cartNo = tr.getAttribute('data-id');
		
		val += cartNo + ',';
		console.log(val);
	})
	let form = document.createElement('form');
	form.setAttribute('action', 'order.do');
	form.setAttribute('mothod', 'post');
	let input = document.createElement('input');
	input.setAttribute('name', 'cno');
	input.value = val;
	
	form.appendChild(input);
	
	document.querySelector('body').appendChild(form);
	
	form.submit();
	
	
})

basket.list();
