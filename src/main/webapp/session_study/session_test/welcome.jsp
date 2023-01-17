<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("uID");
    if (id == null) {
        response.sendRedirect("session.jsp");
    } else {
        out.println(id + " 님 환영합니다.");
    }
%>
<a href="session_out.jsp">로그아웃</a>
</body>
</html>
