/**
 * js/category.js
 */

fetch('getCategory.do')
	.then(resolve => resolve.json())
	.then(result => {
		result.forEach(e => {
//			console.log(e);
//			console.log(e.parent);
			//			console.log(e.child[0]);
			let nav = document.querySelector('.categorynav');
			let pdiv = document.createElement('div');
			pdiv.className = 'nav-item dropdown dropright';
			let pa = document.createElement('a');
			let cdiv = document.createElement('div');
			pa.setAttribute('href', "#");
			pa.setAttribute('data-toggle', "dropdown");
			pa.className = 'nav-link dropdown-toggle';
			pa.innerHTML = `${e.parent} <i class="fa fa-angle-right float-right mt-1"></i>`;
			let ca;
			e.child.forEach(e => {
				ca = document.createElement('a');
//				console.log(e);
				cdiv.className = 'dropdown-menu position-absolute rounded-0 border-0 m-0';
				ca.className = 'dropdown-item';
				ca.setAttribute('href', `#`);
				ca.innerHTML = `${e}`;
				cdiv.appendChild(ca);
			})
			let i = 0;
			e.childCode.forEach(s => {
				cdiv.children[i].setAttribute('href',`productList.do?category=${s}`);
				i++;
			})
//			let i = 0;
//			e.childCode.forEach(e => {
//				document.querySelectorAll('.dropdown-item')
//				ca.setAttribute('href', `productList.do?catetory=${e}`);
//				cdiv.appendChild(ca);
//			})
			pdiv.appendChild(pa);
			pdiv.appendChild(cdiv);
			nav.appendChild(pdiv);
		})
	})
	.catch(error => console.log(error))