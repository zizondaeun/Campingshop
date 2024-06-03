/**
 * 
 */

//document.querySelector(`button[data-id="${de}"]`)
document.querySelectorAll('.delBtn').forEach((val, idx) => {
	let allTd = document.querySelectorAll('tbody td:nth-of-type(5)');
	let allTr = document.querySelectorAll('tbody tr');
	let delBtn = document.querySelectorAll('.delBtn');
	val.addEventListener('click', function(e) {
		let deliNo = e.target.parentElement.parentElement.childNodes[1].innerText;
		let ev = e.target;
		fetch("deliveryState.do", {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `deliNo=${deliNo}`
		})
			.then(resolve => resolve.json())
			.then(result => {
				console.log(result);
				if (result.retCode == 'OK') {
					console.log(ev);
					ev.style.display = "none";
					ev.parentElement.previousElementSibling.innerText = '배송완료';
					
					
					
					
					/*for (let i = 0; i < allTd.length; i++) {
						if (allTd[i].innerHTML == '배송완료') {
							delBtn[i].style.display = "none";
						}
					}*/
				}
			})
	})

})



