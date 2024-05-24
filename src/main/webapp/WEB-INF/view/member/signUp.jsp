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
       <style>
    body{
  font-family: 'Montserrat', sans-serif;
  background:white;
}

.container{
  display:block;
  max-width:680px;
  width:80%;
  margin:120px auto;
}

h1{
  color:#e91e63;
  font-size:48px;
  letter-spacing:-3px;
  text-align:center;
  margin:120px 0 80px 0 ;
  transition:.2s linear;
}

.links{
  list-style-type:none;
  li{
     display:inline-block;
     margin:0 20px 0 0;
     transition:.2s linear;
     &:nth-child(2){
        opacity : .6;
        &:hover{
           opacity : 1;
        }
     }
     &:nth-child(3){
        opacity : .6;
        float:right;
         &:hover{
           opacity : 1;
         }
     }
     a{
        text-decoration:none;
        color:#0f132a;
        font-weight:bolder;
        text-align:center;
        cursor : pointer;
     }
   }
}

form{
  width:100%;
  max-width:680px;
  margin:40px auto 10px;
  .input__block{
     margin:20px auto;
     display:block;
     position:relative;
     &.first-input__block{
        &::before{
          content:"";
          position:absolute;
          top:-15px;
          left:50px;
          display:block;
          width:0;
          height:0;
        background:transparent;
          border-left:15px solid transparent;
          border-right:15px solid transparent;
          border-bottom:15px solid rgba(#0f132a,.1);
          transition:.2s linear;
        }
     }
     &.signup-input__block{
      &::before{
        content:"";
        position:absolute;
        top:-15px;
        left:150px;
        display:block;
        width:0;
        height:0;
        background:transparent;
        border-left:15px solid transparent;
        border-right:15px solid transparent;
        border-bottom:15px solid rgba(#0f132a,.1);
        transition:.2s linear;
        }
     }
     input{
        display:block;
        width:90%;
        max-width:680px;
        height:50px;
        margin:0 auto;
        border-radius:8px;
        border:none;
        background: #DCEBFF;
        color : rgba(#0f132a,.3);
        padding:0 0 0 15px;
        font-size:14px;
        font-family: 'Montserrat', sans-serif;
        &:focus,
        &:active{
          outline:none;
          border:none;
          color : rgba(#0f132a,1);
        }
       &.repeat__password{
         opacity : 0;
         display : none;
         transition:.2s linear;
       }
     }
  }
  
  .signin__btn{
     background:#e91e63;
     color:white;
     display:block;
     width:92.5%;
     max-width:680px;
     height:50px;
     border-radius:8px;
     margin:0 auto;
     border:none;
     cursor:pointer;
     font-size:14px;
     font-family: 'Montserrat', sans-serif;
     box-shadow:0 15px 30px rgba(#e91e63,.36);
    transition:.2s linear;
    &:hover{
      box-shadow:0 0 0 rgba(#e91e63,.0);
    }
  }
}

.separator{
  display:block;
  margin:30px auto 10px;
  text-align:center;
  height:40px;
  position:relative;
  background:transparent;
  color: rgba(#0f132a,.4);
  font-size:13px;
  width:90%;
  max-width:680px;
  &::before{
    content:"";
    position:absolute;
    top:8px;
    left:0;
    background: rgba(#0f132a,.2);
    height:1px;
    width:45%;
  }
  &::after{
    content:"";
    position:absolute;
    top:8px;
    right:0;
    background: rgba(#0f132a,.2);
    height:1px;
    width:45%;
  }
}

.google__btn,
.github__btn{
   display:block;
   width:90%;
   max-width:680px;
   margin:20px auto;
   height:50px;
   cursor:pointer;
   font-size:14px;
   font-family: 'Montserrat', sans-serif;
   border-radius:8px;
   border:none;
   line-height:40px;
   &.google__btn{
      background:#5b90f0;
      color:white;
      box-shadow:0 15px 30px rgba(#5b90f0,.36);
      transition:.2s linear;
      .fa{
          font-size:20px;
          padding:0 5px 0 0 ;
      }
     &:hover{
       box-shadow:0 0 0 rgba(#5b90f0,.0);
     }
   }
   &.github__btn{
      background:#25282d;
      color:white;
      box-shadow:0 15px 30px rgba(#25282d,.36);
      transition:.2s linear;
      .fa{
          font-size:20px;
          padding:0 5px 0 0 ;
      }
     &:hover{
       box-shadow:0 0 0 rgba(#25282d,.0);
     }
   }
}

footer{
  p{
    text-align:center;
    .fa{
      color: #e91e63;
    }
    a{
      text-decoration:none;
      font-size:17px;
      margin:0 5px;
      .fa-facebook{
         color:#3b5998;
      }
      .fa-twitter{
         color:#1da1f2;
      }
      .fa-instagram{
        color:#f77737;
      }
      .fa-linkedin{
        color:#0077b5;
      }
      .fa-behance{
        color:#1769ff;
      }
    }
    
  }
}
    </style>
</head>
<body>
<div class="container">
  <!-- Heading -->
  <h1>Campcamp</h1>
  
  <!-- Links -->
  <ul class="links">
    <li>
      <a href="#" id="signin">SIGN UP</a>
    </li>
    <li>
      <a href="login.do" id="signin">SIGN IN</a>
    </li>
    
  </ul>
    <form action="signIn.do" method="post">
    <!-- email input -->
    <div class="first-input input__block first-input__block">
       <input type = "text" minlength = "5" name = "userId"id="userId" placeholder="아이디" class="input" />
       </div>
       <div class="first-input input__block first-input__block">
	   <input type="button" onclick="checkUserId()" value="중복 확인" class="btn btn-primary btn-sm">
    </div>
    
    <!-- password input -->
    <div class="input__block">
       <input type="text" minlength = "5" name="userName" placeholder="비밀번호" class="input" id="password"    />
    </div>
	<div class="input__block">
       <input type="email" name="email" placeholder="email" placeholder="Password" class="input" id="password"    />
    </div>
	<div class="input__block">
       <input type="text" name="userTel" placeholder="전화번호" placeholder="Password" class="input" id="password"    />
    </div>
    <!-- repeat password input -->
    <div class="input__block">
       <input type="password" placeholder="Repeat password" class="input repeat__password" id="repeat__password"    />
    </div>
	<div class="input__block">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample6_address" name = "address" placeholder="주소"><br>
    <!-- sign in button -->
	</div>
	<div class="input__block">
    <input type="submit" value="가입하기" id="submitButton" disabled>
	</div>
  </form>
  
  </div>
  <% // URL에서 error 매개변수 값을 가져옴
            String error = request.getParameter("error");
            if (error != null && !error.isEmpty()) {
        %>
            <div style="color: red; text-align: center;"><%= error %></div>
        <% } %>
  <script>
  $(document).ready(function(){
	    let signup = $(".links").find("li").find("#signup") ; 
	    let signin = $(".links").find("li").find("#signin") ;
	    let reset  = $(".links").find("li").find("#reset")  ; 
	    let first_input = $("form").find(".first-input");
	    let hidden_input = $("form").find(".input__block").find("#repeat__password");
	    let signin_btn  = $("form").find(".signin__btn");
	  
	    //----------- sign up ---------------------
	    signup.on("click",function(e){
	      e.preventDefault();
	      $(this).parent().parent().siblings("h1").text("SIGN UP");
	      $(this).parent().css("opacity","1");
	      $(this).parent().siblings().css("opacity",".6");
	      first_input.removeClass("first-input__block").addClass("signup-input__block");
	      hidden_input.css({
	        "opacity" : "1",
	        "display" : "block"
	      });
	      signin_btn.text("Sign up");
	    });
	    
	  
	   //----------- sign in ---------------------
	   signin.on("click",function(e){
	      e.preventDefault();
	      $(this).parent().parent().siblings("h1").text("SIGN IN");
	      $(this).parent().css("opacity","1");
	      $(this).parent().siblings().css("opacity",".6");
	      first_input.addClass("first-input__block")
	        .removeClass("signup-input__block");
	      hidden_input.css({
	        "opacity" : "0",
	        "display" : "none"
	      });
	      signin_btn.text("Sign in");
	    });
	   
	   //----------- reset ---------------------
	   reset.on("click",function(e){
	     e.preventDefault();
	     $(this).parent().parent().siblings("form")
	     .find(".input__block").find(".input").val("");
	   })
	});
  
  </script>
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
    	    xhr.open("POST", "./checkUserId.do");
    	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    	    xhr.onreadystatechange = function () {
    	        if (xhr.readyState === 4 && xhr.status === 200) {
    	            var response = JSON.parse(xhr.responseText);
    	            if (response.status === "DUPLICATED") {
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
