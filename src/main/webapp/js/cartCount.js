/**
 * js/cartCount.js
 */

 fetch('userCartCnt.do')
 	.then(resolve => resolve.json())
 	.then(result => {
		document.querySelector('#menuCartCnt').innerText = result.retCode;
		document.querySelector('#headerCartCnt').innerText = result.retCode;
	})