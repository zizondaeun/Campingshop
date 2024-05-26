<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <style>
        .table-container {
            width: 80%;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
        }
        .seldel {
            border: 1px solid grey;
            padding: 20px;
            font-size: 20px;
            background-color: white;
            color: black;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .seldel:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <h3 align="center">MY WISHLIST</h3>
    <div class="table-container">
        <div class="description">
            <span style="display: inline-block; width: 100%; font-size: 15px; padding: 10px; text-align: right;">
                <span>[${logId }]</span> 님의 관심 상품 목록입니다.
            </span>
        </div>
        <table class="table">
            <thead class="table-header">
                <tr>
                    <th scope="col"><input type="checkbox" id="chkAll"></th>
                    <th scope="col">사진</th>
                    <th scope="col">상품명</th>
                    <th scope="col">수량</th>
                    <th scope="col">가격</th>
                    <th scope="col">장바구니</th>
                    <th scope="col">삭제</th>
                </tr>
            </thead>
            <tbody class="table-body">
                <c:choose>
                    <c:when test="${empty list}">
                        <tr align="center">
                            <td colspan="7">조회된 결과가 없습니다</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="wish" items="${list }">
                            <tr>
                                <input type="hidden" value="${wish.productNo }" class="pno">
                                <td><input type="checkbox" id="chk"></td>
                                <td><img src="productImg/${wish.productImg }" width="100" height="100" />${wish.productImg }</td>
                                <td>${wish.productName }</td>
                                <td><input type="number" name="cnt" value="1" min="1" max="1" step="1">개</td>
                                <td>${wish.price }원</td>
                                <td><button type="button" class="cartBtn">CART</button></td>
                                <td><button type="button" class="delBtn">DELETE</button></td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        <div align="center">
            <button type="button" class="seldel">선택삭제</button>
        </div>
    </div>
    <script>
    	let userId = '${logId}';
    	console.log(userId + "555555");
        let btns = document.querySelectorAll('.delBtn');
        btns.forEach(function(btn) {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                let row = e.target.closest('tr');
                let productNo = row.querySelector('.pno').value;
                //함수호출
                if(deleteRow({userId: userId, productNo: productNo})){
                	row.remove();
                }
            });
        });
        //tr을 지우기 위한 함수
        async function deleteRow(param = {}){
        	 try {
        	        const response = await fetch('deleteMywish.do', {
        	            method: 'post',
        	            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        	            body: 'userId=' + param.userId + '&productNo=' + param.productNo
        	        });

        	        if (response.ok) {
        	            return true;
        	        } else {
        	            return false;
        	        }
        	    } catch (err) {
        	        console.error('Fetch error:', err);
        	        return false;
        	    }
        }
        
        document.querySelector('#chkAll').addEventListener('click', function(){
        	let chkAll = document.querySelector('#chkAll').checked; //true
        	let chks = document.querySelectorAll('#chk'); //배열
        	if(chkAll){
        		chks.forEach(chk => {
        			chk.checked = true;
        		})
        	}else{
        		chks.forEach(chk => {
        			chk.checked = false;
        		})
        	}
        })
        
        document.querySelector('.seldel').addEventListener('click', function(){
        	let chks = document.querySelectorAll('#chk');
        	chks.forEach(chk => {
        		if(chk.checked){
        			let row = chk.closest('tr');
        			let productNo = row.querySelector('.pno').value;
        			//위에서 만든 함수 호출
        			if(deleteRow({userId: userId, productNo: productNo})){
                    	row.remove();
                    }
        		}
        	})
        })
    </script>
</body>