/**
 * 
 */

document.querySelector(`button[data-id="${de}"]`)
document.querySelector('.delBtn').addEventListener('click', function(e) {
	console.log(e.target.parentElement.parentElement.childNodes[1].innerText);
//	fetch("deliveryState.do", {
//		method: 'post',
//		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
//		body: `deliNo=${deliNo}`
//	})
//	.then
})