<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<%
    String id = (String) session.getAttribute("uID");
    if (id == null) {
        response.sendRedirect("login.jsp");
    } else {
        out.println(id + " 님 환영합니다.");
    }
%>

<a href="logout.jsp">로그아웃</a>


</body>
</html>
