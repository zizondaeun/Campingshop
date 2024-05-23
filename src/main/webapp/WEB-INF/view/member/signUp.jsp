<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>네이버 회원가입 폼</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');

        * {
            box-sizing: border-box;
            outline: none;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 14px;
            background-color: #f5f6f7;
            line-height: 1.5em;
            color: #222;
            margin: 0;
        }

        a {
            text-decoration: none;
            color: #222;
        }

        .member {
            width: 400px;
            margin: auto;
            padding: 0 20px;
            margin-bottom: 20px;
        }

        .member .logo {
            display: block;
            margin: 50px auto;
        }

        .member .field {
            margin: 5px 0;
        }

        .member b {
            display: block;
            margin-bottom: 5px;
        }

        .member input:not(input[type=radio]), .member select {
            border: 1px solid #dadada;
            padding: 15px;
            width: 100%;
            margin-bottom: 5px;
        }

        .member input[type=button], .member input[type=submit] {
            background-color: #2db400;
            color: #fff;
        }

        .member input:focus, .member select:focus {
            border: 1px solid #2db400;
        }

        .field.birth div {
            display: flex;
            gap: 10px;
        }

        .field.tel-number div {
            display: flex;
        }

        .field.tel-number div input:nth-child(1) {
            flex: 2;
        }

        .field.tel-number div input:nth-child(2) {
            flex: 1;
        }

        .field.gender div {
            border: 1px solid #dadada;
            padding: 15px 5px;
            background-color: #fff;
        }

        .placehold-text {
            display: block;
            position: relative;
        }

        .placehold-text:before {
            content: "@naver.com";
            position: absolute;
            right: 20px;
            top: 13px;
            pointer-events: none;
        }

        .userpw {
            background: url(./images/images2/icon-01.png) no-repeat center right 15px;
            background-size: 20px;
            background-color: #fff;
        }

        .userpw-confirm {
            background: url(./images/images2/icon-02.png) no-repeat center right 15px;
            background-size: 20px;
            background-color: #fff;
        }

        .member-footer {
            text-align: center;
            font-size: 12px;
            margin-top: 20px;
        }

        .member-footer div a:hover {
            text-decoration: underline;
            color: #2db400;
        }

        .member-footer div a:after {
            content: '|';
            font-size: 10px;
            color: #bbb;
            margin-right: 5px;
            margin-left: 7px;
            display: inline-block;
            transform: translateY(-1px);
        }

        .member-footer div a:last-child:after {
            display: none;
        }

        @media (max-width: 768px) {
            .member {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form action="signIn.do" method="post">
        <div class="member">
            <!-- 1. 로고 -->
            <!-- 2. 필드 -->
            <div class="field">
                <b>아이디</b>
                <span class="placehold-text">
                	<input type = "text" name = "userId"id="userId">
                    <button type="button" onclick="checkUserId()">중복 체크</button>
                </span>
                 <div id="userIdMessage" style="color: red;"></div>            
            </div>
            <div class="field">
                <b>비밀번호</b>
                <input class="userpw" type="password" name="passWord">
            </div>
            <div class="field">
                <b>이름</b>
                <input type="text" name="userName">
            </div>
            <div class="field">
                <b>본인 확인 이메일<small>(선택)</small></b>
                <input type="email" name="email" placeholder="선택입력">
            </div>
            <div class="field">
                <b>전화번호</b>
                <input type="text" name="userTel">
            </div>
            <div class="field">
           
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample6_address" name = "address" placeholder="주소"><br>

            </div>
            <input type="submit" value="가입하기" id="submitButton" disabled>
            <!-- 7. 푸터 -->
            <div class="member-footer">
                <div>
                    <a href="#none">이용약관</a>
                    <a href="#none">개인정보처리방침</a>
                    <a href="#none">책임의 한계와 법적고지</a>
                    <a href="#none">회원정보 고객센터</a>
                </div>
               
            </div>
        </div>
        <% // URL에서 error 매개변수 값을 가져옴
            String error = request.getParameter("error");
            if (error != null && !error.isEmpty()) {
        %>
            <div style="color: red; text-align: center;"><%= error %></div>
        <% } %>
    </form>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    if (data.userSelectedType === 'R') {
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }                    
                    } else {                      
                    }        
                    document.getElementById("sample6_address").value = addr;
                }
            }).open();
        }
    </script>
    
      <script>
   
      function checkUserId() {
          var userId = document.getElementsByName("userId")[0].value;

          // AJAX 요청으로 서버에 아이디 중복 체크 요청
          // 서버 응답에 따라 아이디가 존재하면 버튼을 비활성화하고, 존재하지 않으면 버튼을 활성화
          var xhr = new XMLHttpRequest();
          xhr.open("POST", true);
          xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
          xhr.onreadystatechange = function () {
              if (xhr.readyState === 4 && xhr.status === 200) {
                  var response = JSON.parse(xhr.responseText);
                  if (response.exists) {
                      alert("아이디가 이미 존재합니다.");
                      document.getElementById("submitButton").disabled = true;
                  } else {
                      alert("사용 가능한 아이디입니다.");
                      document.getElementById("submitButton").disabled = false;
                  }
              }
          };
          xhr.send("userId=" + userId);
      }
 
</script>
</body>
</html>
