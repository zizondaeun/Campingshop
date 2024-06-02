/**
 * 
 */

//document.querySelector(`button[data-id="${de}"]`)
document.querySelectorAll('.delBtn').forEach((val, idx)=> {
	val.addEventListener('click', function(e) {
		let deliNo = e.target.parentElement.parentElement.childNodes[1].innerText;
	fetch("deliveryState.do", {
		method: 'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: `deliNo=${deliNo}`
	})
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result);
		})
	})

})


