<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw</title>
    <Style>
    h1{
  color:#FFD333;
  font-size:48px;
  letter-spacing:-3px;
  text-align:center;
  margin:120px 0 80px 0 ;
  transition:.2s linear;
}
    </Style>
</head>
<body>
    <div class="container">
        <!-- Heading -->
        <h1>Campcamp</h1>

        <!-- Withdraw Form -->
        <div class="withdraw-form">
            <h2>회원 탈퇴</h2>
            <form action="withdraw.do" method="post">
                <div>
                <label for="logId">아이디:</label>
                    <input type="text" minlength="5" name="userId" id="userId" value="${user.userId}" class="input"  />
                    <label for="password">비밀번호:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div>
                    <button type="submit">탈퇴하기</button>
                </div>
                <!-- 에러 메시지 출력 -->
                <c:if test="${not empty error}">
                    <p>${error}</p>
                </c:if>
                <!-- 성공 메시지 출력 -->
                <c:if test="${not empty message}">
                    <p>${message}</p>
                </c:if>
            </form>
        </div>
    </div>
</body>
</html>
