/**
 * js/review.js
 */
let page = 1;
//document.querySelector('.reviewBtn').addEventListener('click', () => {
//	setTimeout(function() {
	showList();
//	console.log(document.querySelector('div.reviewTemplate'));
//}, 1000);
//})

function showList() {
	// 리뷰목록 초기화
	document.querySelectorAll('.reviewTemplate').forEach((tmpl, idx) => {
		if (idx >=1) {
			tmpl.remove();
		}
	})
	
	fetch(`reviewList.do?pno=${pno}&page=${page}`)
		.then(resolve => resolve.json())
		.then(result => {
			result.forEach(review => {
				const tmpl = makeTemplate(review);
				document.querySelector('.reviewHeader').appendChild(tmpl);
			})
			createPageList();
		})
		.catch(err => console.log(err));
}


function makeTemplate(review = {}) {
	console.log(review);
	let tmpl = document.querySelector('div.reviewTemplate').cloneNode(true);
	tmpl.style.display = 'block';
	tmpl.setAttribute('data-rno', review.reviewNo);
	tmpl.querySelector('.reviewer').innerHTML = `${review.userId}<small> - <i>${review.rdate}</i></small>`;
	tmpl.querySelector('.reviewContent').innerText = review.content;
	
	return tmpl;
}

// 댓글 페이징 생성.
let pagination = document.querySelector('div.pagination');

function makePageInfo() {
//	svc.getTotalCount(bno, // 첫번째 param
//					createPageList, // 두번째 param
//					err => console.log(err)	 // 세번째 param
//	)
	fetch(`getReviewTotalCnt.do?pno=${pno}`)
		.then(resolve => resolve.json())
		.then(createPageList)
		.catch(err => console.log(err));
}

function createPageList(result) {
	console.log(result);
	
	let totalCnt = result.totalCount;
	let startPage, endPage, realEnd;
	let prev, next;

	realEnd = Math.ceil(totalCnt / 5);
	endPage = Math.ceil(page / 5) * 5;
	startPage = endPage - 4;
	endPage = endPage > realEnd ? realEnd : endPage;
	prev = startPage > 1;
	next = endPage < realEnd;

	console.log(startPage, endPage, realEnd, prev, next);

	// a 태그 생성.
	pagination.innerHTML = "";
	// 이전페이지 여부
	if (prev) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', startPage - 1);
		aTag.setAttribute('href', '#');
		aTag.innerHTML = "&laquo;";
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지 이동하는걸 막는다
			page = e.target.dataset.page; // a 태그안에 있는 숫자의 값
			showList();
		})
		pagination.appendChild(aTag);
	}
	for (let pg = startPage; pg <= endPage; pg++) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', pg);
		aTag.setAttribute('href', pg);
		if (pg == page) {
			aTag.className = 'active';
		}
		aTag.innerHTML = pg;
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지 이동하는걸 막는다
			page = e.target.dataset.page; // a 태그안에 있는 숫자의 값
			showList();
		})
		pagination.appendChild(aTag);
	}
	// 이후페이지 여부
	if (next) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', endPage + 1);
		aTag.setAttribute('href', '#');
		aTag.innerHTML = "&raquo;";
		pagination.appendChild(aTag);
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지 이동하는걸 막는다
			page = e.target.dataset.page; // a 태그안에 있는 숫자의 값
			showList();
		})
		pagination.appendChild(aTag);
	}
}