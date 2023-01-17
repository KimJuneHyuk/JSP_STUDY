<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%
    boolean isLogin = false;
    Cookie[] cookies = request.getCookies();
    for (int i = 0; i < cookies.length; i++) {
        if (cookies[i].getName().equals("userID") && cookies[i].getValue() != null) {
            out.println(cookies[i].getValue() + " 님 반값습니다. <br>");
            isLogin = true;
        }
    }

    if (isLogin) {
        out.println("<a href='cookie_out.jsp'>로그아웃</a>");
    } else {
        response.sendRedirect("cookie.jsp");
    }
%>
</body>
</html>
