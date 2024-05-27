<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Information</title>
</head>
<body>
    <div class="container">
        <!-- Heading -->
        <h1>Campcamp</h1>

        <!-- Links -->
        <ul class="links">
            <li>
                <a href="logForm.do" id="signin">SIGN IN</a>
            </li>
            <li>
                <a href="withdrawForm.do" id="signin">회원탈퇴</a>
            </li>
        </ul>

        <%-- Display user information if logged in --%>
        <% String userId = (String) session.getAttribute("logId"); %>
        <% if (userId != null) { %>
            <h2>Welcome to your MyPage, <%= userId %>!</h2>
            <%-- Here you can display the user's information using JSP expression tags --%>
            <%-- For example: --%>
            <p>User ID: <%= userId %></p>
            <p>User Name: <%= session.getAttribute("userName") %></p>
            <p>Email: <%= session.getAttribute("email") %></p>
            <p>Phone Number: <%= session.getAttribute("userTel") %></p>
            <p>Address: <%= session.getAttribute("address") %></p>
        <% } else { %>
            <%-- Redirect to login page if not logged in --%>
            <% response.sendRedirect("logForm.do"); %>
        <% } %>
    </div>
</body>
</html>
