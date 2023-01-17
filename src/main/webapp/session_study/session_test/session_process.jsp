<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String id = request.getParameter("id");
  String pw = request.getParameter("password");

  if (id.equals("test") && pw.equals("1234")) {
    session.setAttribute("uID", id);
    response.sendRedirect("welcome.jsp");
  } else {
    response.sendRedirect("session.jsp");
  }
%>

</body>
</html>
