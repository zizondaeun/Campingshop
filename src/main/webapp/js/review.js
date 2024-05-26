/**
 * js/review.js
 */
let page = 1;
showList();

function showList() {
	// 리뷰목록 초기화
	document.querySelectorAll('.reviewTemplate').forEach((tmpl, idx) => {
		if (idx >= 1) {
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
			makePageInfo();
		})
		.catch(err => console.log(err));
}


function makeTemplate(review = {}) {
	console.log(review);
	let tmpl = document.querySelector('div.reviewTemplate').cloneNode(true);
	tmpl.style.display = 'block';
	
	
	for(let i=0; i<review.rating; i++){
		let iStar = document.createElement('i');
		iStar.className = 'fas fa-star';
		tmpl.querySelector('.ratingStarList').appendChild(iStar);
	}
	for (let i=0; i<5-review.rating; i++){
		let iStar = document.createElement('i');
		iStar.className = 'far fa-star';
		tmpl.querySelector('.ratingStarList').appendChild(iStar);
	}
	
	tmpl.setAttribute('data-rno', review.reviewNo);
	tmpl.querySelector('.reviewer').innerHTML = `${review.userId}<small> - <i>${review.rdate}</i></small>`;
	tmpl.querySelector('.reviewContent').innerText = review.content;

	return tmpl;
}

// 댓글 페이징 생성.
let pagination = document.querySelector('ul.pagination');

function makePageInfo() {
	//	svc.getTotalCount(bno, // 첫번째 param
	//					createPageList, // 두번째 param
	//					err => console.log(err)	 // 세번째 param
	//	)
	fetch(`getReviewTotalCnt.do?pno=${pno}`)
		.then(resolve => {
			console.log(resolve);
			return resolve.json();
		})
		.then(result => {
			console.log(result);
			createPageList(result);
		})
		.catch(err => console.log(err));
}

function createPageList(result) {
	console.log(result);

	let totalCnt = result.totalCount;
	let startPage, endPage, realEnd;
	let prev, next;

	realEnd = Math.ceil(totalCnt / 4);
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
		let liTag = document.createElement('li');
		liTag.className = 'page-item';
		let aTag = document.createElement('a');
		aTag.className = 'page-link';
		aTag.setAttribute('data-page', startPage - 1);
		aTag.setAttribute('href', '#');
		aTag.innerHTML = "&laquo;";
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지 이동하는걸 막는다
			page = e.target.dataset.page; // a 태그안에 있는 숫자의 값
			showList();
		})
		liTag.appendChild(aTag);
		pagination.appendChild(liTag);
	}
	for (let pg = startPage; pg <= endPage; pg++) {
		let liTag = document.createElement('li');
		liTag.className = 'page-item';
		let aTag = document.createElement('a');
		aTag.className = 'page-link';
		aTag.setAttribute('data-page', pg);
		aTag.setAttribute('href', pg);
		if (pg == page) {
			liTag.className = 'page-item active';
		}
		aTag.innerHTML = pg;
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지 이동하는걸 막는다
			page = e.target.dataset.page; // a 태그안에 있는 숫자의 값
			showList();
		})
		liTag.appendChild(aTag);
		pagination.appendChild(liTag);
	}
	// 이후페이지 여부
	if (next) {
		let liTag = document.createElement('li');
		liTag.className = 'page-item';
		let aTag = document.createElement('a');
		aTag.className = 'page-link';
		aTag.setAttribute('data-page', endPage + 1);
		aTag.setAttribute('href', '#');
		aTag.innerHTML = "&raquo;";
		liTag.appendChild(aTag);
		pagination.appendChild(liTag);
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지 이동하는걸 막는다
			page = e.target.dataset.page; // a 태그안에 있는 숫자의 값
			showList();
		})
		pagination.appendChild(aTag);
	}
}


/////////////////// 리뷰 별찍기
const ratingStars = [...document.getElementsByClassName("ratingStar")];

function executeRating(stars) {
	const starClassActive = "ratingStar fas fa-star";
	const starClassInactive = "ratingStar far fa-star";
	const starsLength = stars.length;
	let i;

	stars.map((star) => {
		console.log(star);
		star.onclick = () => {
			i = stars.indexOf(star);
			if (star.className === starClassInactive) {
				for (i; i >= 0; --i) {
					stars[i].className = starClassActive;
				}
			} else {
				for (i; i < starsLength; ++i) {
					stars[i].className = starClassInactive;
				}
			}
			let rating = 0;
			document.querySelectorAll('.ratingStar').forEach((val, idx) => {
					console.log(val);
				if (val.className == 'ratingStar fas fa-star') {
					rating++;
				}
				document.querySelector('#rating').value = rating;
			})

		};
	});
}
executeRating(ratingStars);

document.getElementById('addReview').addEventListener('click', function(e) {

	let rating = document.getElementById('rating').value;
	let content = document.getElementById('message').value;
	if (content == "") {
		alert("리뷰를 입력해주세요.");
	} else if (writer == "") {
		alert("로그인후 이용해주세요.")
	} else if (rating == 0){
		alert("평점을 입력하세요.")
	} else {
		fetch('addReview.do', {
			method: 'post',
			headers: {'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'pno=' + pno + '&user=' + writer + '&content=' + content + '&rating=' + rating
		})
			.then(resolve => resolve.json())
			.then(result => {
				if (result.retCode == 'OK') {
					//location.reload();
					showList();
					alert('등록완료');
				} else if (result.retCode == 'NG') {
					alert('등록실패');
				} else {
					alert('알수없는 반환값');
				}
				document.getElementById('message').value = "";
			})
			.catch(err => console.log(err))

	}
})
